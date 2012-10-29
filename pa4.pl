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


primesto(X,L) :-
    L = [],
    N is 1,
    primestohelper(N,X,L).

primestohelper(N,X,L) :-
    N < X,
    prime(N),
    L0 = L,
    L = [L0|N].

primestohelper(N,X,L) :-
    N1 is N + 1,
    primestohelper(N1,X,L).

    






%% end Task 2 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

