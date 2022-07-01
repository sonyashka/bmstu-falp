/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_08
 FileName: LAB_08.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab_08.inc"

domains

  integerList = integer*.

predicates

  biggerList(integerList, integer, integerList).
  oddList(integerList, integerList).
  delElemFullInclude(integerList, integer, integerList).
  makeSet(integerList, integerList).

clauses

  biggerList([], _, []).
  biggerList([H|T], Num, [H|ResT]) :- H > Num, !, biggerList(T, Num, ResT).
  biggerList([_|T], Num, Res) :- biggerList(T, Num, Res).
  
  oddList([], []).
  oddList([_, H|T], [H|ResT]) :- !, oddList(T, ResT).
  oddList([_|T], ResT) :- oddList(T, ResT).
  
  delElemFullInclude([], _, []).
  delElemFullInclude([H|T], Elem, [H|ResT]) :- H <> Elem, !, delElemFullInclude(T, Elem, ResT).
  delElemFullInclude([_|T], Elem, Res) :- delElemFullInclude(T, Elem, Res).
  
  makeSet([], []).
  makeSet([H|T], [H|ResT]) :- delElemFullInclude(T, H, Res), makeSet(Res, ResT).

goal

  %biggerList([1, 7, 0, 4], 3, List).
  %oddList([1, 7, 0, 4], List).
  %delElemFullInclude([1, 6, 1, 0, 1], 1, List).
  makeSet([1, 5, 9, 1, 0, 5, 1], Set).
