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

hand([], 0).
hand([Card|Rest], Value) :-
    value(Card, CardValue),
    hand(Rest, RestValue),
    Value is CardValue + RestValue.

basic_strategy(C1, C2, DC, A) :-
    hand([C1, C2], Value),
    value(DC, DValue),
    DValue >= 7,
    A = hit.

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
pairs_splitting(eight, eight, DC, A) :-
    A = stand.



% Facts for a pair of ace's
pairs_splitting(eight, eight, DC, A) :-
    A = split.

% TODO initialize a dynamic predicate that keeps track of all 13 played cards within a deck

% TODO build a cli program that takes input of a players cards and replies the basic strategy

% TODO STRETCH incorporate dynamic predicate to count cards and add influence into the basic strategy play