%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code for Task 1 - prime

divisible(N,M) :-
    M < N,
    N mod M =:= 0.

divisible(N,M) :-
    M < N,
    M1 is M + 1,
    divisible(N,M1).

prime(X) :- 
    Y is 2,
    X > 1, 
    \+divisible(X, Y).

%% end Task 1 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code for Task 2 - List Creation

primesto(X,[X|L]) :-
    X > 0,
    prime(X),
    X1 is X - 1,
    primesto(X1,L).

primesto(X,L) :-
    X > 0,
    \+prime(X),
    X1 is X - 1,
    primesto(X1,L).

primesto(0,[]).


%% end Task 2 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code for Task 3

% 'herm' - find possible bottle arrangements 
herm(Bottles,Smallest,Largest) :-
    Bottles = [B1,B2,_,_,_,B6,B7],
    permutation(Bottles, [poison, poison, poison, wine, wine, ahead, back]),

    % rule 1: wine's left side is always poison            
    wineCheck(Bottles,1),

    % rule 2: the ends are not move ahead and are different
    not(B1 = ahead),       
    not(B7 = ahead),
    not(B1 = B7),
    
    % rule 3: neither Smallest or Larest are poison
    nth1(Smallest,Bottles,S),
    nth1(Largest,Bottles,L),
    not(S = poison),
    not(L = poison),
   
    % rule 4: B2 is the same as B6
    B2 = B6.        


% Base case - once I is 7, we are at the end of the list.
wineCheck(_,7).

% If we have a wine bottle at index I, make sure there is poison in the bottle
% on the left.
wineCheck(Bottles,I) :-
    nth0(I,Bottles,B),
    B = wine,
    ILeft is I-1,
    nth0(ILeft,Bottles,Bleft),
    Bleft = poison,
    I2 is I+1,
    wineCheck(Bottles,I2).

% If there is no win at I, increment I and continue.
wineCheck(Bottles,I) :-
    nth0(I,Bottles,B),
    not(B = wine),
    I2 is I+1,
    wineCheck(Bottles,I2).






% Top level call to pairdiffelements, calls another function with duplicate ELts
% parameters.
pairdiffelements(Elts,Labels) :-
    pairdiffelements(Elts,Elts,Labels).

% assign L1 the first value from elements, then try to match L2 with all 
% elements.
pairdiffelements([E|_Elts],AllElts,[L1,L2|[]]) :-
    L1 = E,
    matchL2(L1,L2,AllElts).

% regardless if the match above was successful, make recursive call with the
% rest of Elts.
pairdiffelements([_E|Elts],AllElts,Labels) :-
    pairdiffelements(Elts,AllElts,Labels).

% Attempt to match all Elts to L2 given the value on L1.
matchL2(L1,L2,[E|_Elts]) :-
    match(L1,L2,E).

% Regardless of whether match above worked, make recursive call to attempt to
% match L2 with rest of elements.
matchL2(L1,L2,[_|Elts]) :-
    matchL2(L1,L2,Elts).
    
% Predicate to match a value to L2 knowing L1's value.
match(L1,L2,E) :-
    not(L1 = E),
    L2 = E.


%% end Task 3 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code for Task 4

% 8->3 until 3 full
pour([X,Y,Z],[X2,Y,Z2],Msg) :- C is 3-X, C>0, C<Z, X2 is 3, Z2 is Z-C,
    Msg = 'Fill 3-quart from 8-quart.'.
% 8->3 until 8 empty
pour([X,Y,Z],[X2,Y,Z2],Msg) :- C is 3-X, C>0, C>=Z, X2 is X+Z, Z2 is 0,
    Msg = 'Empty 8-quart into 3-quart.'.
% 5->3 until 3 full
pour([X,Y,Z],[X2,Y2,Z],Msg) :- C is 3-X, C>0, C<Y, X2 is 3, Y2 is Y-C,
    Msg = 'Fill 3-quart from 5-quart.'.
% 5->3 until 5 empty
pour([X,Y,Z],[X2,Y2,Z],Msg) :- C is 3-X, C>0, C>=Y, X2 is X+Y, Y2 is 0,
    Msg = 'Empty 5-quart into 3-quart.'.


% 8->5 until 5 full
pour([X,Y,Z],[X,Y2,Z2],Msg) :- C is 5-Y, C>0, C<Z, Y2 is 5, Z2 is Z-C,
    Msg = 'Fill 5-quart from 8-quart.'.
% 8->5 until 8 empty
pour([X,Y,Z],[X,Y2,Z2],Msg) :- C is 5-Y, C>0, C>=Z, Y2 is Y+Z, Z2 is 0,
    Msg = 'Empty 8-quart into 5-quart.'.
% 3->5 until 5 full
pour([X,Y,Z],[X2,Y2,Z],Msg) :- C is 5-Y, C>0, C<X, Y2 is 5, X2 is X-C,
    Msg = 'Fill 5-quart from 3-quart.'.
% 3->5 until 3 empty
pour([X,Y,Z],[X2,Y2,Z],Msg) :- C is 5-Y, C>0, C>=X, Y2 is Y+X, X2 is 0,
    Msg = 'Empty 3-quart into 5-quart.'.


% 3->8 until 8 full
pour([X,Y,Z],[X2,Y,Z2],Msg) :- C is 8-Z, C>0, C<X, Z2 is 8, X2 is X-C,
    Msg = 'Fill 8-quart from 3-quart.'.
% 3->8 until 3 empty
pour([X,Y,Z],[X2,Y,Z2],Msg) :- C is 8-Z, C>0, C>=X, Z2 is Z+X, X2 is 0,
    Msg = 'Empty 3-quart into 8-quart.'.
% 5->8 until 8 full
pour([X,Y,Z],[X,Y2,Z2],Msg) :- C is 8-Z, C>0, C<Y, Z2 is 8, Y2 is Y-C,
    Msg = 'Fill 8-quart from 5-quart.'.
% 5->8 until 8 empty
pour([X,Y,Z],[X,Y2,Z2],Msg) :- C is 8-Z, C>0, C>=Y, Z2 is Z+Y, Y2 is 0,
    Msg = 'Empty 5-quart into 8-quart.'.


waterjug(Start,Goal) :-
    waterjug(Start,Goal,[Start|[]],[]).

% If we have a solution, print out the moves that were made to 
% acheive it.
waterjug(Start,Goal,_Path,Moves) :-
    Start = Goal,
    write('\nSolution is:\n'),
    reverse(Moves,RevMoves),
    printmoves(RevMoves).

% If we haven't achieved our goal, try a pour operation and if
% the new state isn't in our path, continue on the search path.
waterjug(Start,Goal,Path,Moves) :-
    not(Start = goal),
    pour(Start,Next,Msg),
    not(member(Next,Path)),
    waterjug(Next,Goal,[Next|Path],[Msg|Moves]).


% Used to print out the list of moves once a solution is found.
printmoves([]).

printmoves([M|Moves]) :-
    write(M),
    nl,
    printmoves(Moves).


%% end Task 4 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




