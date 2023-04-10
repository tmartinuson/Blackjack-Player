% TODO transfer out the basic rule logic to logic statements

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
% Facts for a pair of two's
pairs_splitting(two, two, DC, A) :-
    value(DC, DValue),
    DValue >= 8,
    A = hit.

pairs_splitting(two, two, DC, A) :-
    value(DC, DValue),
    DValue < 8,
    A = split.



% Facts for a pair of three's
pairs_splitting(three, three, DC, A) :-
    value(DC, DValue),
    DValue >= 8,
    A = hit.

pairs_splitting(three, three, DC, A) :-
    value(DC, DValue),
    DValue < 8,
    A = split.



% Facts for a pair of four's
pairs_splitting(four, four, DC, A) :-
    value(DC, DValue),
    DValue < 5,
    A = hit.

pairs_splitting(four, four, DC, A) :-
    value(DC, DValue),
    DValue < 7,
    DValue >= 5,
    A = split.

pairs_splitting(four, four, DC, A) :-
    value(DC, DValue),
    DValue >= 7,
    A = hit.



% Facts for a pair of fives's
pairs_splitting(five, five, _, A) :-
    A = double.



% Facts for a pair of six's
pairs_splitting(six, six, DC, A) :-
    value(DC, DValue),
    DValue >= 7,
    A = hit.

pairs_splitting(six, six, DC, A) :-
    value(DC, DValue),
    DValue < 7,
    A = split.



% Facts for a pair of seven's
pairs_splitting(seven, seven, DC, A) :-
    value(DC, DValue),
    DValue >= 8,
    A = hit.

pairs_splitting(seven, seven, DC, A) :-
    value(DC, DValue),
    DValue < 8,
    A = split.



% Facts for a pair of eight's
pairs_splitting(eight, eight, DC, A) :-
    A = split.



% Facts for a pair of nine's
pairs_splitting(nine, nine, DC, A) :-
    value(DC, DValue),
    DValue < 7,
    A = split.

pairs_splitting(nine, nine, DC, A) :-
    value(DC, DValue),
    DValue = 7,
    A = stand.

pairs_splitting(nine, nine, DC, A) :-
    value(DC, DValue),
    DValue >= 8,
    DValue < 10,
    A = split.

pairs_splitting(nine, nine, DC, A) :-
    value(DC, DValue),
    DValue >= 10,
    A = stand.

% Facts for a pair of ten's
pairs_splitting(ten, ten, DC, A) :-
    A = stand.

% Facts for a pair of ace's
pairs_splitting(ace, ace, DC, A) :-
    A = split.

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
soft_totals(ace, eight, DC, A) :- A = stand.
soft_totals(eight, ace, DC, A) :- soft_totals(ace, eight, DC, A).

% ace, nine soft totals
soft_totals(ace, nine, DC, A) :- A = stand.
soft_totals(nine, ace, DC, A) :- soft_totals(ace, nine, DC, A).

% ace, 10 and face cards soft totals
soft_totals(ace, ten, DC, A) :- A = stand.
soft_totals(ace, jack, DC, A) :- A = stand.
soft_totals(ace, queen, DC, A) :- A = stand.
soft_totals(ace, king, DC, A) :- A = stand.
soft_totals(ten, ace, DC, A) :- soft_totals(ace, ten, DC, A).
soft_totals(jack, ace, DC, A) :- soft_totals(ace, jack, DC, A).
soft_totals(queen, ace, DC, A) :- soft_totals(ace, queen, DC, A).
soft_totals(king, ace, DC, A) :- soft_totals(ace, king, DC, A).

% -----------------  Dealer utils  -----------------

dealer_greater_than_value(DC, Value) :- value(DC, DValue), DValue > Value.
dealer_less_than_value(DC, Value) :- value(DC, DValue), DValue < Value.
dealer_between_value(DC, Left, Right) :- dealer_greater_than_value(DC, Left), dealer_less_than_value(DC, Right).

% -----------------  Basic strategy logic  -----------------

basic_strategy(C1, C1, DC, A) :-
    pairs_splitting(C1, C1, DC, A).
basic_strategy(C1, C2, DC, A) :-
    C1 \= C2,
    hand_total(C1, C2, DC, A).

hand([], 0).
hand([Card|Rest], Value) :-
    value(Card, CardValue),
    hand(Rest, RestValue),
    Value is CardValue + RestValue.

hand_total(C1, C2, DC, A) :-
    hand([C1, C2], Value),
    value(DC, DValue),
    DValue >= 7,
    A = hit.

% TODO initialize a dynamic predicate that keeps track of all 13 played cards within a deck

% TODO build a cli program that takes input of a players cards and replies the basic strategy

% TODO STRETCH incorporate dynamic predicate to count cards and add influence into the basic strategy play