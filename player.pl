% CPSC 312 Black Jack Basic Strategy Recommender

% Values of the cards
value(ace, 11).
value(king, 10).
value(queen, 10).
value(jack, 10).
value(ten, 10).
value(nine, 9).
value(eight, 8).
value(seven, 7).
value(six, 6).
value(five, 5).
value(four, 4).
value(three, 3).
value(two, 2).

% Available actions a player can take
action(hit).
action(stand).
action(double).
action(split).

% -----------------  Pairs splitting strategy  -----------------

% Facts for a pair of twos
pairs_splitting(two, two, DC, A) :- dealer_greater_than_value(DC, 7), A = hit.
pairs_splitting(two, two, DC, A) :- dealer_less_than_value(DC, 8), A = split.

% Facts for a pair of threes
pairs_splitting(three, three, DC, A) :- dealer_greater_than_value(DC, 7), A = hit.
pairs_splitting(three, three, DC, A) :- dealer_less_than_value(DC, 8), A = split.

% Facts for a pair of fours
pairs_splitting(four, four, DC, A) :- dealer_less_than_value(DC, 5), A = hit.
pairs_splitting(four, four, DC, A) :- dealer_between_value(DC, 4, 7), A = split.
pairs_splitting(four, four, DC, A) :- dealer_greater_than_value(DC, 6), A = hit.

% Facts for a pair of fivess
pairs_splitting(five, five, _, A) :- A = double.

% Facts for a pair of sixs
pairs_splitting(six, six, DC, A) :- dealer_greater_than_value(DC, 6), A = hit.
pairs_splitting(six, six, DC, A) :- dealer_less_than_value(DC, 7), A = split.

% Facts for a pair of sevens
pairs_splitting(seven, seven, DC, A) :- dealer_greater_than_value(DC, 7), A = hit.
pairs_splitting(seven, seven, DC, A) :- dealer_less_than_value(DC, 8), A = split.

% Facts for a pair of eights
pairs_splitting(eight, eight, _, A) :- A = split.

% Facts for a pair of nines
pairs_splitting(nine, nine, DC, A) :- dealer_less_than_value(DC, 7), A = split.
pairs_splitting(nine, nine, DC, A) :- dealer_between_value(DC, 6, 8), A = stand.
pairs_splitting(nine, nine, DC, A) :- dealer_between_value(DC, 7, 10), A = split.
pairs_splitting(nine, nine, DC, A) :- dealer_greater_than_value(DC, 9), A = stand.

% Facts for a pair of tens and faces
pairs_splitting(ten, ten, _, A) :- A = stand.
pairs_splitting(jack, jack, _, A) :- A = stand.
pairs_splitting(queen, queen, _, A) :- A = stand.
pairs_splitting(king, king, _, A) :- A = stand.

% Facts for a pair of aces
pairs_splitting(ace, ace, _, A) :- A = split.

% -----------------  Soft totals strategy  -----------------

% ace, two soft totals
soft_totals(ace, two, DC, A) :- dealer_less_than_value(DC, 5), A = hit.
soft_totals(ace, two, DC, A) :- dealer_between_value(DC, 4, 7), A = double.
soft_totals(ace, two, DC, A) :- dealer_greater_than_value(DC, 6), A = hit.
soft_totals(two, ace, DC, A) :- soft_totals(ace, two, DC, A).

% ace, three soft totals
soft_totals(ace, three, DC, A) :- dealer_less_than_value(DC, 5), A = hit.
soft_totals(ace, three, DC, A) :- dealer_between_value(DC, 4, 7), A = double.
soft_totals(ace, three, DC, A) :- dealer_greater_than_value(DC, 6), A = hit.
soft_totals(three, ace, DC, A) :- soft_totals(ace, three, DC, A).

% ace, four soft totals
soft_totals(ace, four, DC, A) :- dealer_less_than_value(DC, 4), A = hit.
soft_totals(ace, four, DC, A) :- dealer_between_value(DC, 3, 7), A = double.
soft_totals(ace, four, DC, A) :- dealer_greater_than_value(DC, 6), A = hit.
soft_totals(four, ace, DC, A) :- soft_totals(ace, four, DC, A).

% ace, five soft totals
soft_totals(ace, five, DC, A) :- dealer_less_than_value(DC, 4), A = hit.
soft_totals(ace, five, DC, A) :- dealer_between_value(DC, 3, 7), A = double.
soft_totals(ace, five, DC, A) :- dealer_greater_than_value(DC, 6), A = hit.
soft_totals(five, ace, DC, A) :- soft_totals(ace, five, DC, A).

% ace, six soft totals
soft_totals(ace, six, DC, A) :- dealer_less_than_value(DC, 3), A = hit.
soft_totals(ace, six, DC, A) :- dealer_between_value(DC, 2, 7), A = double.
soft_totals(ace, six, DC, A) :- dealer_greater_than_value(DC, 6), A = hit.
soft_totals(six, ace, DC, A) :- soft_totals(ace, six, DC, A).

