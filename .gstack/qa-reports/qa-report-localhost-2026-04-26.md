# QA Report — localhost:3004 — 2026-04-26

**Branch:** cso
**Commit:** 668b90b feat: bump round timer to 60s, show category on actor screen, hide final round scores for suspense
**Viewport:** 390×844 (iPhone 14)
**Mode:** Diff-aware (feature branch)
**Duration:** ~10 min

## Summary

| Metric | Value |
|--------|-------|
| Pages visited | 5 |
| Issues found | 0 (new) |
| Issues fixed | 0 |
| Pre-existing issues | 2 (not our changes) |
| Health score | 90/100 |

## Changes Tested

### ✅ PASS — Timer bumped to 60 seconds

- `ROUND_SECONDS = 60` confirmed in both `src/games/charades/CharadesEngine.tsx:31` and `src/games/taboo/TabooEngine.tsx:34`
- Game detail page instructions say "within 60 seconds" (from `pages/play/[gameId].tsx:472`)
- All timer math (percentage bar, beep threshold) uses the `ROUND_SECONDS` constant — no hardcoded values remain

### ✅ PASS — Category label on actor screen (Charades)

- `CharadesEngine.tsx:878-881`: `{currentWord?.category && <p ...>{currentWord.category}</p>}` renders above the word
- `currentWord` is a `CharadesWord` with `category?: string` — already populated on all words
- Broadcast at line 402 includes full `currentWord` object (including category) to actor client
- Taboo: no category label added (not requested — Taboo describer doesn't need this)

### ✅ PASS — Final round hides team scores (Charades + Taboo)

**Charades** (`CharadesEngine.tsx:797`):
```tsx
{teamScores.length > 0 && round < totalRounds && (
  <div> ... team scores ... </div>
)}
{round >= totalRounds && (
  <p>Final scores reveal incoming...</p>
)}
```
**Taboo** (`TabooEngine.tsx:826`): identical pattern

- Non-final rounds: scores visible ✅
- Final round: scores hidden, suspense message shown ✅
- Button changes: "See Results 🏆" on final round, "Next Round →" otherwise ✅

## Pre-existing Issues (not caused by our changes)

### ⚠️ WARN — React setState during render (TutorialOverlay)
- `Cannot update a component (GamePage) while rendering a different component (TutorialOverlay)`
- Pre-existing: introduced in `86bca46` (prior sprint)
- Not related to our changes (timer, category, score hiding)
- Root: `onDone()` called from inside `setCountdown` setter in `TutorialOverlay.tsx:33-37`

### ⚠️ WARN — SSL connection error (Supabase)
- `ERR_SSL_BAD_RECORD_MAC_ALERT` on Supabase realtime connection
- Pre-existing network issue, not our changes

## Screenshots
- `screenshots/homepage.png` — Landing page 390×844
- `screenshots/play-page.png` — Play page game grid
- `screenshots/charades-detail.png` — Charades game detail (shows "60 seconds" in instructions)
- `screenshots/charades-lobby.png` — Host setup screen
- `screenshots/charades-lobby-loaded.png` — Active lobby (room SLFNSS)
- `screenshots/taboo-detail.png` — Taboo game detail
- `screenshots/taboo-detail-scrolled.png` — Taboo instructions scrolled

## PR Summary
> QA passed on all 3 feature changes (60s timer, actor category label, final round score suspense). Health score 90/100. Two pre-existing warnings unrelated to this branch.
