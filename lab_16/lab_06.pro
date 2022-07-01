/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_06
 FileName: LAB_06.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab_06.inc"

predicates

  factorialIter(integer, integer, integer).
  factorial(integer, integer).
  fibonIter(integer, integer, integer, integer).
  fibon(integer, integer).

clauses

  factorialIter(N, Res, IterRes) :- N = 0, !, Res = IterRes.
  factorialIter(N, Res, IterRes) :- N > 0, NewN = N - 1, NewIterRes = N * IterRes,
  	factorialIter(NewN, Res, NewIterRes). 
  factorial(N, Res) :- factorialIter(N, Res, 1).
  
  fibonIter(N, Res, FNum, _) :- N = 0, !, Res = FNum.
  fibonIter(N, Res, _, SNum) :- N = 1, !, Res = SNum.
  fibonIter(N, Res, FNum, SNum) :- N > 1, NewN = N - 1, NewFNum = SNum, NewSNUm = FNum + SNum, 
  	fibonIter(NewN, Res, NewFNum, NewSNum).
  fibon(N, Res) :- fibonIter(N, Res, 0, 1).

goal

  factorial(4, Res).
  %fibon(7, Res).
