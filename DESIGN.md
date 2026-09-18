# Design System — Chow

> **Memorable thing:** "This place was particularly chosen for its theme."
> Every design decision must reinforce curation confidence. Chow is an editor, not a search engine.

---

## Product Context

- **What this is:** Lagos-first occasion-based restaurant discovery — each restaurant earns its place for a specific dining theme, not general popularity
- **Who it's for:** Urban Lagos diners 22–45 who want a trusted recommendation for a specific occasion (first date, birthday, instagrammable spot), not a filtered list of options
- **Space/industry:** Food discovery, local urban guides, social dining
- **Project type:** Responsive web app (Next.js), mobile-first, no native app at MVP

---

## Aesthetic Direction

- **Direction:** Warm Editorial Maximalism
- **Decoration level:** Intentional — photography does the visual work; typography and layout add editorial authority; grain/texture used sparingly
- **Mood:** A Lagos city guide that got a bold rebrand. Feels like a trusted local magazine: warm, confident, photogenic. Not corporate, not chaotic. Every screen communicates "someone with taste made this." The palette is food — maroon, orange, sherbet, peach.
- **What it is NOT:** Generic SaaS UI, travel app template, Zomato-clone, purple-gradient anything

---

## Typography

Two families. Canela handles all display and editorial type — it communicates curation authority. PolySans handles all UI, body, and interactive type — it's geometric but warm, designed for screens. Never substitute either with Inter, Roboto, or system-ui in production.

### Font Roles

| Role | Font | Weight | Usage |
|------|------|--------|-------|
| Hero Display | `Canela` | Light (300) | Restaurant names 48px+, occasion page headers, wordmark |
| Hero Display Italic | `Canela` | Light Italic (300) | Italic word in occasion headers: "First *Date*", "ch*o*w" |
| Card Display | `CanelaDeck` | Light (300) | Restaurant card names 20–44px, section titles |
| Editorial | `CanelaText` | Light Italic (300) | One-liner editorial quotes, pull quotes 14–18px |
| Body | `PolySans` | Neutral (400) | Body text, descriptions, navigation links |
| UI Labels | `PolySans` | Bulky (700) | All-caps occasion chips, badges, metadata, button labels, price tiers |
| Secondary Labels | `PolySans` | Slim (300) | Timestamps, open hours, secondary metadata |

### The Pairing Logic

Canela serif + PolySans sans creates a productive tension — Canela says *desire and editorial authority*, PolySans says *precision and clarity*. The serif carries the restaurant names and occasion mood; the sans carries all the functional UI around them. They never compete because they occupy different optical sizes and UI roles.

### Loading Strategy

```css
/* In global CSS (e.g. app/globals.css or styles/global.css) */
@import '/fonts/fonts.css';   /* Loads all Canela + PolySans @font-face declarations */
```

No Google Fonts needed — everything is self-hosted in `public/fonts/`.

### CSS Custom Properties

```css
:root {
  /* Cormorant is the open-source Google Fonts fallback for Canela.
     If Canela trial files are missing or not yet replaced with licensed
     fonts in production, Cormorant activates automatically — same high-
     contrast serif personality, free for commercial use. */
  --font-display: 'Canela', 'Cormorant', Georgia, serif;
  --font-deck:    'CanelaDeck', 'Cormorant', Georgia, serif;
  --font-text:    'CanelaText', 'Cormorant', Georgia, serif;
  --font-body:    'PolySans', system-ui, sans-serif;
}
```

**Cormorant (Google Fonts) — the production safety net:**
Cormorant is a free, open-source, commercially licensed display serif with the same high-contrast hairline structure as Canela. It loads from Google Fonts and sits second in every display font stack. If Chow ever goes live before the Canela license is purchased, Cormorant catches it gracefully — the UI stays elegant rather than falling back to Georgia.

Load it in `app/layout.tsx`:
```tsx
import { Cormorant } from 'next/font/google'

const cormorant = Cormorant({
  subsets: ['latin'],
  weight: ['300', '400', '500'],
  style: ['normal', 'italic'],
  display: 'swap',
  variable: '--font-cormorant',
})
```

### Type Scale

