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

% encoded versions of the 4 rules given in the riddle




% 'herm' - find possible bottle arrangements 
herm(Bottles,Smallest,Largest) :-
    Bottles = [B1,B2,B3,B4,B5,B6,B7],
    permutation(Bottles, [poison, poison, poison, wine, wine, ahead, back]),

    % rule 1: wine's left side is always poison            

    % rule 2: the ends are not move ahead and are different
    B1 \== ahead,       
    B7 \== ahead,
    B1 \== B7,

    % rule 3: neither Smallest or Larest are poison
    nth1(Smallest,Bottles,S),
    nth1(Largest,Bottles,L),
    S \== poison,
    L \== poison,
    %write('%%%%'),
    wineCheck(Bottles,1),
    %write('****'), 
    B2 == B6.        % rule 4: B2 is the same as B6




wineCheck(Bottles,I) :-
    
    %write('I: '),
    %write(I),
    length(Bottles,L),
    I < L,
    nth0(I,Bottles,B),
    B == wine,
    %write('4'),
    ILeft is I-1,
    nth0(ILeft,Bottles,Bleft),
    Bleft == poison,
    %write('5'),
    I2 is I+1,
    wineCheck(Bottles,I2).

wineCheck(Bottles,I) :-
    %write('2'),
    length(Bottles,L),
    I < L,
    nth0(I,Bottles,B),
    B \== wine,
    I2 is I+1,
    wineCheck(Bottles,I2).

wineCheck(Bottles,I) :-
    %write('3'),
    length(Bottles,L),
    I =:= L.


%% end Task 3 code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




