# Example: Simple Feature — User Search API Endpoint

This example demonstrates a complete ADD cycle for a straightforward task: adding a search endpoint to a Node.js/Express API.

---

## Phase 1: SCOPE — Agent Brief

**Task ID**: ADD-001
**Intent**: The agent must create a GET `/api/users/search` endpoint that accepts a `q` query parameter and returns matching users by name or email.

**Non-Goals**:
- Must NOT modify existing endpoints.
- Must NOT add pagination (separate task).
- Must NOT add authentication (already handled by middleware).

**Output Format**: Single TypeScript file (`src/routes/userSearch.ts`)

**Success Criteria**:
- [ ] Endpoint responds to `GET /api/users/search?q=term`
- [ ] Searches across `name` and `email` fields
- [ ] Returns JSON array of matching users
- [ ] Returns empty array for no matches (not 404)
- [ ] Returns 400 for missing `q` parameter
- [ ] Case-insensitive search

**Complexity**: Single-shot

---

## Phase 2: FRAME — Context Pack

**Relevant Files**:
| File | Role |
|---|---|
| `src/routes/users.ts` | Existing user routes — follow same patterns |
| `src/models/User.ts` | User model with schema definition |
| `src/middleware/auth.ts` | Auth middleware (already applied at router level) |
| `src/types/api.ts` | API response types |

**Domain Rules**:
- All routes follow the pattern in `users.ts` (Express Router, async handlers, try/catch).
- All responses use the `ApiResponse<T>` type wrapper.
- Error handling uses `AppError` class.

**Technical Constraints**:
- TypeScript strict mode
- Express 4.x
- Prisma ORM for database queries
- Node 20+

**Prior Decisions**:
- We use Prisma's `contains` filter for text search (decided in sprint 3 — full-text search is future work).

---

## Phase 3: CONSTRAIN — Constraint Sheet

**Format Constraints**:
| Constraint | Spec |
|---|---|
| File | `src/routes/userSearch.ts` |
| Export | Named export `userSearchRouter` (Express Router) |
| Style | Matches patterns in `users.ts` |

**Must**:
- [ ] Use Prisma `where` clause with `OR` and `contains`
- [ ] Use `ApiResponse<User[]>` return type
- [ ] Use `AppError` for error cases
- [ ] Trim and lowercase the query parameter

**Must NOT**:
- [ ] Must NOT use raw SQL
- [ ] Must NOT return sensitive fields (password, tokens)
- [ ] Must NOT modify `users.ts`

**Acceptance Criteria**:
| # | Criterion |
|---|---|
| AC-1 | GET `/api/users/search?q=john` returns users with "john" in name or email |
| AC-2 | GET `/api/users/search?q=JOHN` returns same results (case-insensitive) |
| AC-3 | GET `/api/users/search?q=xyz` returns `{ data: [], count: 0 }` |
| AC-4 | GET `/api/users/search` (no q) returns 400 with error message |
| AC-5 | Response excludes `password` and `refreshToken` fields |
| AC-6 | TypeScript compiles without errors |

---

## Phase 4: EXECUTE

**Prompt used**:
```
Create a user search endpoint. 

Task: GET /api/users/search?q=term that searches users by name or email.

Follow the exact patterns from src/routes/users.ts. Use Prisma contains filter.
Return ApiResponse<User[]>. Use AppError for errors.

Constraints:
- File: src/routes/userSearch.ts, named export userSearchRouter
- Case-insensitive search using Prisma mode: 'insensitive'
- Return 400 for missing q parameter
- Exclude password and refreshToken from response using Prisma select
- Return empty array (not 404) for no matches
- Do NOT modify any existing files
```

**Model**: Claude Sonnet 4 via Claude Code
**Timestamp**: 2025-01-15 10:32 UTC

**Result**: Agent produced a 42-line TypeScript file.

---

## Phase 5: VERIFY — Validation Checklist

| # | Criterion | Result |
|---|---|---|
| AC-1 | Search by name/email | ✅ PASS |
| AC-2 | Case-insensitive | ✅ PASS — uses `mode: 'insensitive'` |
| AC-3 | Empty result returns `[]` | ✅ PASS |
| AC-4 | Missing `q` returns 400 | ✅ PASS |
| AC-5 | Sensitive fields excluded | ✅ PASS — uses Prisma `select` |
| AC-6 | TypeScript compiles | ✅ PASS |

**Hallucination check**: ✅ None — all imports exist, all types are real.
**Scope check**: ✅ — no other files modified, no extra features.
**Automated checks**: lint ✅, typecheck ✅, build ✅

**Verdict**: ✅ PASS

---

## Phase 6: CONSOLIDATE

**Final Status**: PASS
**Iterations**: 1 (first-pass success)
**Duration**: 8 minutes total (5 min prep, 1 min execution, 2 min verification)

**Learnings**:
- Providing the existing route file as a reference pattern was highly effective — the agent matched the style exactly.
- Explicitly mentioning `mode: 'insensitive'` in constraints saved a verification round.

**Pattern extracted**: When adding a new route, always include an existing route file as a style reference in the Context Pack.

---

## Summary

This example shows that a simple task with tight constraints achieves first-pass success. The 5 minutes spent on preparation (brief + constraints) saved an estimated 15-20 minutes of back-and-forth that would have been needed without ADD.
