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

