~~ readme.txt ~~ January 25, 2013 by Shino Takayama, First-Revised
on May 8, 2013

This file explains all the Matlab codes stored in this folder.
Also, it explains how to produce figures in the main body of the
paper.

**Codes**

1. mainprog.m: This program solves the equilibrium.

2. plotfig.m: This program produces pictures from the result
(**.mat).

3. savere.m: This program saves the simulation results.

4. jactry.m: This program is used to check the bug whenever any
issue arises.

**Functions**

1. nextvalue.m: nextvalue(x, int, b, m, f) computes the value of a
function = m(int)*(x-b(int))+f(int)

2. ask.m: ask(b, u, r, hb, ls) computes ask price via Bayes' rule.

3. bid.m: bid(b, u, r, hb, ls) computes bid price via Bayes' rule.

4. fd.m: fd(x0, x1, b, f) finds the interval [b(j), b(j+1)) to
which the value f belongs to. The first j starts at x0 and
continues up to x1.

5. profits.m: [LB, LS, HB, HS] = profits(bi, as, b, I, N, vl, vh)
returns profit for each strategy to both types given price and
value functions.

6. incentive.m: incentive(u, r, I, N, b, mL, VL, mH, VH) returns
[Regime, bi, as]. Regime = 1 if the honest strategy is incentive
compatible and otherwise Regime = 0. bi is a bid price and as is an
ask price if Regime = 1 and both take on 0 otherwise. It needs the
following files: highbuy.m, highsell.m, lowbuy.m, and lowsell.m.

7-10. highbuy.m & highsell.m & lowbuy.m & lowsell.m: These compute
profit for each strategy.

11. checkH.m: [Regime, bid, ask, stHB] = checkH(u, r, L, I, b, N,
mL, VL, mH, VH) Regime = 1 if type H manipulates and otherwise
Regime = 0. bi is a bid price and as is an ask price if Regime = 1
and both take on 0 otherwise. stHB returns the strategy that type H
would take. It needs the following files: calaskH.m, calbidH.m, and
(fd.m, lowbuy.m, lowsell.m).

12. checkL.m: [Regime, bid, ask, stLS] = checkL(u, r, H, I, b, N,
mL, VL, mH, VH) Regime = 1 if type L manipulates and otherwise
Regime = 0. bi is a bid price and as is an ask price if Regime = 1
and both take on 0 otherwise. stLS returns the strategy that type L
would take. It needs the following files: calaskL.m, calbidL.m, and
(fd.m, highbuy.m, highsell.m).

13. calaskH.m: calaskH(I, L, N, b, mH, VH) finds ask price which
satisfies the indifference condition for type H. It needs
sol2real.m

14. calbidH.m: From calaskH.m this computes bid price.

15. calaskL.m: calaskL(I, L, N, b, mH, VH) finds ask price which
satisfies the indifference condition for type L. It needs
sol2real.m

16. calbidL.m: From calaskL.m this computes bid price.

17. sol2real.m: [xP, xM] = sol2real(a, b, c). sol2real.m returns
two solutions xP and xM to solve ax^2 + b^x + c = 0. xP is the one
with plus sign for square root for the quadratic solution and xM is
the one with minus sign.

18. diffun.m: [xL, xH, LS, LB, HS, HB] = diffun(u, r, i, b, h, l,
ml, mh, vl, vh) returns profit from each strategy (LS, LB, HS, HB)
and xH and xL are the differences of profits between honest to
manipulative strategies. It needs ask.m, bid.m and fd.m.

19. fixedHL.m: [newh, newl] = fixedHL(u, r, I, b, N, ml, vl, mh,
vh,tol) returns strategies for type H and type L when both types
manipulate. It needs diffun.m, fdminus.m, fdminus2.m, myfunHL.m,
and jacHL.m

20. myfunHL.m: [fH, fL] = myfunHL(u, r, h, l, I, b, N, ml, vl, mh,
vh) computes the values of two approximated indifference
conditions. It needs ask.m, bid.m and fd.m.

21. jacHL.m: jacHL(u, r, h, l, I, b, N, ml, vl, mh, vh) returns
Jacobian matrix for Newton-Raphson method.

22. value1.m: [VLn, VHn] = value1(I, as, bi, b, u, r, N, mL, VL,
mH, VH) returns today's values for type L and type H. It needs
fd.m, nextvalue.m, lowsell.m and highbuy.m.

23. valueL.m: valueL(bd, u, r, va, vb) returns today's value for
type L given bd = bid price.

24. valueH.m: valueH(ak, u, r, va, vb) returns today's value for
type H given ak = ask price.

25. fdminus.m: fdminus(Kmat) returns finds possible x to make
Kmat(k,j)= b(j) with x in [j-1, j) given k. Kmat does not need to
be square.

26. fdminus2.m: fdminus2(Kmat) returns possible x to make
Kmat(k,j)= j, Kmat(k,j-1)= j-1 with x in [j-1, j) given k. Kmat
does not need to be square.

27. newtonHL.m: [oldh, oldl] = newtonHL(u, r, inih, inil, I, b, N,
ml, vl, mh, vh, tol) returns the solution from the Newton-Raphson
method. The maximum iteration is set at tol. oldh is a type-H's
strategy and oldl is a type-L's strategy. This needs myfunHL.m and
jacHL.m.