% ace, seven soft totals
soft_totals(ace, seven, DC, A) :- dealer_less_than_value(DC, 3), A = stand.
soft_totals(ace, seven, DC, A) :- dealer_between_value(DC, 2, 7), A = double.
soft_totals(ace, seven, DC, A) :- dealer_between_value(DC, 6, 9), A = stand.
soft_totals(ace, seven, DC, A) :- dealer_between_value(DC, 8, 11), A = hit.
soft_totals(ace, seven, DC, A) :- dealer_greater_than_value(DC, 10), A = stand.
soft_totals(seven, ace, DC, A) :- soft_totals(ace, seven, DC, A).

% ace, eight soft totals
soft_totals(ace, eight, _, A) :- A = stand.
soft_totals(eight, ace, DC, A) :- soft_totals(ace, eight, DC, A).

% ace, nine soft totals
soft_totals(ace, nine, _, A) :- A = stand.
soft_totals(nine, ace, DC, A) :- soft_totals(ace, nine, DC, A).

% ace, 10 and face cards soft totals
soft_totals(ace, ten, _, A) :- A = stand.
soft_totals(ace, jack, _, A) :- A = stand.
soft_totals(ace, queen, _, A) :- A = stand.
soft_totals(ace, king, _, A) :- A = stand.
soft_totals(ten, ace, DC, A) :- soft_totals(ace, ten, DC, A).
soft_totals(jack, ace, DC, A) :- soft_totals(ace, jack, DC, A).
soft_totals(queen, ace, DC, A) :- soft_totals(ace, queen, DC, A).
soft_totals(king, ace, DC, A) :- soft_totals(ace, king, DC, A).

% -----------------  Hard totals strategy  -----------------

% hand total is within five-eight
hard_totals(C1, C2, _, A) :- player_less_than_value(C1, C2, 9), A = hit.

% hand total is nine
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 9), dealer_less_than_value(DC, 3), A = hit.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 9), dealer_between_value(DC, 2, 7), A = double.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 9), dealer_greater_than_value(DC, 6), A = hit.

% hand total is ten
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 10), dealer_less_than_value(DC, 10), A = double.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 10), dealer_greater_than_value(DC, 9), A = hit.

% hand total is 11
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 11), dealer_less_than_value(DC, 11), A = double.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 11), dealer_greater_than_value(DC, 10), A = hit.

% hand total is 12
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 12), dealer_less_than_value(DC, 4), A = hit.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 12), dealer_between_value(DC, 3, 7), A = stand.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 12), dealer_greater_than_value(DC, 6), A = hit.

% hand total is 13
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 13), dealer_less_than_value(DC, 7), A = stand.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 13), dealer_greater_than_value(DC, 6), A = hit.

% hand total is 14
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 14), dealer_less_than_value(DC, 7), A = stand.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 14), dealer_greater_than_value(DC, 6), A = hit.

% hand total is 15
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 15), dealer_less_than_value(DC, 7), A = stand.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 15), dealer_greater_than_value(DC, 6), A = hit.

% hand total is 16
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 16), dealer_less_than_value(DC, 7), A = stand.
hard_totals(C1, C2, DC, A) :- player_hand_sum(C1, C2, 16), dealer_greater_than_value(DC, 6), A = hit.

% hand total is 17,18,19,20
hard_totals(C1, C2, _, A) :- player_hand_sum(C1, C2, 17), A = stand.
hard_totals(C1, C2, _, A) :- player_hand_sum(C1, C2, 18), A = stand.
hard_totals(C1, C2, _, A) :- player_hand_sum(C1, C2, 19), A = stand.
hard_totals(C1, C2, _, A) :- player_hand_sum(C1, C2, 20), A = stand.

% -----------------  Utils  -----------------

dealer_greater_than_value(DC, Value) :- value(DC, DValue), DValue > Value.
dealer_less_than_value(DC, Value) :- value(DC, DValue), DValue < Value.
dealer_between_value(DC, Left, Right) :- dealer_greater_than_value(DC, Left), dealer_less_than_value(DC, Right).

player_less_than_value(C1, C2, Value) :- value(C1, C1Value), value(C2, C2Value), C1Value + C2Value < Value.
player_hand_sum(C1, C2, Value) :- value(C1, C1Value), value(C2, C2Value), Result is C1Value + C2Value, Result =:= Value.

% -----------------  Basic strategy logic  -----------------
incr(X, X1) :-
    number(X), number(X1), !,
    X1 is X+1.

:- dynamic card_count/1.
card_count(0).

basic_strategy(C1, C1, DC, A) :- pairs_splitting(C1, C1, DC, A).
basic_strategy(ace, C1, DC, A) :- soft_totals(ace, C1, DC, A).
basic_strategy(C1, ace, DC, A) :- soft_totals(ace, C1, DC, A).
basic_strategy(C1, C2, DC, A) :- C1 \= ace, C2 \= ace, C1 \= C2, hard_totals(C1, C2, DC, A), retract(card_count(C)), incr(C, CN), assertz(card_count(CN)).

hand([], 0).
hand([Card|Rest], Value) :-
    value(Card, CardValue),
    hand(Rest, RestValue),
    Value is CardValue + RestValue.

hand_total(C1, C2, _, A) :-
    hand([C1, C2], _),
    A = hit.

% TODO initialize a dynamic predicate that keeps track of all 13 played cards within a deck

% TODO STRETCH incorporate dynamic predicate to count cards and add influence into the basic strategy play