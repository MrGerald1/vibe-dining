# **Product Requirements Document: Vibe Dining (Lagos Restaurant Discovery App)**

Version: 1.1  
Date: May 3, 2025  
Author: Industry Analyst (Technology \& Consumer Markets)  
Status: Draft  
**1. Introduction**

This document outlines the product requirements for "Chow," a new mobile application designed to revolutionize restaurant discovery for young, upwardly mobile Nigerians, specifically targeting the 21-45 age demographic in Lagos initially. This demographic, encompassing digitally native Gen Z and Millennials, is characterized by its tech-savviness, significant social media influence, and a growing appetite for unique dining experiences, convenience, and authenticity.1 They actively seek recommendations, often value experiences over simple utility, and are increasingly health-conscious and adventurous with food.1

The Nigerian foodservice market presents a significant opportunity, projected to reach USD11.09 billion in 2025 and grow at a CAGR of 11.73% to USD19.31 billion by 2030.5 Lagos, as a major economic hub with a dense population and vibrant food scene 5, is the ideal launch market. Despite this growth, existing restaurant discovery methods, particularly those reliant on traditional star ratings, suffer from issues of trust and reliability, including susceptibility to fake or manipulated reviews.7

Vibe Dining aims to address these limitations by introducing a novel comparative rating system based on pairwise judgments. This approach promises more reliable and nuanced rankings. The app will further differentiate itself by allowing users to filter restaurants based on occasion or sentiment (e.g., 'first date,' 'instagrammable'), optionally import their dining history from external sources like Google Maps (via Google Takeout) for personalization, and potentially feature curated recommendations from trusted local food influencers and publications. The vision is to become the most trusted and personalized platform for discovering dining experiences in Lagos, tailored to the specific preferences and lifestyle of its target users.



**2. Problem Statement, Goals \& Objectives**

* **Customer Personas:**

  * **The Social Planner (e.g., Funke, 28):** Needs to find a restaurant with the right ambiance and price point for specific events like a friend's birthday or a crucial first date. Struggles with generic ratings that don't capture the *feel* of a place.
  * **The Discerning Diner (e.g., David, 35):** Is frustrated by homogenous high ratings and wants recommendations truly aligned with his personal taste, developed over many dining experiences. Feels current recommendations are noisy and untrustworthy.
  * **The Experience Seeker (e.g., Zainab, 24):** Looks for restaurants that offer a specific experience or aesthetic (e.g., "great for Instagram," "live music," "rooftop views"). Finds it hard to filter for these subjective qualities reliably.
* **The Problem:** Users struggle to efficiently and confidently find the *right* restaurant for their specific needs and tastes because current discovery methods based on aggregated star ratings lack sufficient differentiation, fail to account for personal preferences, and don't adequately capture the crucial context of occasion or desired vibe. This leads to decision paralysis, wasted time scrolling through reviews, and potentially disappointing dining experiences.

**2.1. Product Goals**

* **Establish Trust:** Become the most trusted source for restaurant recommendations in Lagos by implementing a demonstrably more reliable rating system than traditional star ratings.
* **Personalized Discovery:** Provide highly relevant and personalized restaurant suggestions based on user preferences, context (occasion/sentiment), and optionally, their dining history.
* **User Engagement:** Create an engaging and intuitive user experience that encourages frequent use for discovering restaurants and contributing ratings (comparisons).
* **Comprehensive Coverage:** Offer a comprehensive and up-to-date database of restaurants and dining establishments within Lagos.

**2.2. Business Goals**

* **User Acquisition:** Achieve significant adoption within the target demographic (21-45 year old, upwardly mobile Lagosians) within the first 12 months post-launch.
* **Market Penetration:** Capture a measurable share of the restaurant discovery market in Lagos within 24 months.
* **Monetization Strategy (Future):** Explore potential revenue streams post-MVP (e.g., premium features, partnerships with restaurants for promotions/bookings, sponsored influencer lists) once a strong user base and value proposition are established.
* **Brand Reputation:** Build a strong brand reputation associated with reliability, innovation, and understanding the local Lagos food scene.

**3. Features**

**3.1. Core Discovery \& Search**

* **3.1.1. Restaurant Database**

  * **Requirement:** Maintain a comprehensive, accurate, and regularly updated database of restaurants and dining establishments in Lagos. Initial focus on areas popular with the target demographic (e.g., Victoria Island, Lekki, Ikoyi, Ikeja).5
  * **Data Points per Restaurant:** Include essential information such as Name, Address (human-readable and potentially coordinates), Phone Number, Operating Hours (including current status: Open/Closed Temporarily/Closed Permanently), Price Range (e.g., ₦, ₦₦, ₦₦₦), Cuisine Type(s), Menu (link or integrated view if possible), Photos, place\_id (from Google Places or similar).11 Leverage data from reliable sources and potentially allow user-suggested updates/corrections post-verification. The average meal price in Lagos has significantly increased, reaching ₦7,221 in 2024, highlighting the importance of accurate price range information.6
* **3.1.2. Search Functionality**

  * **Requirement:** Provide robust search capabilities allowing users to find restaurants easily.
  * **Methods:**

    * Keyword Search: Search by restaurant name, cuisine type, or specific menu items (e.g., "Amala," "Jollof Rice," "Burger").6
    * Location-Based Search: Find restaurants "near me" (using device location with permission) or search within specific areas/neighborhoods of Lagos.
* **3.1.3. Filtering \& Tagging System**

  * **Requirement:** Allow users to refine search results based on various criteria, including standard filters and unique occasion/sentiment tags relevant to the target audience's lifestyle.
  * **Standard Filters:** Cuisine Type (Nigerian, Continental, Chinese, Italian, etc.), Price Range, Location/Neighborhood, Current Status (Open Now), Basic Amenities (e.g., Outdoor Seating, Wi-Fi, Parking).
  * **Occasion/Sentiment Tagging (Key Differentiator):**

    * **Concept:** Implement a system of descriptive tags allowing users to filter for restaurants suitable for specific situations or desired vibes. This caters to the experiential focus of Gen Z and Millennials.2
    * **Tag Examples:** 'First Date', 'Business Lunch', 'Group Hangout', 'Family Friendly', 'Celebration Dinner', 'Quick Bite', 'Late Night Craving' 3, 'Instagrammable' 2, 'After Work Drinks', 'Quiet/Intimate', 'Lively Atmosphere', 'Healthy Options' 1, 'Authentic Cuisine' 3, 'Street Food Vibe' 3, 'Good for Vegetarians', 'Outdoor Seating', 'Rooftop View', 'Live Music'.
    * **Tagging System Design:**

      * **Structure:** A well-defined taxonomy of tags, potentially hierarchical (e.g., Occasion > First Date; Vibe > Lively). Use a relational database structure (e.g., Restaurants, Tags, Restaurant\_Tags many-to-many join table) for efficient querying.14
      * **Best Practices:** Use standardized tag names (e.g., all lowercase, no spaces: first\_date, instagrammable) for consistency.15 Tagging should be applied thoughtfully to relevant entities.15 Avoid redundant tags already covered by standard metadata (e.g., tagging location if location filter exists).15 The tagging system should be designed for scalability and easy management.14
    * **Tag Application:** Initially, tags will be curated and applied by the internal team based on research, reviews, and potentially partnerships. Future iterations could explore user-suggested tags or ML-based classification, but MVP requires curated accuracy.
    * **UI Implementation:** Tags should be easily selectable filters within the search/discovery interface. Users might select multiple tags (e.g., 'Instagrammable' AND 'Rooftop View').

**3.2. Comparative Rating System (Core Innovation)**

* **3.2.1. Concept \& Rationale**

  * **Requirement:** Implement a restaurant rating system based on pairwise comparisons ("Which is better, A or B?") rather than traditional 1-5 star ratings.
  * **Rationale:** Traditional star ratings are susceptible to manipulation, fake reviews (both positive and negative extortion scams 7), and lack nuance.8 Comparative judgment leverages the human ability to make relative assessments more reliably than absolute ones.16 Aggregating many simple pairwise decisions produces a statistically robust and reliable rank order, even with non-expert raters.18 This directly addresses the user need for trustworthy recommendations. The process capitalizes on Thurstone's Law of Comparative Judgment.17
* **3.2.2. User Interface (UI) for Comparison**

  * **Requirement:** Design a simple, fast, and intuitive interface for users to make pairwise comparisons.
  * **Flow:**

    1. The system presents the user with two restaurants side-by-side. Key identifying information (Name, Photo, Primary Cuisine/Tag) should be visible.
    2. A clear question prompts the comparison, incorporating context. Examples:

       * "Overall, which restaurant is better?"
       * "Which restaurant is better for a 'First Date'?"
       * "Which offers better 'Value for Money'?"
       * "Which has a more 'Instagrammable' vibe?"
    3. Users select one of the two options or potentially an "I don't know/Can't compare" option. Forced choice (no "equal" option initially) simplifies the model but can be revisited.21
    4. The system records the judgment and presents the next pair. The process should feel lightweight and almost game-like to encourage participation.21
