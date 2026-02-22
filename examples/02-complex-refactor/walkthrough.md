# Example: Complex Refactor — Migrating Auth Module from Callbacks to Async/Await

This example demonstrates a multi-iteration ADD cycle where the first execution fails, a Failure Review is conducted, and the cycle succeeds on the second iteration.

---

## Phase 1: SCOPE — Agent Brief

**Task ID**: ADD-007
**Intent**: The agent must refactor `src/auth/authService.ts` from callback-based patterns to async/await, preserving all existing behavior and maintaining the public API surface.

**Non-Goals**:
- Must NOT change the public interface (function signatures, return types).
- Must NOT refactor error handling patterns (separate task).
- Must NOT update tests (separate task — tests validate behavior is preserved).
- Must NOT touch files outside `src/auth/`.

**Output Format**: Modified `src/auth/authService.ts`

**Success Criteria**:
- [ ] All callback patterns replaced with async/await
- [ ] Public API (exported function signatures) unchanged
- [ ] All 23 existing tests pass without modification
- [ ] No new dependencies introduced
- [ ] TypeScript compiles without errors

**Complexity**: Multi-step (one cycle, but requires careful incremental changes)

---

## Phase 2: FRAME — Context Pack

**Relevant Files**:
| File | Role |
|---|---|
| `src/auth/authService.ts` | Target file (312 lines, 8 exported functions) |
| `src/auth/types.ts` | Auth types and interfaces |
| `tests/auth/authService.test.ts` | 23 tests that must continue to pass |
| `src/auth/tokenManager.ts` | Dependency — already uses async/await |
| `src/auth/sessionStore.ts` | Dependency — already uses async/await |

**Domain Rules**:
- Auth functions are called by middleware — they must remain compatible.
- Some callbacks use error-first pattern (`(err, result) => {}`)
- Some use Promise wrappers around callbacks.

**Prior Decisions**:
- We're migrating module-by-module to async/await (decided Q4 2024).
- `tokenManager.ts` and `sessionStore.ts` were already migrated and can serve as patterns.

---

## Phase 3: CONSTRAIN — Constraint Sheet

**Must**:
- [ ] Replace all `callback(err, result)` patterns with `async/await`
- [ ] Replace all `new Promise((resolve, reject) => ...)` wrappers with direct `await`
- [ ] Keep all exported function names identical
- [ ] Keep all parameter types identical
- [ ] Return types change from `void` (callback) to `Promise<T>` where `T` matches the callback's result type

**Must NOT**:
- [ ] Must NOT change function names
- [ ] Must NOT add or remove exported functions
- [ ] Must NOT modify `types.ts`, `tokenManager.ts`, or `sessionStore.ts`
- [ ] Must NOT add new npm dependencies
- [ ] Must NOT change the order of functions in the file

**Acceptance Criteria**:
| # | Criterion |
|---|---|
| AC-1 | Zero callback patterns remain in the file |
| AC-2 | All 8 exported functions are preserved with same names |
| AC-3 | All 23 tests pass (`npm test -- auth`) |
| AC-4 | `npx tsc --noEmit` succeeds |
| AC-5 | No new imports added |
| AC-6 | File length within ±10% of original (no major structural changes) |

---

## Phase 4: EXECUTE — Iteration 1

**Prompt**: [Referenced brief, context pack, and constraint sheet files]

**Model**: Claude Sonnet 4 via Claude Code
**Timestamp**: 2025-01-20 14:15 UTC

---

## Phase 5: VERIFY — Iteration 1

| # | Criterion | Result |
|---|---|---|
| AC-1 | Zero callbacks remain | ✅ PASS |
| AC-2 | All 8 functions preserved | ✅ PASS |
| AC-3 | All 23 tests pass | ❌ **FAIL** — 3 tests fail |
| AC-4 | TypeScript compiles | ✅ PASS |
| AC-5 | No new imports | ✅ PASS |
| AC-6 | File length ±10% | ✅ PASS |

**Verdict**: ❌ FAIL

---

## Failure Review — R1

**Failure Description**: Three tests fail because `validateSession()` now returns a rejected Promise instead of throwing synchronously. The tests use `expect(() => validateSession(badToken)).toThrow()` which doesn't catch async rejections.

**Root Cause Phase**: CONSTRAIN

**Root Cause Detail**: The constraint "All 23 tests pass without modification" was correct, but the Constraint Sheet didn't specify that synchronous throw behavior must be preserved where tests expect it. The agent correctly converted the function to async but changed the error mechanism from synchronous throw to Promise rejection.

**What the agent did wrong**: Converted `throw new AuthError()` to `return Promise.reject(new AuthError())` inside an async function — technically correct async/await, but changed observable behavior.

**What the process did wrong**: The Constraint Sheet should have included: "For functions tested with synchronous `toThrow()`, the synchronous throw behavior must be preserved even within the async function, OR the function should remain synchronous if it doesn't actually need async."

**Correction Plan**:

| Phase | Change |
|---|---|
| CONSTRAIN | Add constraint: "`validateSession()` must throw synchronously for invalid tokens (not return rejected Promise), because callers and tests depend on synchronous throw behavior. If a function doesn't actually use await, it should not be made async." |

**Pattern Detected**: First occurrence. But worth adding to templates: "When refactoring to async/await, identify functions that throw synchronously and are tested with `toThrow()` — these may not need async conversion."

---

## Phase 4 (again): EXECUTE — Iteration 2

**Change made**: Updated Constraint Sheet with the additional constraint about synchronous throw behavior.

**Timestamp**: 2025-01-20 14:42 UTC

---

## Phase 5 (again): VERIFY — Iteration 2

| # | Criterion | Result |
|---|---|---|
| AC-1 | Zero callbacks remain | ✅ PASS |
| AC-2 | All 8 functions preserved | ✅ PASS |
| AC-3 | All 23 tests pass | ✅ PASS |
| AC-4 | TypeScript compiles | ✅ PASS |
| AC-5 | No new imports | ✅ PASS |
| AC-6 | File length ±10% | ✅ PASS |

**Verdict**: ✅ PASS

---

## Phase 6: CONSOLIDATE

**Final Status**: PASS (iteration 2)
**Iterations**: 2
**Duration**: 35 minutes total (15 min prep, 5 min exec ×2, 5 min verify ×2, 5 min failure review)

**Learnings**:
1. Async/await refactoring requires analyzing test expectations, not just code patterns.
2. The Failure Review correctly identified CONSTRAIN as the root cause — the agent performed correctly given its constraints; the constraints were incomplete.
3. Adding the synchronous-throw constraint to the template library would prevent this in future refactors.

**Pattern extracted**: Added to project templates: "For async/await refactoring, identify all `toThrow()` tests and decide whether synchronous behavior must be preserved."

---

## Summary

This example shows ADD's failure handling in action. The first-pass failure was not an agent failure — it was a constraint gap. The Failure Review identified this precisely, the Constraint Sheet was updated with one specific addition, and the second iteration succeeded.

Without ADD, the typical response would have been: "The agent messed up the refactor, let me try again" (AP-2: Pray-and-Retry). With ADD, the response was: "My constraints missed an edge case. Let me fix that and re-run."

**Total overhead of ADD process**: ~15 minutes of preparation + 5 minutes of review.
**Estimated time without ADD**: 60-90 minutes of unstructured back-and-forth.