| Token | Size | Font | Weight | Usage |
|-------|------|------|--------|-------|
| `text-hero` | 64–80px | Canela | Light (300) | Hero restaurant name on detail page |
| `text-display` | 48–64px | Canela | Light (300) | Hero card name, occasion page header |
| `text-section` | 32–40px | CanelaDeck | Light (300) | Section titles ("More for *tonight*") |
| `text-card` | 22–28px | CanelaDeck | Light (300) | Card restaurant name |
| `text-editorial` | 14–16px | CanelaText | Light Italic (300) | One-liner editorial quote |
| `text-body` | 15px | PolySans | Neutral (400) | Body paragraphs, descriptions |
| `text-label` | 11–12px | PolySans | Bulky (700) | ALL-CAPS chips, badges, price, metadata |
| `text-micro` | 10–11px | PolySans | Bulky (700) | ALL-CAPS occasion pills, nav labels |
| `text-light-meta` | 11–13px | PolySans | Slim (300) | Hours, distance, secondary info |

### PolySans Weight Reference

| File | Weight | CSS `font-weight` | Use for |
|------|--------|-------------------|---------|
| `polysans-slim.woff2` | Slim | 300 | Secondary metadata, hours, light labels |
| `polysans-neutral.woff2` | Neutral | 400 | Body text, descriptions, nav |
| `polysans-bulky.woff2` | Bulky | 700 | Chips, badges, buttons, price indicators |