* **3.2.3. Backend Algorithm \& Score Calculation (Adaptive Comparative Judgement - ACJ)**

  * **Requirement:** Implement a backend system that uses the principles of Adaptive Comparative Judgement (ACJ) to process pairwise comparisons and generate a reliable rank order or relative score for restaurants, potentially within specific contexts (tags).
  * **Mechanism:**

    * The system collects pairwise judgments from multiple users.17
    * An algorithm (e.g., based on Bradley-Terry model or similar, potentially leveraging Rasch modeling as used in ACJ research 20) calculates a latent 'quality' score or parameter for each restaurant based on the outcomes of its comparisons.22
    * **Adaptive Nature:** The system intelligently selects which pairs to present to users. It prioritizes comparisons that will most efficiently improve the reliability of the overall ranking or resolve uncertainty about specific restaurant positions.19 It may also adapt based on real-time results.19
    * **Contextual Scores:** The system should ideally calculate separate scores/rankings based on the context of the comparison question (e.g., a restaurant might rank highly for 'Overall' but lower for 'Business Lunch'). This requires storing judgments linked to their context.
* **3.2.4. Displaying Results**

  * **Requirement:** Present the comparative rating results to users in an easily understandable format on restaurant profiles and potentially in search results.
  * **Methods:** Avoid displaying raw ACJ parameters. Instead, use derived, user-friendly representations:

    * **Contextual Rank:** "#1 for First Dates in Lekki" or "Top 5 for After Work Drinks".
    * **Percentile Score:** "Rated better than 85% of similar restaurants for 'Instagrammable' vibe."
    * **Tiered System:** Categorize restaurants into tiers (e.g., Top Tier, Mid Tier, Lower Tier) based on their comparative score within a context.
    * **Visual Comparison:** Potentially allow users to select 2-3 restaurants and see a visual representation of how they compare based on collective user judgments.
  * **Clarity:** Clearly explain that the displayed rank/score is derived from collective user comparisons within the app, differentiating it from traditional star ratings.
* **3.2.5. Addressing Rating Integrity**

  * **Requirement:** Implement measures to ensure the reliability and validity of the comparative ratings and mitigate potential manipulation.
  * **Mitigation Strategies:**

    * **Minimum Judgments:** A restaurant's rank/score should only be displayed after a statistically significant number of comparisons involving it have been collected.17 This threshold needs definition based on modeling.
    * **Misfit Analysis:** Utilize misfit statistics, common in ACJ systems 17, to identify:

      * *Inconsistent Judges:* Users whose judgments frequently contradict the consensus. Their future judgments might be down-weighted or flagged.
      * *Problematic Items:* Restaurants where judgments are highly inconsistent across users (e.g., high disagreement on its rank). This might indicate ambiguity or require further investigation.
    * **Algorithm Prioritization:** The ACJ algorithm should inherently prioritize comparisons that contribute most to improving overall model reliability.19
    * **Transparency:** While not revealing the full algorithm, explaining the *process* (collective judgment, context matters) can build user trust.23
  * **Comparative Advantage over Star Ratings:** The ACJ approach is inherently more resistant to manipulation than star ratings. A single fake 1-star or 5-star review can significantly skew an average.8 Manipulating an ACJ rank requires a coordinated effort to make consistently *incorrect* pairwise judgments against numerous other restaurants, which is harder to execute and scale, and potentially detectable via misfit analysis.17 This directly addresses the core problem of untrustworthy ratings identified in the market.7

**3.3. User Accounts \& History**

* **3.3.1. User Authentication \& Profile Management**

  * **Requirement:** Provide secure and easy user registration and login options. Allow basic profile management.
  * **Methods:** Email/Password registration, Social Sign-in (Google, potentially Apple).
  * **Profile:** Username, optional profile picture, potentially basic dietary preferences or favorite cuisines (used as input for recommendations).
  * **Compliance:** All user data collection, storage, and processing must strictly adhere to the Nigeria Data Protection Regulation (NDPR).24 See Section 4.5 for detailed compliance requirements.
* **3.3.2. Visited Places Import (Optional Feature - Post-MVP Recommended)**

  * **Requirement:** Allow users to *optionally* import their location history, specifically visited restaurants/places of interest, from their Google account (via Google Takeout) to bootstrap their profile, personalize recommendations, and identify places they can contribute comparisons for.
  * **Data Source:** Google Takeout Location History (Timeline)/Semantic Location History/ directory, which contains monthly JSON files.29 Direct API access for *historical* user location data is not provided by Google for privacy reasons 11; Takeout is the user-controlled export method.29
  * **Implementation Process:**

    1. **Explicit Granular Consent (NDPR Critical):** Before any upload, display a dedicated, clear consent screen. Explain:

       * *What* data will be extracted (Place names, addresses, Google Place IDs, visit timestamps from placeVisit objects in Semantic Location History JSONs).30 Explicitly state that raw GPS coordinates will *not* be stored unless strictly necessary and justified.
       * *Why* the data is needed (to identify restaurants visited, personalize recommendations, suggest places to rate).
       * *How* the data will be processed and stored securely.
       * *User Rights:* Right to view imported data, right to delete imported data at any time (NDPR requirement).28
       * Consent must be freely given, specific, informed, and unambiguous, separate from general T\&Cs.27
    2. **Secure File Upload:** Provide an in-app mechanism for the user to securely upload their Google Takeout archive (likely a .zip file containing the Location History folder). Handle large file uploads robustly.
    3. **Backend Parsing:** Implement a backend service to:

       * Unzip the archive.
       * Locate and parse the Semantic Location History JSON files (e.g., 2024\_MAY.json).29
       * Iterate through the timelineObjects, extracting relevant placeVisit segments.30 Key fields include location (containing name, address, placeId), duration (startTimestamp, endTimestamp).30
       * Handle the complex nested JSON structure and potential format variations.30 Consider using libraries like ijson for memory-efficient iterative parsing of potentially large files.34
    4. **Restaurant Matching:** Match the extracted place information (primarily using placeId 30, falling back to name/address matching with potential fuzzy logic) against the Vibe Dining restaurant database.
    5. **Secure Storage:** Store only the necessary matched information linked to the user profile (e.g., internal Restaurant ID, approximate visit date range). Encrypt sensitive data. Avoid storing the raw JSON files long-term. Adhere to data minimization principles.25
    6. **Error Handling \& Feedback:** Gracefully handle parsing errors, corrupted files, and places that don't match the restaurant database. Provide clear feedback to the user on the import progress and outcome.
  * **Privacy \& Security Considerations:** This feature involves processing highly sensitive personal data (location history). It carries significant privacy risks and a high compliance burden under NDPR.24 Implementation must prioritize security (encryption, access controls) and user control (view/delete functionality). Google's move towards on-device storage for Timeline 29 reinforces that Takeout is the user's mechanism for export, making this feature dependent on user action and the stability of the Takeout format. The technical complexity and privacy implications suggest this should be considered for a post-MVP release after careful risk assessment and DPIA (see Section 4.5).
  * **Alternative Approaches:** While alternative location platforms exist 35, they focus on *current* location services (geocoding, routing, geofencing) and do not provide access to a user's *historical* location data stored within Google Maps. Therefore, user-initiated Takeout import remains the only viable method for accessing this specific historical dataset.
* **3.3.3. User Activity Feed/History**

  * **Requirement:** Provide users with a section within their profile to view their activity on the Vibe Dining app.
  * **Content:** Display a chronological list of restaurants the user has rated (via pairwise comparisons), restaurants saved to personal lists (if implemented), and potentially a list of restaurants identified from imported Google Takeout history (if implemented and consented to).

**3.4. Recommendation Engine**

