# TODOS — Vibe Dining

Deferred work from /plan-ceo-review (2026-05-07). Items ordered by priority.

---

## P2 — Restaurant of the Week Featured Slot

**What:** Wire the `featured: boolean` column (already in the MVP schema) to a highlighted card at the top of the home screen. Founder selects the featured restaurant weekly via Supabase Table Editor.

**Why:** Gives restaurants a reason to engage with the product (every restaurant wants to be featured). Gives users a reason to return each week. Creates a natural relationship-building moment with restaurant owners before the ACJ engine launches.

**Pros:** Retention hook. Restaurant engagement hook. Zero new schema work (column is already there). Builds toward the "restaurants pay to be featured" business model milestone.

**Cons:** Requires editorial discipline — founder must remember to update the `featured` flag weekly. If the founder forgets, the featured slot shows a stale restaurant indefinitely. Add a `featured_since timestamptz` column when building this to detect staleness.

**Context:** `featured: boolean DEFAULT false` is in the MVP schema. It is explicitly NOT displayed at MVP. When this feature is built, add a `featured_since` timestamp and auto-hide if older than 14 days.

**Effort:** human ~2hrs / CC ~20min. **Depends on:** MVP Week 4 validation signal.

---

## P2 — Photo URL Re-hosting (Supabase Storage)

**What:** Write a one-time script that downloads all `photo_urls` entries from Foursquare/OSM CDN origins, uploads them to Supabase Storage, and updates the `photo_urls` array in the DB to point to the Supabase Storage URLs.

**Why:** Third-party photo URLs (Foursquare, OSM) expire or rotate without warning. When they break, restaurant cards show the placeholder image and OG link previews go dark — erodes trust silently. This is a time bomb that detonates months after launch with no alert.

**Pros:** Photos become permanent and Vibe Dining-controlled. OG preview images stay working indefinitely. No ongoing cost (Supabase Storage is ~$0.02/GB at MVP scale).

**Cons:** One-time script work (~30 min). Adds ~20-50MB to Supabase Storage bucket (trivial).

**Context:** MVP seeds from Foursquare or OSM. Do this in Month 2, before external URLs start expiring. Supabase Storage public bucket with a simple upload script is sufficient — no signed URLs needed for public restaurant photos.

**Effort:** human ~1hr / CC ~30min. **Depends on:** MVP launch (do in Month 2).

---

## P2 — Display Order Admin UI (drag-and-drop reorder)

**What:** A simple admin page (e.g., `/admin/rankings` behind a hardcoded password check or Supabase service role auth) showing occasion tags and their restaurant lists with drag-and-drop reordering. Saves `display_order` values back to the DB on drop.

**Why:** Managing `display_order` via Supabase Table Editor is workable at 75 restaurants but becomes painful at 200+, especially when the founder wants to promote a newly-discovered restaurant up the list. A drag-and-drop UI takes 30 minutes to build with `@dnd-kit/core` and saves hours of manual DB editing.

**Pros:** Founder can curate rankings without touching the DB. Natural UX for a product where ranking order IS the value proposition. Essential when restaurant count grows past 100.

**Cons:** Adds an admin surface that needs a password gate (even a basic one). Keep it off the public nav.

**Context:** Use `@dnd-kit/core` + `@dnd-kit/sortable`. On drag end: batch UPDATE `restaurant_occasions SET display_order = $i WHERE restaurant_id = $id AND tag_id = $tagId`. Gate the route with a `ADMIN_PASSWORD` env var check (not a real auth system — just a query param or cookie check).

**Effort:** human ~3hrs / CC ~30min. **Depends on:** restaurant count > 100.

---

## P2 — Onboarding Vibe-Check Flow

**What:** A pre-home onboarding screen (shown once on first launch, stored in localStorage) that asks: (1) your area of Lagos — VI / Lekki / Ikoyi / Ikeja / Other, (2) what vibe are you usually after — a visual 3-option picker (Instagrammable / Date Night / Group Hangs). Sets a `chow_onboarding` localStorage key with `{ area, defaultOccasion, completedAt }`. The home screen then pre-selects the matching occasion chip and shows area-relevant restaurants first.

**Why:** Founder decision during design review (2026-05-07): users should feel the app was made for them specifically. A pre-personalised feed communicates curation confidence from the very first tap. Also resolves the hero fallback question — with a known default occasion, the hero always has context. The personalised greeting ("Good evening, Gbemi") currently in the HTML mockup requires this flow first; without it, the greeting has no name data.

**Pros:** First impression is personalised, not generic. Hero card always shows the right occasion. Sets up the "Chow knows you" trust signal from first use. Zero backend cost — pure localStorage.

**Cons:** Adds a screen before the home feed. Every extra tap before the user sees restaurants is a risk of drop-off. Keep it under 30 seconds total — 2 questions, large tap targets, skip option.

**Context:** Onboarding screen is shown ONLY on first visit (`!localStorage.getItem('chow_onboarding')`). After completion, never shown again. Skip button sets a neutral default (`defaultOccasion: 'instagrammable'`, `area: 'lagos'`). The greeting on the home screen should NOT use the user's name (no auth at MVP) — use time-of-day: "Good evening" / "Good morning". Name personalisation is Phase 3 (post-auth).

**Effort:** human ~2hrs / CC ~1hr. **Depends on:** MVP Week 2 build (add as Week 2 item if founder prioritises the personalised feel at launch).

---

## P3 — Occasion Quiz (guided 3-tap flow)

**What:** A 3-step guided flow as an alternative entry point to the tag picker: group size (solo / couple / group) → budget (₦ / ₦₦ / ₦₦₦) → vibe (relaxed / lively / fancy). Maps to a combination of `occasion_tag` + `price_tier` filter. Shows the matching restaurant list instantly.

**Why:** Some users won't map their occasion to a tag label ("Birthday Dinner" is obvious; "Instagrammable" is not for everyone). The quiz meets them where they are and removes the cognitive load of choosing a tag.

**Pros:** Higher conversion for uncertain first-time users. Doubles as a discovery path for users who don't have a specific occasion in mind.

**Cons:** Second UI pattern adds complexity. Only worth building if the tag picker shows a real problem. Do not build speculatively.

**Context:** Build this ONLY IF Week 4 analytics show occasion tag picker drop-off > 40% (i.e., users open the app, see the tags, and leave without tapping). The `occasion_selected` Vercel Analytics event (tracked from MVP launch) provides this signal.

**Effort:** human ~3hrs / CC ~45min. **Trigger:** tag picker drop-off > 40% in Week 4 analytics.
