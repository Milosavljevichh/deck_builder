**Game Design Document: Parasite Pact (Prototype)**

---

## **Overview**

A strategic 2D deck-building game where the player must tactically sacrifice and adapt their deck over time to survive increasingly difficult encounters. The game is focused on *fairness*, *strategy*, and *intermediate difficulty*, with an infinite loop structure centered around beating your high score.

---

## **Core Gameplay Loop**

1. **Draw Phase**

   * Player draws 5 cards from a shuffled deck.

2. **Play Phase**

   * Player uses cards for attack, defense, manipulation, or special effects.
   * Each card may contribute to the Parasite Meter.

3. **Parasite Phase**

   * Parasite reacts based on its current state:

     * Mutates a card
     * Locks a card
     * Demands a sacrifice (player chooses from 3 cards to destroy permanently)
     * Offers a Parasite Boon

4. **Enemy Turn**

   * Enemies act with telegraphed intentions (e.g., "Enemy will deal 12 damage next turn").
   * Strategic counterplay is expected.

5. **Post-Battle Phase**

   * Player receives rewards:

     * Card gain pool (salvaged, mutated, or new cards)
     * Optional card restoration or mutation offers
     * Parasite Boon offers (risk-reward mechanics)

6. **Repeat** until player dies.

---

## **Key Systems**

### 1. **Parasite Meter**

* Fills as player uses high-power or rare cards.
* When full, triggers a Parasite Surge (multiple card mutations or enforced sacrifice).
* Visible to the player at all times.

### 2. **Sacrifice Slots**

* Before a fight, player can pre-mark 1–2 cards as willing sacrifices.
* These are prioritized for mutation or destruction.

### 3. **Parasite Boons**

* Parasite occasionally offers powerful effects:

  * Restore a dead card (comes back mutated)
  * Draw ultra-rare card
  * Heal a % of HP
  * Boost a card’s stats
* Always at a cost (e.g., max HP loss, hand discard, card lock).
* Player must choose: **Accept the Offer?**

### 4. **Card Lifecycle**

1. **Gain**: Card is added post-battle or via boon.
2. **Use**: Card may degrade over time (based on use count).
3. **Mutate**: Parasite modifies effects/cost randomly or conditionally.
4. **Sacrifice**: Card is destroyed, often by player choice.
5. **Restore**: Through safe zones, favor tokens, or parasite boons.

### 5. **Card Restoration Mechanics**

* **Post-Battle Salvage**: Select 1 card from a small pool.
* **Echo Chambers**: Restore, duplicate, or shadow-replace a card.
* **Favor Tokens**: Earned by feeding the parasite weaker cards. Spend to revive.

---

## **Enemy Design (Basic)**

* Enemies have:

  * HP, Damage, Intents (telegraphed)
  * Unique triggers (e.g., enrages if not attacked for 2 turns)
* Battle difficulty scales over time.

---

## **Game Modes**

* **Endless Loop**: Beat your own high score.
* **Runs tracked by:**

  * Turns survived
  * Cards sacrificed
  * Boons accepted
  * Highest enemy tier defeated

---

## **Development Plan (Prototype Focus)**

### **Phase 1: Core Mechanics Implementation**

* [ ] Basic card system (draw, hand, discard, play)
* [ ] Enemy AI with telegraphed attacks
* [ ] Parasite Meter logic and reactions
* [ ] Card sacrifice and mutation events
* [ ] Parasite Boon system
* [ ] Basic battle flow (turns, damage, win/loss states)

### **Phase 2: Reward & Progression Systems**

* [ ] Post-battle salvage pool
* [ ] Echo Chambers (rest areas)
* [ ] Favor Token economy
* [ ] Card restoration & mutation options
* [ ] Endless loop structure & high score tracking

### **Phase 3: UI/UX & Feel Polish**

* [ ] Visual feedback (parasite whispers, shakes, card burn effects)
* [ ] Animations for card use, mutation, and destruction
* [ ] Parasite Boon decision screen
* [ ] Combat pacing and clarity adjustments

---

## **Tools & Tech (Suggested)**

* Engine: Unity or Godot (2D focus)
* Language: C# (Unity) or GDScript (Godot)
* Data: ScriptableObjects or JSON for cards/events

---

## **Out of Scope (for Prototype)**

* Story, lore, or worldbuilding
* Art/visual polish beyond placeholder UI
* Meta-progression systems

---

Let me know when you're ready to scope out sample cards, enemy types, or prototype UX mockups.