* **3.4.1. Core Recommendation Logic**

  * **Requirement:** Deliver personalized restaurant recommendations to users based on their preferences and behavior within the app.
  * **Input Data:**

    * User's pairwise comparison history (implicit preferences derived from choices made).
    * Calculated ACJ scores/ranks for restaurants (reflecting collective user judgment).
    * Explicit user preferences (e.g., favorite cuisines set in profile, restaurants saved to lists).
    * Imported visit history (if feature implemented and data available).
    * Contextual factors (e.g., time of day, user's current location - with permission).
  * **Algorithm Approach:**

    * **Initial Phase (MVP):** Start with simpler approaches:

      * *Content-Based Filtering:* Recommend restaurants with similar tags/attributes (cuisine, price, occasion tags) to those the user has positively compared or saved.
      * *Popularity-Based:* Feature restaurants highly ranked via the ACJ system overall or within specific popular contexts (e.g., "Top Rated for Weekend Brunch").
    * **Post-MVP:** Explore more sophisticated techniques:

      * *Collaborative Filtering:* Recommend restaurants liked by users who made similar pairwise comparisons ("Users who preferred A over B also liked C").
      * *Hybrid Approaches:* Combine collaborative, content-based, and potentially knowledge-based (leveraging the tag structure) methods.40
      * *Leveraging ACJ Scores:* Directly use the calculated ACJ scores/parameters as input features for the recommendation model.
  * **Personalization:** Recommendations should dynamically adapt as the user performs more comparisons and interacts with the app.41 The system should learn and refine its understanding of individual user tastes over time.40
* **3.4.2. Influencer-Driven Recommendations (Potential Future Enhancement)**

  * **Requirement:** Integrate curated content, lists, or recommendations from trusted Nigerian food influencers, bloggers, or publications to enhance discovery and leverage existing user trust in these sources.2
  * **Implementation Strategy:**

    1. **Prioritize Partnerships over Scraping:** Actively pursue partnerships with key local food influencers (e.g., Opeyemi Famakin 9, The Kitchen Muse 43), established food blogs (e.g., EatDrinkLagos 44, LostInLagos/Awari 12), or reputable influencer marketing agencies specializing in the Nigerian market.43

       * **Rationale:** Scraping influencer content (e.g., from Instagram) is technically challenging, prone to breaking with platform updates, legally risky (violates Instagram's Terms of Service 56, potential copyright issues 57, CFAA concerns 56), and ethically questionable.23 Official APIs are often limited and may not provide the desired content.56 Partnerships ensure legitimate access to potentially structured content, secure content rights, maintain content quality and reliability, and align with ethical best practices.23
    2. **Content Integration:** Based on partnership agreements, integrate influencer content in various ways:

       * **Curated Lists:** Feature lists like "Top 5 Spots for Suya by \[Influencer Name]" or "'s Best New Restaurants".
       * **Featured Reviews/Quotes:** Display short reviews or quotes from partners on relevant restaurant profiles.
       * **Influencer Badges:** Award badges (e.g., "\[Influencer Name] Recommended") to restaurants featured by partners.
       * **Dedicated Section:** Potentially create a section within the app dedicated to partner content.
       * *Attribution:* All integrated content must have clear and prominent attribution to the source partner.
    3. **Natural Language Processing (NLP) for Enhanced Insights (Optional):** If partners provide textual reviews or articles, NLP techniques can be employed to extract structured insights:

       * **Libraries:** Utilize Python libraries like spaCy (preferred for production speed and efficiency 60) or NLTK (offers flexibility, good for research/prototyping 60).
       * **Tasks:**

         * *Sentiment Analysis:* Determine the overall sentiment (positive/negative/neutral) of partner reviews.62
         * *Aspect-Based Sentiment Analysis (Advanced):* Identify sentiment towards specific aspects of the restaurant (e.g., "ambiance was amazing," "service was slow"). This requires more sophisticated models.
         * *Named Entity Recognition (NER):* Identify mentions of specific dishes, locations, people.62
         * *Topic Modeling (with Gensim 61):* Identify key themes or topics discussed in partner content.
       * **Benefit:** Convert unstructured text from partners into structured data points that can enrich restaurant profiles or feed into the recommendation engine.

**4. Feature Breakdown with User Stories**

* Basic End-to-End User Story Map:  
New User -> Signs Up -> Adds Visited Restaurants (Manual/Import) -> Provides Initial Classification (Like/Okay/Dislike) -> Performs Comparative Ratings -> Views Personal Ranked Lists -> Searches/Filters for Restaurants -> Selects Vibe/Occasion Filters -> Views Personalized Recommendations/Filtered List -> Selects Restaurant -> Views Details (Info, Vibe Tags, Why Recommended)
* **Major Features \& User Stories (with Priorities):**

  * **Epic: User Onboarding \& Initial Setup**

    * **User Story 1 (P0):** As a new user, I want to sign up for Vibe Dining using my email address or a social login (e.g., Google) so that I can create an account quickly and securely.

      * *Basic Flow:* Tap Sign Up -> Choose method (Email/Social) -> Enter credentials / Authorize social account -> Account created -> Logged in.
    * **User Story 2 (P0):** As a new user, after signing up, I want to be prompted to search for and add restaurants I have visited previously, classifying them broadly as "Liked It," "Okay," or "Didn't Like" using a simple interface (like swiping), so the app can establish a baseline understanding of my tastes.

      * *Basic Flow:* Post-signup screen -> Search for restaurant name -> Select restaurant -> Tap/Swipe "Liked It" / "Okay" / "Didn't Like" -> Repeat or skip.
    * **User Story 3 (P1):** As a new user, I want the option to import my saved/visited restaurant lists from Google Maps so that I can quickly add multiple restaurants I've already documented, saving manual entry time.

      * *Basic Flow:* Onboarding or Settings -> Tap "Import from Google Maps" -> Authenticate Google Account -> Grant permission -> Select relevant list(s) -> Confirm import -> App prompts for broad classification ("Liked It," "Okay," "Didn't Like") for imported items.
  * **Epic: Comparative Rating System**

    * **User Story 4 (P0):** As a user, after broadly classifying a newly added restaurant (e.g., "Liked It"), I want the app to present me with comparisons ("Is better or worse than?") so that it can precisely place the new restaurant within my personal preference ranking for that category.

      * *Basic Flow:* Add restaurant \& classify (e.g., "Liked It") -> App shows: " vs" -> User taps "Better" or "Worse" -> App may show another comparison based on binary search logic -> Restaurant is ranked.
    * **User Story 5 (P0):** As a user, I want to be able to view my personally ranked lists of restaurants within each category ("Liked It," "Okay," "Didn't Like") so that I can see how the app understands my preferences and review my ratings.

      * *Basic Flow:* Navigate to "My Ratings" or Profile section -> Select category ("Liked It") -> View list ranked from most to least preferred based on comparisons.
  * **Epic: Restaurant Discovery \& Filtering**

    * **User Story 6 (P0):** As a user, I want to search for restaurants by name or general location (e.g., "Ikoyi") so that I can find specific places or explore options in an area.

      * *Basic Flow:* Tap Search icon -> Enter text -> View list of matching restaurants.
    * **User Story 7 (P0):** As a user, I want to filter restaurant search results or recommendations based on specific vibes or occasions (e.g., "First Date," "Instagrammable," "After Work," "Cheap Eats," "Birthday") so that I can find places suitable for my current need.

      * *Basic Flow:* Go to Discover/Search screen -> Tap Filter icon -> Select one or more vibe/occasion tags -> Apply filter -> View matching restaurants.
    * **User Story 8 (P1):** As a user, I want to see a list of restaurant recommendations that are predicted to match my taste based on my comparative ratings so that I can discover new places I'm likely to enjoy.

      * *Basic Flow:* Go to Discover/Home screen -> View "Recommended For You" section -> See list of restaurants, potentially ordered by predicted preference score.
  * **Epic: Restaurant Information Display**

    * **User Story 9 (P0):** As a user, when I select a restaurant from a list or search result, I want to view its details page including its name, photos, address/map, contact information (if available), and the vibe/occasion tags associated with it so that I can get a comprehensive overview before deciding to visit.

      * *Basic Flow:* Tap a restaurant card -> View details screen with relevant info.
    * **User Story 10 (P1):** As a user viewing a recommended restaurant's details, I want to see a brief explanation of *why* it was recommended to me (e.g., "Similar to," "Matches 'First Date' vibe you filtered for") so that I trust the recommendation more.

      * *Basic Flow:* On Restaurant Detail screen (for recommended items) -> See a small section/tooltip like "Recommended because...".
  * **Epic: Curated Content (Potential Future/Lower Priority)**

    * **User Story 11 (P2):** As a user, I want to browse featured lists of restaurants (e.g., "Top Spots for Brunch This Month," "Hidden Gems in VI") potentially curated based on popular trends or themes (initially manually, potentially exploring influencer data later) so that I can discover popular or expert-recommended places.

      * *Basic Flow:* Discover screen -> Browse "Featured Lists" section -> Tap list -> View restaurants.



##### **"DAMN WHY DIDN'T THIS EXIST" UX FEEL**

Here's how we can infuse that "damn, why didn't this exist before" feeling across the Vibe Dining experience, building on the PRD:



###### Discovery \& Browsing Experience



1. Beyond Lists: Don't just show lists of restaurants. Use visually rich layouts (think high-quality images, maybe even short video snippets if feasible later) that immediately convey the vibe. Allow users to switch between list, grid, or map views easily.  
2. Interactive Filtering: Make filtering by vibe/occasion feel less like a chore and more like curating an experience. Use evocative icons or imagery for tags. Show results updating dynamically and smoothly as filters are applied.  
3. Serendipity: While personalization is key, occasionally surface interesting or highly-rated spots slightly outside the user's usual preferences, labeled clearly (e.g., "Hidden Gem Nearby," "Community Favorite") to encourage exploration (Reward of the Hunt).  



###### Restaurant Profile Engagement:



1. Immersive Details: The restaurant page should feel like a mini-experience. Use stunning hero images, clear typography, and well-organized information (address, hours, menu link, vibe tags).  
2. Highlighting the "Why": When showing a personalized recommendation, subtly explain why it's suggested ("Because you love 'Lively Atmosphere' spots" or "Similar to") to build trust and connection.  
3. Effortless Actions: Make core actions like saving to a list, sharing, getting directions, or initiating a rating/comparison incredibly easy and satisfying to perform (Action/Investment).  



###### Rating \& Comparison Interaction:



1. Make it Feel Good: The comparative judgment process needs to be fast, fluid, and visually polished. Consider subtle animations or haptic feedback on selection to make it feel responsive and less like work (Behavioral Design).  
2. Show Progress/Impact: Briefly acknowledge the contribution after a comparison ("Got it!", "Thanks, that helps!") to provide immediate feedback and reinforce the value of their input.  


###### Personalized Spaces (Profile/My Ratings):

1. Visualizing Preferences: Don't just list ranked restaurants. Present the user's personal rankings ("My Liked It List") in a visually appealing way that makes them feel understood and accomplished (Reward of the Self).  
2. Easy Management: Allow users to easily review and adjust their preferences or re-classify restaurants, making them feel in control (Investment).  



###### Overall App Polish \& Personality:

1. Microinteractions: Small, thoughtful animations for loading states, button taps, or successful actions add polish and delight.  
2. Tone of Voice: Use copy (button text, empty states, tips, notifications) that is friendly, helpful, and reflects the app's personality – perhaps encouraging and enthusiastic about food discovery. Avoid generic system messages.  
3. Performance: Ensure the app feels fast and responsive. Slow loading times or laggy scrolling kill the delightful experience.  



Integrating these elements throughout the app lifecycle, guided by principles of emotional design , intuitive UX , and habit formation , is key to moving beyond a simple utility and creating that indispensable feeling.



**5. Detailed Technical Specifications and Non-Functional Requirements**

* **Architecture Overview:**

  * **Frontend:** Mobile Application (Cross-platform: React Native or Flutter recommended for MVP to target iOS \& Android)
  * **Backend:** API Server (e.g., Python/Django/Flask, Node.js/Express)
  * **Database:** Relational DB (e.g., PostgreSQL) for structured data like users, restaurants, ratings, comparisons OR potentially a NoSQL DB (e.g., MongoDB) if flexibility is highly prioritized, though relational seems better fit here.
  * **External APIs:** Google Maps API (for location data, potentially place search, import functionality).
* **Key Modules:**

  * User Authentication: Handles signup, login, session management.
  * Restaurant Management: Stores and serves restaurant details (CRUD operations potentially restricted initially). Data sourcing TBD (manual entry, scraping, 3rd party).
  * Rating \& Comparison Engine: Manages user's broad classifications and implements the binary search logic for comparative rankings. Stores rating/comparison data.
  * Search \& Filtering: Enables text search and filtering by vibe/occasion tags.
  * Recommendation Engine (MVP): Basic version - could recommend restaurants highly rated by users with similar taste profiles, or simply surface highly-ranked items from a user's "Liked It" list that match selected filters.
  * Data Import: Handles connection and data retrieval from Google Maps (requires OAuth).
* **Key API Endpoints (Illustrative):**

  * POST /api/v1/auth/register
  * POST /api/v1/auth/login
  * GET /api/v1/restaurants (Params: search, lat, lon, vibe, occasion)
  * GET /api/v1/restaurants/{restaurant\_id}
  * POST /api/v1/ratings (Body: { restaurant\_id: "...", initial\_classification: "liked" | "okay" | "disliked" })
  * POST /api/v1/comparisons (Body: { restaurant\_id\_1: "...", restaurant\_id\_2: "...", result: "better" | "worse" })
  * GET /api/v1/users/me/ratings (Returns ranked lists)
  * GET /api/v1/recommendations (Params: vibe, occasion)
  * GET /api/v1/vibes (Returns list of available vibe/occasion tags)
  * POST /api/v1/import/googlemaps/initiate
  * POST /api/v1/import/googlemaps/callback
* **Simplified Data Model (Conceptual - PostgreSQL):**

  * users (user\_id PK, email UNIQUE, password\_hash, created\_at)
  * restaurants (restaurant\_id PK, name, address, latitude, longitude, phone, description, photo\_urls JSONB, data\_source)
  * vibes (vibe\_id PK, name UNIQUE) (e.g., 'first\_date', 'instagrammable', 'cheap\_eats')
  * restaurant\_vibes (restaurant\_id FK, vibe\_id FK, PRIMARY KEY (restaurant\_id, vibe\_id))
  * user\_ratings (rating\_id PK, user\_id FK, restaurant\_id FK, classification TEXT CHECK (classification IN ('liked', 'okay', 'disliked')), rank\_score INTEGER, created\_at, updated\_at) -- rank\_score derived/updated by comparisons
  * user\_comparisons (comparison\_id PK, user\_id FK, restaurant\_id\_better FK, restaurant\_id\_worse FK, created\_at) -- Records the outcome of a comparison
  * auth\_tokens (token\_id PK, user\_id FK, token\_hash, expires\_at)
* **Non-Functional Requirements:**

  * **Performance:** API endpoints should respond < 500ms under typical load. App should feel responsive; list scrolling should be smooth.
  * **Scalability:** Architecture should support initial launch target (e.g., 10k-50k users in Lagos) and allow for future horizontal scaling of API servers and database read replicas.
  * **Reliability:** Target API uptime > 99.5%. Implement database backups and basic monitoring/alerting.
  * **Security:** Secure password hashing (e.g., bcrypt), HTTPS for all communication, protection against common vulnerabilities (OWASP Top 10), secure handling of API keys and user data.
  * **Data Integrity:** Ensure comparisons accurately update rank scores. Prevent orphaned data. Validate inputs.
  * **Usability:** The comparative rating process must be intuitive and quick to avoid user fatigue.

**6. Go-To-Market (GTM) \& Rollout Phases**

**6.1. Minimum Viable Product (MVP) Features**

* **Goal:** Launch an initial version of Vibe Dining focused on validating the core value proposition – the comparative rating system – with the target audience in Lagos. Gather user feedback quickly to inform future iterations.
* **MVP Scope:**

  * User Authentication (Email/Password, Google Sign-in)
  * Basic User Profile Management
  * Restaurant Database (Focused initial Lagos coverage)
  * Search Functionality (Keyword, Location)
  * Basic Filters (Cuisine, Price, Location, Open Now)
  * *Limited* Occasion/Sentiment Tag Filters (e.g., 3-5 core tags like 'First Date', 'Group Hangout', 'Instagrammable')
  * Core Pairwise Comparison Engine (focused on 'Overall' context initially, potentially one key tag context)
  * Display of Comparative Rank/Score on Restaurant Profiles
  * Basic Recommendation Feed (e.g., based on top-ranked restaurants)
* **Excluded from MVP:**

  * Visited Places Import (High complexity, high privacy risk, NDPR burden)
  * Full Occasion/Sentiment Tag Filtering Suite
  * Advanced Contextual Comparisons (beyond 1-2 contexts)
  * Sophisticated Recommendation Engine (Collaborative Filtering, etc.)
  * Influencer Content Integration
  * User-Created Lists/Collections
  * Social Features (Sharing, Following)
  * Booking/Reservation Integrations
  * Deals/Offers Section
* **Feature Prioritization Table:**

|Feature|Brief Description|Justification / Dependencies|
|-|-|-|
|User Authentication|Secure login/registration|Core requirement for personalization \& tracking comparisons.|
|Restaurant Database|Basic Lagos restaurant data|Core content needed for discovery \& comparison.|
|Search \& Basic Filters|Find restaurants by name, location, price, cuisine|Essential discovery functionality.|
|**Pairwise Comparison Engine**|Core A vs B rating mechanism|**Central Value Proposition.** Must validate this concept.|
|**Display Comparative Rank/Score**|Show results of comparisons|Closes the loop for the core rating feature.|
|Limited Occasion/Sentiment Filters|Filter by 3-5 key tags|Introduces the concept without full complexity. Tests tag filtering value.|
|Basic Recommendations|Simple feed (e.g., top-ranked)|Provides initial discovery value beyond search.|
|Full Occasion/Sentiment Filters|Comprehensive tag filtering|Build upon validated MVP tag filtering. Requires full tag curation.|
|Advanced Contextual Comparisons|Rate based on multiple specific contexts|Adds depth to rating system. Depends on user adoption of basic comparison.|
|Advanced Recommendation Engine|Collaborative filtering, deeper personalization|Requires sufficient user comparison data. Enhances personalization.|
|**Visited Places Import**|Import history from Google Takeout|High technical complexity, significant privacy/NDPR risk.24 Defer until core product is stable \& compliance is robustly handled. Requires DPIA.|
|**Influencer Integration**|Partner content (lists, reviews)|Requires establishing partnerships.52 Avoids risky scraping.58 Focus on core product first.|
|User Lists/Collections|Allow users to save/organize restaurants|Standard feature, enhances engagement.|
|Social Features|Sharing, following users|Lower priority than core discovery/rating.|
|Booking/Offers Integration|Link to booking platforms, show deals|Potential monetization/partnership avenue. Depends on API availability.41|
|Expansion to Other Cities|Launch in Abuja, etc.|Requires replicating database and potentially localizing tags/influencers.42|

* **Rationale for Table:** Defining a clear MVP scope 14 is crucial for focusing development resources on validating the core innovation (comparative rating) and mitigating risks associated with complex features like location import and influencer scraping/partnerships. This table provides a roadmap for iterative development based on priority and dependencies.

**6.2. Future Enhancements**

Based on MVP feedback, user data, and business priorities, future iterations could include:

* Expansion of Occasion/Sentiment Tag filtering and contextual comparisons.
* Implementation of the Visited Places Import feature (pending successful DPIA and robust compliance).
* Development of a more sophisticated, personalized recommendation engine.
* Integration of curated content through partnerships with influencers and publications.
* Features allowing users to create and share personal restaurant lists.
* Social features enabling users to follow others or share discoveries.
* Integration with third-party reservation platforms (e.g., Reisty 41, OpenTable 65) if feasible via APIs.
* Addition of a deals and special offers section.41
* Geographic expansion to other major Nigerian cities like Abuja.42

**7. Risks \& Open Questions**

* **Risks:**

  * User adoption of the novel comparative rating system.
  * Maintaining data quality and comprehensiveness for Lagos restaurants.
  * Scalability challenges as user base and comparison data grow.
  * Ensuring robust NDPR compliance, especially if location import is pursued.
  * Competition from existing platforms or new entrants.
  * Potential for user fatigue with the comparison process if not designed engagingly.
* **Open Questions:**

  * Optimal algorithm for the Adaptive Comparative Judgement engine?
  * Specific threshold for minimum comparisons needed for reliable ranking display?
  * Viability and ROI of potential monetization strategies?
  * Preferred method for sourcing and updating restaurant data (manual, partnerships, controlled scraping)?
  * User acceptance and perceived value of occasion/vibe tagging?
  * Feasibility and terms of potential partnerships with influencers or booking platforms?

**8. Success Metrics**

* **Requirement:** Implement analytics tracking to monitor application usage, user engagement, system health, and the effectiveness of the core features.
* **Key Metrics to Track:**

  * **User Engagement:** Daily Active Users (DAU), Monthly Active Users (MAU), Session Duration, Session Frequency, User Retention Rate (Day 1, Day 7, Day 30), Churn Rate.
  * **Core Feature Usage:** Number of Pairwise Comparisons Made (total, per user, per restaurant, per context), Comparison Completion Rate, Filter Usage Frequency (by filter type, by tag), Search Query Volume \& Success Rate, Restaurant Profile Views.
  * **Content \& Growth:** Number of Restaurants in Database (growth over time), Restaurant Profile Completion Rate, User-Generated Content Volume (if applicable later).
  * **Adoption (Specific Features):** Adoption Rate of Visited Places Import (if implemented), Usage of Influencer Lists (if implemented).
  * **App Performance:** API Error Rates, Average API Response Times, App Crash Rate.
  * **Business/Product:** User Acquisition Cost (CAC), Conversion Rates (if applicable, e.g., clicking phone number, navigating), App Store Ratings \& Reviews.
* **Tools:** Utilize analytics platforms (e.g., Mixpanel, Amplitude, Firebase Analytics) for event tracking and reporting. Set up backend monitoring for performance and errors.

**9. Appendix**

**9.1. Glossary**

* **ACJ (Adaptive Comparative Judgement):** An assessment method where items are judged in pairs ('which is better?'), and the system adaptively chooses pairs to efficiently create a reliable rank order.
* **API (Application Programming Interface):** A set of rules and protocols for building and interacting with software applications.
* **CAGR (Compound Annual Growth Rate):** The mean annual growth rate of an investment over a specified period longer than one year.
* **DPIA (Data Protection Impact Assessment):** A process to help identify and minimize the data protection risks of a project, required under NDPR for high-risk processing.
* **DPO (Data Protection Officer):** An individual or entity appointed to oversee data protection strategy and implementation within an organization, required under certain conditions by NDPR.
* **Gen Z:** Generation Z, typically individuals born between the mid-to-late 1990s and the early 2010s.
* **JSON (JavaScript Object Notation):** A lightweight data-interchange format that is easy for humans to read and write and easy for machines to parse and generate.
* **KLOC (Kilo Lines of Code):** A unit used to measure the size of a software program (1 KLOC = 1000 lines of code).
* **Millennials:** Generation Y, typically individuals born between the early 1980s and the mid-1990s.
* **MVP (Minimum Viable Product):** A version of a new product which allows a team to collect the maximum amount of validated learning about customers with the least effort.
* **NDPR (Nigeria Data Protection Regulation):** The primary data protection law in Nigeria, issued by NITDA.
* **NITDA (National Information Technology Development Agency):** The Nigerian government agency responsible for information technology development and regulation, including data protection.
* **NLP (Natural Language Processing):** A subfield of artificial intelligence focused on enabling computers to process and understand human language.
* **Pairwise Comparison:** The process of comparing entities in pairs to judge which is preferred or has more of some quantitative property.
* **Sentiment Tag:** A descriptive label used in this context to categorize restaurants based on suitability for specific occasions, moods, or vibes (e.g., 'First Date', 'Instagrammable').
* **Takeout (Google Takeout):** A service provided by Google that allows users to export their data from various Google products, including Location History.

**9.2. Research References**

1

#### **Works cited**

1. The New CSD Consumers in Nigeria: Gen-Zs, and an unusual suspect - Pierrine Consulting, accessed May 3, 2025, [https://www.pierrine-consulting.com/csd-nigeria-gen-zs/](https://www.pierrine-consulting.com/csd-nigeria-gen-zs/)
2. Millennials vs. Gen Z: Who Spends More on Dining Out? - Investopedia, accessed May 3, 2025, [https://www.investopedia.com/millennials-vs-gen-z-dining-out-spending-8754332](https://www.investopedia.com/millennials-vs-gen-z-dining-out-spending-8754332)
3. Generation Z food trends and habits that affect restaurants - BIM POS, accessed May 3, 2025, [https://bimpos.com/blog/what-are-the-eating-habits-of-gen-z-that-affect-restaurants](https://bimpos.com/blog/what-are-the-eating-habits-of-gen-z-that-affect-restaurants)
4. How Gen Z Entrepreneurs Can Thrive in Nigerian Tourism Industry - Rex Clarke Adventures, accessed May 3, 2025, [https://rexclarkeadventures.com/how-gen-z-entrepreneurs-can-thrive-in-nigerian-tourism-industry/](https://rexclarkeadventures.com/how-gen-z-entrepreneurs-can-thrive-in-nigerian-tourism-industry/)
5. Nigeria Foodservice Market Size \& Share Analysis - Industry Research Report - Growth Trends - Mordor Intelligence, accessed May 3, 2025, [https://www.mordorintelligence.com/industry-reports/nigeria-foodservice-market](https://www.mordorintelligence.com/industry-reports/nigeria-foodservice-market)
6. Orda Pulse 2024: The Food Trend Tracker, accessed May 3, 2025, [https://orda.africa/orda-pulse-2024-the-food-trend-tracker/](https://orda.africa/orda-pulse-2024-the-food-trend-tracker/)
7. This is the second restaurant rating scam I've seen this week - Reddit, accessed May 3, 2025, [https://www.reddit.com/r/Scams/comments/vvym08/this\_is\_the\_second\_restaurant\_rating\_scam\_ive/](https://www.reddit.com/r/Scams/comments/vvym08/this_is_the_second_restaurant_rating_scam_ive/)
8. Online Customer Reviews: Their Impact on Restaurants - EHL Insights, accessed May 3, 2025, [https://hospitalityinsights.ehl.edu/online-customer-reviews-restaurants](https://hospitalityinsights.ehl.edu/online-customer-reviews-restaurants)
9. The Biggest Food Critic In Nigeria | TikTok, accessed May 3, 2025, [https://www.tiktok.com/@opeyemifamakin/video/7045182500980690182](https://www.tiktok.com/@opeyemifamakin/video/7045182500980690182)
10. Nigeria Hotel Market Report 2025 - Aninver Development Partners, accessed May 3, 2025, [https://aninver.com/blog/nigeria-hotel-market-report-2025](https://aninver.com/blog/nigeria-hotel-market-report-2025)
11. Place Details | Places API - Google for Developers, accessed May 3, 2025, [https://developers.google.com/maps/documentation/places/web-service/details](https://developers.google.com/maps/documentation/places/web-service/details)
12. \#RW2024: Lost In Lagos Plus Magazine Releases Their November Issue | BellaNaija, accessed May 3, 2025, [https://www.bellanaija.com/2024/11/lost-in-lagos-plus-magazine-november/](https://www.bellanaija.com/2024/11/lost-in-lagos-plus-magazine-november/)
13. Fine Fettle: Lost In Lagos Plus Magazine Releases Their May Issue - BellaNaija, accessed May 3, 2025, [https://www.bellanaija.com/2024/05/lost-in-lagos-plus-magazine-may-issue/](https://www.bellanaija.com/2024/05/lost-in-lagos-plus-magazine-may-issue/)
14. How to Design a Database For Tagging Service? - GeeksforGeeks, accessed May 3, 2025, [https://www.geeksforgeeks.org/how-to-design-a-database-for-tagging-service/](https://www.geeksforgeeks.org/how-to-design-a-database-for-tagging-service/)
15. The Right Way To Use Tagging In The Cloud | the agile admin, accessed May 3, 2025, [https://theagileadmin.com/2025/01/29/the-right-way-to-use-tagging-in-the-cloud/](https://theagileadmin.com/2025/01/29/the-right-way-to-use-tagging-in-the-cloud/)
16. Is It All Relative? Comparative Judgments and the Possible Improvement of Self-Ratings and Ratings of Others | Request PDF - ResearchGate, accessed May 3, 2025, [https://www.researchgate.net/publication/258180058\_Is\_It\_All\_Relative\_Comparative\_Judgments\_and\_the\_Possible\_Improvement\_of\_Self-Ratings\_and\_Ratings\_of\_Others](https://www.researchgate.net/publication/258180058_Is_It_All_Relative_Comparative_Judgments_and_the_Possible_Improvement_of_Self-Ratings_and_Ratings_of_Others)
17. An Open-Source Adaptive Comparative Judgement App for Technology Education Research and Practice - ERIC, accessed May 3, 2025, [https://files.eric.ed.gov/fulltext/EJ1448066.pdf](https://files.eric.ed.gov/fulltext/EJ1448066.pdf)
18. Full article: Assessing writing quality using crowdsourced non-expert comparative judgement ratings - Taylor \& Francis Online, accessed May 3, 2025, [https://www.tandfonline.com/doi/full/10.1080/0969594X.2025.2467664?src=](https://www.tandfonline.com/doi/full/10.1080/0969594X.2025.2467664?src)
19. Using Adaptive Comparative Judgement as a reliable way to assess oracy at scale, accessed May 3, 2025, [https://blog.rmresults.com/using-adaptive-comparative-judgement-as-a-reliable-way-to-assess-oracy-at-scale](https://blog.rmresults.com/using-adaptive-comparative-judgement-as-a-reliable-way-to-assess-oracy-at-scale)
20. Examining the Validity of Adaptive Comparative Judgment for Peer Evaluation in a Design Thinking Course - Frontiers, accessed May 3, 2025, [https://www.frontiersin.org/journals/education/articles/10.3389/feduc.2021.772832/full](https://www.frontiersin.org/journals/education/articles/10.3389/feduc.2021.772832/full)
21. Pairwise Ranking (Tools, Examples, Methods) // OpinionX — Free Stack Ranking Surveys, accessed May 3, 2025, [https://www.opinionx.co/blog/best-free-pairwise-ranking-tools](https://www.opinionx.co/blog/best-free-pairwise-ranking-tools)
22. Paired Comparison: A User Perspective - Carnegie Mellon University, accessed May 3, 2025, [https://mse.s3d.cmu.edu/facstaff/faculty1/faculty-publications/miranda/sasaopairedcomparisonexperiencereport.pdf](https://mse.s3d.cmu.edu/facstaff/faculty1/faculty-publications/miranda/sasaopairedcomparisonexperiencereport.pdf)
23. Ethical Web Scraping: Principles and Practices - DataCamp, accessed May 3, 2025, [https://www.datacamp.com/blog/ethical-web-scraping](https://www.datacamp.com/blog/ethical-web-scraping)
24. Nigeria Data Protection Regulation (NDPR) | What is it \& How to be Compliant? - Appknox, accessed May 3, 2025, [https://www.appknox.com/blog/5-steps-to-compliance-with-the-nigeria-data-protection-regulation](https://www.appknox.com/blog/5-steps-to-compliance-with-the-nigeria-data-protection-regulation)
25. NIGERIA DATA PROTECTION REGULATION 2019: IMPLEMENTATION FRAMEWORK - NITDA, accessed May 3, 2025, [https://nitda.gov.ng/wp-content/uploads/2021/01/NDPR-Implementation-Framework.pdf](https://nitda.gov.ng/wp-content/uploads/2021/01/NDPR-Implementation-Framework.pdf)
26. guidelines for the management of personal data by public institutions in nigeria, 2020 | nitda, accessed May 3, 2025, [https://nitda.gov.ng/wp-content/uploads/2020/11/GuidelinesForImplementationOfNDPRInPublicInstitutionsFinal11.pdf](https://nitda.gov.ng/wp-content/uploads/2020/11/GuidelinesForImplementationOfNDPRInPublicInstitutionsFinal11.pdf)
27. NIGERIA DATA PROTECTION REGULATION 2019: IMPLEMENTATION FRAMEWORK - DataGuidance, accessed May 3, 2025, [https://www.dataguidance.com/sites/default/files/ndpr\_implementation\_framework\_november\_2020.pdf](https://www.dataguidance.com/sites/default/files/ndpr_implementation_framework_november_2020.pdf)
28. NDPR COMPLIANCE CHECKLIST.docx, accessed May 3, 2025, [https://taxtech.com.ng/download/Free/NDPR%20COMPLIANCE%20CHECKLIST.docx](https://taxtech.com.ng/download/Free/NDPR%2520COMPLIANCE%2520CHECKLIST.docx)
29. Export full location timeline data in JSON (or similar) format in the new version of Timeline, accessed May 3, 2025, [https://support.google.com/maps/thread/264641290/export-full-location-timeline-data-in-json-or-similar-format-in-the-new-version-of-timeline?hl=en](https://support.google.com/maps/thread/264641290/export-full-location-timeline-data-in-json-or-similar-format-in-the-new-version-of-timeline?hl=en)
30. Records.json - Location History Format, accessed May 3, 2025, [https://locationhistoryformat.com/reference/records/](https://locationhistoryformat.com/reference/records/)
31. Can Google Takeout Location Data Be Trusted? - DFIR Review, accessed May 3, 2025, [https://dfir.pubpub.org/pub/d39u7lg1](https://dfir.pubpub.org/pub/d39u7lg1)
32. Overview | Places API - Google for Developers, accessed May 3, 2025, [https://developers.google.com/maps/documentation/places/web-service/overview](https://developers.google.com/maps/documentation/places/web-service/overview)
33. JSON: How to Read Your Google Location Data - gifGuide2Code - WordPress.com, accessed May 3, 2025, [https://gifguide2code.wordpress.com/2018/02/12/json-how-to-read-your-google-location-data/](https://gifguide2code.wordpress.com/2018/02/12/json-how-to-read-your-google-location-data/)
34. Convert the Location History JSON File from Google Takeout into a useable format - GitHub, accessed May 3, 2025, [https://github.com/Scarygami/location-history-json-converter](https://github.com/Scarygami/location-history-json-converter)
35. 12 best Google Maps API alternatives on the market right now - Radar, accessed May 3, 2025, [https://radar.com/blog/google-maps-api-alternatives-competitors](https://radar.com/blog/google-maps-api-alternatives-competitors)
36. Google Maps Alternatives, 2025 Guide - Woosmap, accessed May 3, 2025, [https://www.woosmap.com/blog/top-google-maps-alternatives](https://www.woosmap.com/blog/top-google-maps-alternatives)
37. Top Google Maps Alternatives for Privacy and More - Routific, accessed May 3, 2025, [https://www.routific.com/blog/google-maps-alternatives](https://www.routific.com/blog/google-maps-alternatives)
38. Best 7 Map APIs \& Google Maps Alternatives - Datarade, accessed May 3, 2025, [https://datarade.ai/top-lists/best-map-apis](https://datarade.ai/top-lists/best-map-apis)
39. Best Alternatives to Google Maps for Privacy and Navigation, accessed May 3, 2025, [https://www.upperinc.com/alternatives/google-maps/](https://www.upperinc.com/alternatives/google-maps/)
40. A Ranking Recommendation Algorithm Based on Dynamic User Preference - PMC, accessed May 3, 2025, [https://pmc.ncbi.nlm.nih.gov/articles/PMC9698759/](https://pmc.ncbi.nlm.nih.gov/articles/PMC9698759/)
41. how-reisty-helps-you-find-the-best-deals-at-lagos-restaurants, accessed May 3, 2025, [https://www.reisty.com/blog/how-reisty-helps-you-find-the-best-deals-at-lagos-restaurants](https://www.reisty.com/blog/how-reisty-helps-you-find-the-best-deals-at-lagos-restaurants)
42. Shared Plates, Shared Stories: Lost In Lagos Plus Magazine Releases Their August Issue, accessed May 3, 2025, [https://www.bellanaija.com/2024/08/lost-in-lagos-plus-magazine-august-issue/](https://www.bellanaija.com/2024/08/lost-in-lagos-plus-magazine-august-issue/)
43. TIMA: Influencer Marketing Agency in Lagos, Nigeria, accessed May 3, 2025, [https://tima.agency/](https://tima.agency/)
44. We Found Foodie Heaven! WATCH Eat Drink Lagos on CNN African Voices | BellaNaija, accessed May 3, 2025, [https://www.bellanaija.com/2016/01/we-found-foodie-heaven-watch-eat-drink-lagos-on-cnn-african-voices/](https://www.bellanaija.com/2016/01/we-found-foodie-heaven-watch-eat-drink-lagos-on-cnn-african-voices/)
45. Websites We Love: Eat Drink Lagos - Connectnigeria Articles, accessed May 3, 2025, [https://articles.connectnigeria.com/eat-drink-lagos/](https://articles.connectnigeria.com/eat-drink-lagos/)
46. How Eat, Drink Lagos changed the business of food festivals in Nigeria - Businessday NG, accessed May 3, 2025, [https://businessday.ng/art-and-travel/article/eat-drink-lagos-changed-business-food-festivals-nigeria/](https://businessday.ng/art-and-travel/article/eat-drink-lagos-changed-business-food-festivals-nigeria/)
47. From Eat Drink Lagos to Tix, Folayemi Agusto is committed to empowering women and redefining events - Marie Claire Nigeria, accessed May 3, 2025, [https://marieclaire.ng/from-eat-drink-lagos-to-tix-folayemi-agusto-is-committed-to-empowering-women-and-redefining-events/](https://marieclaire.ng/from-eat-drink-lagos-to-tix-folayemi-agusto-is-committed-to-empowering-women-and-redefining-events/)
48. EatDrinkLagos: From Food Blog to Festival to Tix.africa Event Tech Company with Nosa and Folayemi - YouTube, accessed May 3, 2025, [https://www.youtube.com/watch?v=ypxR\_Kc50Mc](https://www.youtube.com/watch?v=ypxR_Kc50Mc)
49. Sites using Webpack in production (BigQuery) - GitHub Gist, accessed May 3, 2025, [https://gist.github.com/addyosmani/6eebf2da86c6de74c0c7fd9100e0a2ac](https://gist.github.com/addyosmani/6eebf2da86c6de74c0c7fd9100e0a2ac)
50. Movement: Lost In Lagos Plus Magazine Debuts Their Community Issue - BellaNaija, accessed May 3, 2025, [https://www.bellanaija.com/2025/03/movement-lost-in-lagos-plus-magazine/](https://www.bellanaija.com/2025/03/movement-lost-in-lagos-plus-magazine/)
51. Exclusive Restaurant Deals in Abuja and Lagos | TikTok, accessed May 3, 2025, [https://www.tiktok.com/@seeabuja/video/7301007966197665030](https://www.tiktok.com/@seeabuja/video/7301007966197665030)
52. Food - TIMA: Influencer Marketing Agency in Lagos, Nigeria, accessed May 3, 2025, [https://tima.agency/projects\_cat/food/](https://tima.agency/projects_cat/food/)
53. Best Influencer Marketing Agency in Nigeria | Brand Monitoring - Content Krush, accessed May 3, 2025, [https://contentkrush.com/service/influencer-marketing-agency-nigeria/](https://contentkrush.com/service/influencer-marketing-agency-nigeria/)
54. Buy Nigerian Influencer Marketing Agency by Richee Media on Selar, accessed May 3, 2025, [https://selar.com/influencer-marketing-agency-lagos-nigeria](https://selar.com/influencer-marketing-agency-lagos-nigeria)
55. Best Influencer Marketing Agency in Lagos Nigeria - Richee Media, accessed May 3, 2025, [https://richeemedia.com.ng/services/influencer-marketing-agency-in-lagos-nigeria/](https://richeemedia.com.ng/services/influencer-marketing-agency-in-lagos-nigeria/)
56. How to Scrape Instagram Explore Page: Complete Guide for 2025, accessed May 3, 2025, [https://dicloak.com/blog-detail/how-to-scrape-instagram-explore-page-complete-guide-for-2025](https://dicloak.com/blog-detail/how-to-scrape-instagram-explore-page-complete-guide-for-2025)
57. Is Website Scraping Legal? All You Need to Know - GDPR Local, accessed May 3, 2025, [https://gdprlocal.com/is-website-scraping-legal-all-you-need-to-know/](https://gdprlocal.com/is-website-scraping-legal-all-you-need-to-know/)
58. Ultimate Instagram Scraper Guide: Top Tools and Best Practices for 2025, accessed May 3, 2025, [https://www.coronium.io/blog/instagram-scraper-guide](https://www.coronium.io/blog/instagram-scraper-guide)
59. Is Web Scraping Legal? Ethical Web Scraping Guide in 2025 - Research AIMultiple, accessed May 3, 2025, [https://research.aimultiple.com/web-scraping-ethics/](https://research.aimultiple.com/web-scraping-ethics/)
60. NLTK vs spaCy: A Deeper Dive into NLP Libraries - Seaflux, accessed May 3, 2025, [https://www.seaflux.tech/blogs/nltk-vs-spacy-nlp-libraries-comparison/](https://www.seaflux.tech/blogs/nltk-vs-spacy-nlp-libraries-comparison/)
61. NLP with spaCy, NLTK, \& GENSIM - Kaggle, accessed May 3, 2025, [https://www.kaggle.com/code/faressayah/nlp-with-spacy-nltk-gensim](https://www.kaggle.com/code/faressayah/nlp-with-spacy-nltk-gensim)
62. Natural Language Processing With spaCy in Python, accessed May 3, 2025, [https://realpython.com/natural-language-processing-spacy-python/](https://realpython.com/natural-language-processing-spacy-python/)
63. NLP Libraries in Python | GeeksforGeeks, accessed May 3, 2025, [https://www.geeksforgeeks.org/nlp-libraries-in-python/](https://www.geeksforgeeks.org/nlp-libraries-in-python/)
64. 6 Must-Know Python Sentiment Analysis Libraries - Netguru, accessed May 3, 2025, [https://www.netguru.com/blog/python-sentiment-analysis-libraries](https://www.netguru.com/blog/python-sentiment-analysis-libraries)
65. The best restaurants in Nigeria | (Updated 2025) - OpenTable, accessed May 3, 2025, [https://www.opentable.com/metro/nigeria](https://www.opentable.com/metro/nigeria)
66. Reisty | Discover and Book Top Restaurants in Lagos - Instantly, accessed May 3, 2025, [https://www.reisty.com/](https://www.reisty.com/)
67. lostinlagosmagazine Publisher Publications - Issuu, accessed May 3, 2025, [https://issuu.com/lostinlagosmagazine](https://issuu.com/lostinlagosmagazine)
68. Research Document: Nigeria's Private Sector in 2025 Adapting to Economic Uncertainty for Growth and Resilience, accessed May 3, 2025, [https://nesgroup.org/researchdocument/nigeria%27s-private-sector-in-2025-adapting-to-economic-uncertainty-for-growth-and-resilience](https://nesgroup.org/researchdocument/nigeria%2527s-private-sector-in-2025-adapting-to-economic-uncertainty-for-growth-and-resilience)
69. Design Restaurant Management System - GeeksforGeeks, accessed May 3, 2025, [https://www.geeksforgeeks.org/design-restaurant-management-system-system-design/](https://www.geeksforgeeks.org/design-restaurant-management-system-system-design/)
70. Restaurant App Design: A Guide to Excel in UI/UX - Nimble AppGenie, accessed May 3, 2025, [https://www.nimbleappgenie.com/blogs/restaurant-app-design-guide/](https://www.nimbleappgenie.com/blogs/restaurant-app-design-guide/)
71. A Preference Judgment Tool for Authoritative Assessment | Request PDF - ResearchGate, accessed May 3, 2025, [https://www.researchgate.net/publication/372537847\_A\_Preference\_Judgment\_Tool\_for\_Authoritative\_Assessment](https://www.researchgate.net/publication/372537847_A_Preference_Judgment_Tool_for_Authoritative_Assessment)
72. ranking based on user preference - algorithm - Stack Overflow, accessed May 3, 2025, [https://stackoverflow.com/questions/12426935/ranking-based-on-user-preference](https://stackoverflow.com/questions/12426935/ranking-based-on-user-preference)
73. Understanding the Gen Z in Nigeria: Trends and Insights - Sagaci Research, accessed May 3, 2025, [https://sagaciresearch.com/gen-z-nigeria-insights/](https://sagaciresearch.com/gen-z-nigeria-insights/)
74. NESG Launches 2025 Private Sector Outlook: Adapting to Economic Uncertainties for Growth and Resilience, accessed May 3, 2025, [https://nesgroup.org/blog/NESG-Launches-2025-Private-Sector-Outlook:-Adapting-to-Economic-Uncertainties-for-Growth-and-Resilience](https://nesgroup.org/blog/NESG-Launches-2025-Private-Sector-Outlook:-Adapting-to-Economic-Uncertainties-for-Growth-and-Resilience)
75. FoodCourt, accessed May 3, 2025, [https://www.getfoodcourt.com/](https://www.getfoodcourt.com/)
76. LA LISTE, the world's best restaurant selection, accessed May 3, 2025, [https://www.laliste.com/](https://www.laliste.com/)
77. Lagos MICHELIN Restaurants - The MICHELIN Guide, accessed May 3, 2025, [https://guide.michelin.com/us/en/faro-region/pt-lagos/restaurants](https://guide.michelin.com/us/en/faro-region/pt-lagos/restaurants)
78. Assessment of Food Service Quality of Chicken Republic and Mega Chicken Restaurants, Lagos, Nigeria - Scientific Research Publishing, accessed May 3, 2025, [https://www.scirp.org/journal/paperinformation?paperid=110194](https://www.scirp.org/journal/paperinformation?paperid=110194)
79. Nigeria Food Security Index Shows Weak Storage Rating Stoking Food Insecurity - YouTube, accessed May 3, 2025, [https://www.youtube.com/watch?v=PRsI-DFPJVY](https://www.youtube.com/watch?v=PRsI-DFPJVY)
80. Rating Scales in UX Research: The Ultimate Guide - The Interaction Design Foundation, accessed May 3, 2025, [https://www.interaction-design.org/literature/article/rating-scales-for-ux-research](https://www.interaction-design.org/literature/article/rating-scales-for-ux-research)
81. Visualize your data on a custom map using Google My Maps, accessed May 3, 2025, [https://www.google.com/earth/outreach/learn/visualize-your-data-on-a-custom-map-using-google-my-maps/](https://www.google.com/earth/outreach/learn/visualize-your-data-on-a-custom-map-using-google-my-maps/)
82. Grabbing data from google places api - Stack Overflow, accessed May 3, 2025, [https://stackoverflow.com/questions/24375080/grabbing-data-from-google-places-api](https://stackoverflow.com/questions/24375080/grabbing-data-from-google-places-api)
83. Is it possible to import locations from user-created maps to the google map API?, accessed May 3, 2025, [https://stackoverflow.com/questions/1375036/is-it-possible-to-import-locations-from-user-created-maps-to-the-google-map-api](https://stackoverflow.com/questions/1375036/is-it-possible-to-import-locations-from-user-created-maps-to-the-google-map-api)
84. A pile of oranges sitting on top of each other. Tangerine orange fruit. - PICRYL - itoldya test1, accessed May 3, 2025, [https://itoldya420.getarchive.net/amp/media/tangerine-orange-fruit-food-drink-3a3aa0](https://itoldya420.getarchive.net/amp/media/tangerine-orange-fruit-food-drink-3a3aa0)
85. Latest on News | Page 399 of 2043. Read on BellaNaija - February 20, 2025, accessed May 3, 2025, [https://www.bellanaija.com/news/page/399/](https://www.bellanaija.com/news/page/399/)
86. Ikeja | Awé Lagos - WordPress.com, accessed May 3, 2025, [https://awelagos.wordpress.com/tag/ikeja/](https://awelagos.wordpress.com/tag/ikeja/)
87. Maggot Found in Cruise Joe Restaurant | TikTok, accessed May 3, 2025, [https://www.tiktok.com/discover/maggot-found-in-cruise-joe-restaurant](https://www.tiktok.com/discover/maggot-found-in-cruise-joe-restaurant)
88. Awari App | Discover and Experience your City, accessed May 3, 2025, [https://www.awariapp.com/](https://www.awariapp.com/)
89. Tannaz Etebarian - Social Media Week Lagos 2020 - Schedule, accessed May 3, 2025, [https://socialmediaweeklagos2020.sched.com/speaker/tbahnam](https://socialmediaweeklagos2020.sched.com/speaker/tbahnam)
90. Celebrations: Lost In Lagos Plus Magazine Releases Their Last Issue for 2024 | BellaNaija, accessed May 3, 2025, [https://www.bellanaija.com/2024/12/lost-in-lagos-plus-magazine-december-issue/](https://www.bellanaija.com/2024/12/lost-in-lagos-plus-magazine-december-issue/)
91. LOST IN LAGOS? 5 HELPFUL TIPS YOU NEED TO GET THROUGH - ericotrips, accessed May 3, 2025, [https://ericotrips.wordpress.com/2019/04/22/lost-in-lagos-5-helpful-tips-you-need-to-get-through/](https://ericotrips.wordpress.com/2019/04/22/lost-in-lagos-5-helpful-tips-you-need-to-get-through/)
92. Lost in Lagos Movie Cast Members | TikTok, accessed May 3, 2025, [https://www.tiktok.com/discover/lost-in-lagos-movie-cast-members](https://www.tiktok.com/discover/lost-in-lagos-movie-cast-members)
93. SA mourns 67 lost in Lagos church tragedy - IOL, accessed May 3, 2025, [https://iol.co.za/news/africa/2014-09-17-sa-mourns-67-lost-in-lagos-church-tragedy/](https://iol.co.za/news/africa/2014-09-17-sa-mourns-67-lost-in-lagos-church-tragedy/)
94. LagosPhoto 2011 In Review Video Clip | lagos and found, accessed May 3, 2025, [https://lagosandfound.wordpress.com/2012/03/18/httpwww-youtube-comwatchv9mnfax6bdqe/](https://lagosandfound.wordpress.com/2012/03/18/httpwww-youtube-comwatchv9mnfax6bdqe/)
95. Pairwise comparison method \& pairwise ranking | 1000minds, accessed May 3, 2025, [https://www.1000minds.com/decision-making/pairwise-comparison](https://www.1000minds.com/decision-making/pairwise-comparison)
96. Pairwise Comparison: Definition, Methods, Tools, Examples // OpinionX — Free Stack Ranking Surveys, accessed May 3, 2025, [https://www.opinionx.co/blog/pairwise-comparison](https://www.opinionx.co/blog/pairwise-comparison)
97. Rating Scales in UX Research: Types, Use Cases \& Examples | Maze, accessed May 3, 2025, [https://maze.co/blog/rating-scale/](https://maze.co/blog/rating-scale/)
98. A Guide to Restaurant Menu Design, Menu Layout \& Menu Size - TouchBistro, accessed May 3, 2025, [https://www.touchbistro.com/blog/restaurant-menu-design/](https://www.touchbistro.com/blog/restaurant-menu-design/)
99. RM Compare - The world leading Adaptive Comparative Judgement system, accessed May 3, 2025, [https://compare.rm.com/](https://compare.rm.com/)
100. accessed January 1, 1970, [https://www.eatdrinklagos.com/](https://www.eatdrinklagos.com/)