**⚠️ Font licensing:**
- **Canela** — trial fonts in `public/fonts/`. Purchase the commercial license at [commercialtype.com](https://commercialtype.com) before production launch.
- **PolySans** — verify your license covers web use at [newglyph.com](https://newglyph.com). The `.woff2` files are already production-format.

---

## Base Color System

```css
:root {
  /* Backgrounds */
  --color-bg:         #F4F0EC;  /* Isabelline — warm paper, primary background */
  --color-surface:    #FDDEC0;  /* Very Pale Orange — card chips, elevated surfaces */
  --color-card:       #FAF5EF;  /* Off-white — card background, slightly lifted from BG */
  --color-white:      #FDFAF6;  /* Near-white — sidebars, modals, nav */

  /* Text */
  --color-text:       #1C0208;  /* Smoky Black — primary text, warm near-black */
  --color-muted:      #6B4F52;  /* Muted warm brown — secondary text, metadata */

  /* Accent */
  --color-accent:     #B9254B;  /* Bright Maroon — primary accent, CTAs, Vibe Pick badge, active states */
  --color-pink:       #F0849B;  /* Pink Sherbet — hover states, secondary highlights */
  --color-warm:       #E38136;  /* Tiger's Eye — warmth accent, price tier indicators, food photography complement */

  /* Semantic */
  --color-open:       #2D7D46;  /* Open Now indicator */
  --color-open-bg:    rgba(45, 125, 70, 0.1);
}
```

---

## Occasion Identity System

Each occasion has a **signature color identity** — not just a label. When a user taps "First Dates," the UI subtly shifts to that occasion's visual register. This is how Chow communicates that each occasion was thought about separately, not just tagged.

The identity is applied to: occasion chip (active state), occasion page header accent, hero card gradient overlay tint, section header italic color.

| Occasion | Slug | Signature Color | Hex | Feel |
|----------|------|-----------------|-----|------|
| Instagrammable | `instagrammable` | Bright Maroon | `#B9254B` | Bold, confident, photogenic — the flagship occasion |
| First Date | `first_date` | Dusty Rose | `#C4607A` | Intimate, warm, slightly nervous-exciting |
| Birthday Dinner | `birthday_dinner` | Tiger's Eye | `#E38136` | Celebratory, warm, golden-hour energy |
| Group Hangout | `group_hangout` | Deep Teal | `#2A6B6B` | Social, loose, a bit louder |
| Business Lunch | `business_lunch` | Slate | `#4A5568` | Composed, confident, still has personality |

**Implementation — CSS custom properties scoped per occasion:**
```css
/* Apply via data attribute on the page/container: data-occasion="first_date" */
[data-occasion="instagrammable"] { --occasion-accent: #B9254B; --occasion-italic: italic; }
[data-occasion="first_date"]     { --occasion-accent: #C4607A; --occasion-italic: italic; }
[data-occasion="birthday_dinner"]{ --occasion-accent: #E38136; --occasion-italic: normal; }
[data-occasion="group_hangout"]  { --occasion-accent: #2A6B6B; --occasion-italic: normal; }
[data-occasion="business_lunch"] { --occasion-accent: #4A5568; --occasion-italic: normal; }

/* The occasion chip active state uses --occasion-accent, not the base --color-accent */
.occasion-chip[data-occasion].active {
  background: var(--occasion-accent);
  color: var(--color-white);
  border-color: var(--occasion-accent);
}

/* Occasion page header italic word uses the occasion accent */
.occasion-title em { color: var(--occasion-accent); }
```

**Occasion page editorial headers:**
| Occasion | Header pattern |
|----------|----------------|
| Instagrammable | "Made to be *photographed*" |
| First Date | "For your first *date*" |
| Birthday Dinner | "Worth *celebrating*" |
| Group Hangout | "Bring the *whole crew*" |
| Business Lunch | "Where *deals* get done" |

**Hero card gradient per occasion** — the hero card background gradient shifts its dominant tint to signal the occasion without text:
```css
[data-occasion="instagrammable"] .hero-gradient { background: linear-gradient(160deg, #E38136 0%, #B9254B 40%, #1C0208 100%); }
[data-occasion="first_date"]     .hero-gradient { background: linear-gradient(160deg, #F0849B 0%, #C4607A 40%, #1C0208 100%); }
[data-occasion="birthday_dinner"].hero-gradient { background: linear-gradient(160deg, #FDDEC0 0%, #E38136 40%, #B9254B 100%); }
[data-occasion="group_hangout"]  .hero-gradient { background: linear-gradient(160deg, #2A6B6B 0%, #1C4040 60%, #1C0208 100%); }
[data-occasion="business_lunch"] .hero-gradient { background: linear-gradient(160deg, #4A5568 0%, #2D3748 60%, #1C0208 100%); }
```

---

## Spacing

- **Base unit:** 8px
- **Density:** Comfortable-to-generous — each restaurant card breathes. Not information-dense. The whitespace signals curation ("chosen, not listed").

```css
:root {
  --space-1:  4px;
  --space-2:  8px;
  --space-3:  12px;
  --space-4:  16px;
  --space-5:  24px;
  --space-6:  32px;
  --space-7:  48px;
  --space-8:  64px;
  --space-9:  96px;
  --space-10: 128px;
}
```

---

## Layout

- **Approach:** Bento-editorial hybrid
- **Mobile-first:** Designed at 390px, tested at 375px and 430px
- **Grid:** 4 columns mobile / 8 columns tablet / 12 columns desktop (8px gutter)
- **Max content width:** 1200px
- **Border radius scale:**
  ```css
  --radius-sm:  6px;   /* Tags, chips, small UI elements */
  --radius-md:  12px;  /* Input fields, small cards */
  --radius-lg:  20px;  /* Standard cards */
  --radius-xl:  28px;  /* Hero cards, large cards */
  --radius-full: 9999px; /* Pills, badges, circular elements */
  ```

**Homepage structure:**
1. **Sticky nav** — wordmark (Canela Light) + occasion chips row + icon buttons
2. **Hero slot** — full-bleed image card (Vibe Pick restaurant for active occasion) with Canela display name, editorial one-liner, neighborhood + price, Vibe Pick badge
3. **Bento grid** — irregular: first card full-width, then alternating half-width. Some cards full-width if particularly notable. Never uniform.
4. **Influencer picks strip** — horizontal scroll, labeled with influencer name in Canela ("As picked by *Opeyemi*")
5. **Bottom nav** — Chow wordmark, minimal icon set

**Occasion pages:**
- No sort controls, no pagination, no "showing X of Y results"
- Section header: `FOR YOUR` (Plus Jakarta Sans SemiBold, all-caps, occasion accent color) + large Canela display title
- Subtitle: one sentence describing the occasion's curatorial logic
- Count: "6 restaurants · personally curated" — scarcity is a feature
- List: a curated sequence, not a grid. First restaurant is hero-scale. Subsequent ones are editorial list items.

**No star ratings anywhere.** No review counts. Replace with:
- Editorial one-liner (CanelaText Light Italic, 14–16px, color: `--color-muted`)
- Vibe Pick badge for founder-selected standouts
- "You've been here" badge (localStorage-based)

---

## Motion

- **Approach:** Intentional — motion communicates curation, not entertainment
- **Easing:** `enter: cubic-bezier(0.0, 0.0, 0.2, 1)` · `exit: cubic-bezier(0.4, 0.0, 1, 1)` · `move: cubic-bezier(0.4, 0.0, 0.2, 1)`
- **Duration scale:**
  - `micro`: 80ms — button press state, chip press
  - `short`: 180ms — card hover, fade in
  - `medium`: 280ms — page transitions, hero image load
  - `long`: 450ms — occasion page entrance

**Specific motion behaviors:**
- **Occasion chip press:** scale(0.95) + background fill over 80ms — satisfying, not bouncy
- **Card entrance:** `opacity 0 → 1` + `translateY(12px) → 0` staggered at 50ms per card
- **Hero image:** subtle scale(1.03) on load resolving over 600ms (parallax-lite)
- **Occasion page transition:** old page fades left, new page enters from right at 280ms

---

## Influencer Identity

Influencer picks are surfaced as editorial voices, not endorsements. Each influencer section has:
- Section header: "As picked by *[Name]*" in Canela Deck (name is italic, in the active occasion accent)
- Influencer avatar (circular, 40px)
- Horizontal scroll of cards — same card format as the main bento, but with the influencer's editorial one-liner instead of Chow's

**Key influencer at launch:** Opeyemi Famakin. More added in Phase 2 with partnerships.

---

## Dark Mode

Strategy: redesign surfaces (don't just invert). Reduce saturation 10–15% on accents.

```css
@media (prefers-color-scheme: dark) {
  :root {
    --color-bg:      #0F0408;
    --color-surface: #2A1015;
    --color-card:    #1A0810;
    --color-white:   #1A0810;
    --color-text:    #F4F0EC;
    --color-muted:   #9B7E82;
    /* Accents stay the same — the warm palette reads well on dark */
  }
}
```

Dark mode is a progressive enhancement — not required at MVP. Implement after core UI is stable.

---

## Anti-patterns (never do these)

- Star ratings or numerical review scores anywhere in the UI
- Uniform card grids where every card is the same size
- Purple or blue-violet gradients as accent colors
- Center-aligned everything with uniform vertical spacing
- "Sort by: Relevance / Distance / Rating" controls
- Search bar as the primary homepage element
- Generic food app conventions: cuisine tags, map-first, distance-first
- Inter, Roboto, Poppins, Space Grotesk, Montserrat as display fonts
- Gradient CTA buttons (the accent is flat `#B9254B`, not a gradient)
- `system-ui` as the body font fallback in production

---

## File Structure (fonts)

```
public/
  fonts/
    fonts.css                          ← ALL @font-face declarations — import this globally
    Canela-Thin-Trial.otf              ← Very large display (80px+)
    Canela-ThinItalic-Trial.otf
    Canela-Light-Trial.otf             ← Hero display (48px+)
    Canela-LightItalic-Trial.otf
    Canela-Regular-Trial.otf
    Canela-RegularItalic-Trial.otf
    CanelaDeck-Light-Trial.otf         ← Card names, section headers (20–44px)
    CanelaDeck-LightItalic-Trial.otf
    CanelaDeck-Regular-Trial.otf
    CanelaDeck-RegularItalic-Trial.otf
    CanelaText-Light-Trial.otf         ← Editorial one-liners (14–18px)
    CanelaText-LightItalic-Trial.otf
    polysans-slim.woff2                ← PolySans Slim (300) — secondary metadata
    polysans-neutral.woff2             ← PolySans Neutral (400) — body text
    polysans-bulky.woff2               ← PolySans Bulky (700) — chips, badges, buttons
    polysans-bulky.woff                ← PolySans Bulky fallback format
```

---

## Decisions Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-05-07 | Product renamed Vibe Dining → Chow | Playful pun on the world of dining; more memorable, approachable brand |
| 2026-05-07 | Canela as display font | High-contrast serif signals editorial authority; each restaurant name feels earned; subagent and primary review agreed independently |
| 2026-05-07 | No star ratings or review counts | Communicates curation authority — Chow is an editor, not a crowd aggregator. Both design voices agreed independently. |
| 2026-05-07 | Per-occasion color identity system | Each theme has a signature accent color so the UI visually shifts when you tap an occasion — the design communicates that each occasion was thought about separately |
| 2026-05-07 | Bento-editorial grid over uniform cards | Irregular grid rhythm signals handpicked, not algorithmic. Each layout is a trust signal. |
| 2026-05-07 | Warm Editorial Maximalism aesthetic | Audience spans young price-conscious diners and older experience-seekers; the warmth appeals to both; editorial voice signals quality without being cold or corporate |
| 2026-05-07 | Self-hosted Canela (trial) | Full font family available in repo; no CDN round-trip; font-display: swap for 3G performance; swap for licensed fonts before production |
| 2026-05-07 | PolySans replaces Plus Jakarta Sans as body/UI font | PolySans (Slim/Neutral/Bulky) is self-hosted and already in the repo; geometric-warm sans pairs cleanly with Canela; three weights map naturally to light metadata / body text / bold UI labels |
| 2026-05-07 | Cormorant (Google Fonts) added as Canela fallback | Free open-source commercial license; closest structural match to Canela's high-contrast hairline display personality; activates automatically if Canela trial fonts are not replaced before production launch |
