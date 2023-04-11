# Blackjack-Player

Course:CPSC312-2023-Blackjack-Player

Authors: Boris Vasilchikov, Tristan Martinuson

## What is the problem?
Blackjack is a fun game to play as its open to all skill levels, and its rules are simple. We will implement a blackjack player to (hopefully) beat the dealer at his game. The program will answer queries relating to the current state of the game ("Dealer card is Ace, and our hand is a pair of fours", should I hit, stand, etc..).

## What is the something extra?
You know what's harder than keeping a set of rules memorized at all times? Trying to keep a running count in your head during a fast paced game of Blackjack. We plan on adding a card counting feature that keeps track of a running count of dealt cards to recommend a player's next course of action. This will follow the ruleset for keeping track of cards as they are played and will affect the recommendation given by the standard ruleset.

## What did we learn from doing this?

This task was actually found to be perfect for functional programming. Since Prolog can act like a database, we were able to transform the basic strategy table for each player and dealer hand into facts that can be queried for the player's resulting action. Prolog was also suitable for keeping track of state such as the running count for card counters in which a dynamic predicate kept track of which cards appeared during each play and added count according to the rules of HiLo. Prolog made the abstraction of logic much simpler as well as made it easier for our group to reduce redundant facts.

## To Run
* Have SWI-Prolog installed and running
* Consult player.pl in SWI-Prolog
* Execute _play_ with parameters (_playercard_, _playercard_, _dealercard_)
* Example: 
```
?- play(three, three, four).
Basic strategy says: split
Current running card count: 3
Likely to get a 10,J,Q,K,A card on next hit
Very unlikely to get a 2-6 card on next hit
true.
```
* Decide your next play based on the information provided to you
