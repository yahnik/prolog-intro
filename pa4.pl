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
    Bottles = [B1,B2,B3,B4,B5,B6,B7],
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


%% end Task 3 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




