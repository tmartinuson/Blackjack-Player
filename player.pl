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

% Actions needed
action(hit).
action(stand).
action(double).
action(split).

hand([], 0).
hand([Card|Rest], Value) :-
    value(Card, CardValue),
    hand(Rest, RestValue),
    Value is CardValue + RestValue.

% TODO initialize a dynamic predicate that keeps track of all 13 played cards within a deck

% TODO build a cli program that takes input of a players cards and replies the basic strategy

% TODO STRETCH incorporate dynamic predicate to count cards and add influence into the basic strategy play