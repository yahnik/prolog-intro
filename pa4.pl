%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code for Task 1 - prime

divisible(N,M) :-
    X is M*M,
    X =< N,
    N mod M =:= 0.

divisible(N,M) :-
    M < N,
    M1 is M + 1,
    divisible(N,M1).

prime(X) :- 
    Y is 2,
    X > 1, 
    \+divisible(X, Y).

% end Task 1 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





