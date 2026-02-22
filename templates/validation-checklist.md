# Validation Checklist

| Field | Value |
|---|---|
| **Task ID** | ADD-XXXX |
| **Brief** | Link to Agent Brief |
| **Validator** | |
| **Date** | YYYY-MM-DD |

---

## Acceptance Criteria Verification

| # | Criterion | Result | Notes |
|---|---|---|---|
| AC-1 | | ✅ PASS / ❌ FAIL | |
| AC-2 | | ✅ PASS / ❌ FAIL | |
| AC-3 | | ✅ PASS / ❌ FAIL | |
| AC-4 | | ✅ PASS / ❌ FAIL | |
| AC-5 | | ✅ PASS / ❌ FAIL | |

## Hallucination Check

| Check | Result | Details |
|---|---|---|
| Invented imports or dependencies? | ✅ None / ❌ Found | |
| Invented APIs or endpoints? | ✅ None / ❌ Found | |
| Invented file paths? | ✅ None / ❌ Found | |
| Fabricated data or statistics? | ✅ None / ❌ Found | |
| Assumed non-existent configuration? | ✅ None / ❌ Found | |

## Scope Check

| Check | Result | Details |
|---|---|---|
| Output stays within defined scope? | ✅ Yes / ❌ No | |
| Non-goals were respected? | ✅ Yes / ❌ No | |
| No unrelated files modified? | ✅ Yes / ❌ No | |
| No feature creep? | ✅ Yes / ❌ No | |

## Silent Failure Check

| Check | Result | Details |
|---|---|---|
| Logic errors not caught by linting? | ✅ None / ❌ Found | |
| Missing error handling? | ✅ None / ❌ Found | |
| Incorrect edge case behavior? | ✅ None / ❌ Found | |
| Security vulnerabilities? | ✅ None / ❌ Found | |

## Automated Checks

| Check | Command | Result |
|---|---|---|
| Lint | `npm run lint` | ✅ PASS / ❌ FAIL |
| Type-check | `npm run typecheck` | ✅ PASS / ❌ FAIL |
| Unit tests | `npm test` | ✅ PASS / ❌ FAIL |
| Build | `npm run build` | ✅ PASS / ❌ FAIL |

---

## Overall Verdict

- [ ] ✅ **PASS** — All criteria met, all checks passed.
- [ ] ❌ **FAIL** — One or more criteria failed. → Create Failure Review.

## Notes

*Observations, concerns, or suggestions for the Consolidation phase.*
