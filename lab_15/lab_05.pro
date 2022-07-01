/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_05
 FileName: LAB_05.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab_05.inc"

domains

  num = integer.

predicates

  maxOfTwo(num, num, num).
  maxOfTwoCut(num, num, num).
  maxOfThree(num, num, num, num).
  maxOfThreeCut(num, num, num, num).

clauses

  maxOfTwo(Num1, Num2, Num1) :- Num1 >= Num2.
  maxOfTwo(Num1, Num2, Num2) :- Num2 >= Num1.
  
  maxOfThree(Num1, Num2, Num3, Num1) :- Num1 >= Num2, Num1 >= Num3.
  maxOfThree(Num1, Num2, Num3, Num2) :- Num2 >= Num1, Num2 >= Num3.
  maxOfThree(Num1, Num2, Num3, Num3) :- Num3 >= Num1, Num3 >= Num2.
  
  maxOfTwoCut(Num1, Num2, Num1) :- Num1 >= Num2, !.
  maxOfTwoCut(_, Num2, Num2).
  
  maxOfThreeCut(Num1, Num2, Num3, Num1) :- Num1 >= Num2, Num1 >= Num3, !.
  maxOfThreeCut(_, Num2, Num3, Num2) :- Num2 >= Num3, !.
  maxOfThreeCut(_, _, Num3, Num3).

goal

  %maxOfTwo(1, 2, Max).
  %maxOfTwo(2, 1, Max).
  %maxOfTwo(2, 2, Max).
  %maxOfTwoCut(1, 2, Max).
  %maxOfTwoCut(2, 1, Max).
  %maxOfTwoCut(2, 2, Max).
  %maxOfThree(1, 2, 3, Max).
  %maxOfThree(1, 3, 2, Max).
  %maxOfThree(3, 2, 1, Max).
  %maxOfThree(3, 2, 3, Max).
  %maxOfThreeCut(1, 2, 3, Max).
  %maxOfThreeCut(1, 3, 2, Max).
  %maxOfThreeCut(3, 2, 1, Max).
  maxOfThreeCut(3, 2, 3, Max).
