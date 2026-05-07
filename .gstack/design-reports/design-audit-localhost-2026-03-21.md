# Vibe Dining Design Audit — 2026-03-21

**Branch:** `claude/qa-design-review-1MkDT`
**Auditor:** /design-review (gstack)
**Target:** `http://localhost:3000` (local dev)
**Pages audited:** Home, Play, Game Detail (Quiz), Join, Leaderboard, Profile
**DESIGN.md:** Present — all findings calibrated against it.

---

## First Impression

The site communicates **confident, playful gaming energy** — you know immediately this is a multiplayer party game hub for groups.

I notice **the hero section is the strongest design moment**: dark smoky-black panel with a teal→malibu gradient headline creates bold contrast, and the teal CTA button reads cleanly at a glance.

The first 3 things my eye goes to: **"Play Together, Anywhere" headline**, **teal Join button**, **the coloured game card grid** — hierarchy is intentional and correct.

If I had to describe it in one word: **Bold**.

---

## Design Scores

| Metric | Baseline | Final |
|--------|----------|-------|
| Design Score | C+ | B |
| AI Slop Score | C | B |

---

## Category Grades (Final)

| Category | Grade | Notes |
|----------|-------|-------|
| Visual Hierarchy | A | Hero focal point clear, eye flow correct |
| Typography | B | Font swap now correct; consistent across all pages |
| Spacing & Layout | B | Mobile column centred, desktop treatment excellent |
| Color & Contrast | A | Full palette used correctly; semantic aliases consistent |
| Interaction States | B | All touch targets now ≥44px |
| Responsive | A | max-w-md centred, dark desktop gradient fills viewport beautifully |
| Content Quality | B | Empty states now have CTAs; no dead ends remaining |
| AI Slop | B | Emoji in section heading removed; game-family colour system is genuinely distinctive |
| Motion | A | Framer Motion entrance animations intentional; spring physics on hero emoji |
| Performance | A | 243ms total load, TTFB 47ms, no blocking resources |

---

## Findings

### ✅ FINDING-001 — "See all" button: touch target + wrong font (FIXED)

**Impact:** High
**Category:** Interaction States
**Commit:** `4f949c8`
**Files:** `pages/index.tsx`

The "See all" button on the homepage had no height constraint (rendered at 16px — 28px below the 44px minimum), no font class (fell back to Times New Roman), and no active:scale feedback.

**Before:** 49×16px, Times New Roman, no press feedback
**After:** 85×44px, Archivo (font-heading), active:scale-[0.97] ✓

---

### ✅ FINDING-002 — Filter chips: touch target too small (FIXED)

**Impact:** High
**Category:** Interaction States / Responsive
**Commit:** `bf65e23`
**Files:** `pages/play/index.tsx`

Family filter chips (All / Knowledge / Party / 18+ / Solo / Surprise) on `/play` were 32px tall, below the 44px minimum for mobile touch targets (CLAUDE.md requirement).

**Before:** `py-2` = 32px height
**After:** `min-h-[44px]` = 44px height ✓

---

### ✅ FINDING-003 — Leaderboard + Profile: wrong heading font (FIXED)

**Impact:** High
**Category:** Typography
**Commit:** `bf412c1`
**Files:** `pages/leaderboard/index.tsx`, `pages/dashboard/index.tsx`

Both stub pages used `font-heading` (Archivo — intended for numbers/stats/CTAs) on their page `h1`. All other pages (Home, Play) correctly use `font-display` (PolySans Bulky) for page headings. This created a visible font inconsistency when navigating between tabs.

**Before:** Archivo on h1 (navigating to Leaderboard felt "off")
**After:** PolySans Bulky on h1 — visually consistent across all tabs ✓

---

### ✅ ROOT CAUSE FIX — Duplicate globals.css overriding font swap (FIXED)

**Impact:** High (silent CSS bug)
**Commit:** `72da151`
**Files:** `styles/globals.css`

The font swap committed in `7ae254e` only updated `src/styles/globals.css`. A second `styles/globals.css` at the project root was also being processed by Tailwind v4's CSS scanner, and it still had the pre-swap font mapping (`font-body=Archivo, font-heading=Unbounded`). Since Tailwind processes `@theme inline` blocks from both files, the root-level file was winning, causing:

- `.font-body` → rendered as Archivo (should be Unbounded)
- `.font-heading` → rendered as Unbounded (should be Archivo)

**Fix:** Updated `styles/globals.css` to match `src/styles/globals.css`.
**Verification:** `.font-body { font-family: var(--font-unbounded)... }` ✓

---

### ✅ FINDING-004 — Leaderboard dead end (FIXED)

**Impact:** Medium
**Category:** Content Quality
**Commit:** `e352349`
**Files:** `pages/leaderboard/index.tsx`

"Global rankings coming soon." — just text, no CTA, no illustration. CLAUDE.md: "No dead ends — every screen must have a clear primary action."

**Before:** One line of muted text
**After:** Trophy emoji + "Coming next sprint!" headline + descriptive copy + "Play a game" CTA ✓

---

### ✅ FINDING-005 — Profile dead end (FIXED)

**Impact:** Medium
**Category:** Content Quality
**Commit:** `e352349`
**Files:** `pages/dashboard/index.tsx`

"Sign in to see your profile." — no sign-in CTA, no next step. Dead end per CLAUDE.md.

**Before:** One line of muted text, no action
**After:** Gamepad emoji + "Play to build your history" + descriptive copy + "Pick a game" CTA ✓

---

### ✅ FINDING-006 — 🔥 emoji in "Featured" section heading (FIXED)

**Impact:** Polish
**Category:** AI Slop
**Commit:** `dd8ca50`
**Files:** `pages/index.tsx`

Emoji used as a decorative label in an h2 heading ("🔥 Featured"). DESIGN.md principle: "colour carries personality, not patterns." The PolySans Bulky font + bold weight provides personality without the crutch.

**Before:** `🔥 Featured`
**After:** `Featured` ✓

---

## Mobile Compliance — Final State

| Check | Result |
|-------|--------|
| All tap targets ≥44px | ✅ All fixed (FINDING-001, FINDING-002) |
| Font-body = Unbounded | ✅ Fixed (root globals.css sync) |
| Font-heading = Archivo | ✅ Fixed |
| Font-display = PolySans on all page h1s | ✅ Fixed (FINDING-003) |
| No dead ends on any nav tab | ✅ Fixed (FINDING-004, FINDING-005) |
| active:scale on all interactive elements | ✅ "See all" fixed; nav fixed in prior QA |

---

## Summary

6 findings total. **6 fixed** (0 deferred, 0 reverted).

| Fix | Impact | Commit |
|-----|--------|--------|
| "See all" touch target + font | High | `4f949c8` |
| Filter chips touch target | High | `bf65e23` |
| Leaderboard + Profile h1 font | High | `bf412c1` |
| Root globals.css font override | High | `72da151` |
| Leaderboard empty state + CTA | Medium | `e352349` |
| Profile empty state + CTA | Medium | `e352349` |
| Remove emoji from Featured heading | Polish | `dd8ca50` |

**Design score: C+ → B.**

**PR summary:** Design review found 6 issues across 5 pages, all fixed. Critical bug: duplicate `globals.css` was overriding the Unbounded↔Archivo font swap — all body text was rendering in the wrong font. All touch targets now ≥44px, all tab pages use consistent PolySans heading font, stub empty states replaced with warm CTAs.
