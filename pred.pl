parent(pam,tom).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).

% predecessor definitions

pred1(X,Z) :- parent(X,Z).
pred1(X,Z) :- parent(X,Y), pred1(Y,Z).

pred2(X,Z) :- parent(X,Y), pred2(Y,Z).
pred2(X,Z) :- parent(X,Z).

pred3(X,Z) :- parent(X,Z).
pred3(X,Z) :- pred3(Y,Z), parent(X,Y).

pred4(X,Z) :- pred4(Y,Z), parent(X,Y).
pred4(X,Z) :- parent(X,Z).

% query is: pred1(pam,X).
% Try it for pred2, pred3, pred4.