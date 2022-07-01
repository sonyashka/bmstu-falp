/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_07
 FileName: LAB_07.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab_07.inc"

domains
	
  integerList = integer*.

predicates

  lengthIter(integerList, integer, integer).
  length(integerList, integer).
  
  listSumIter(integerList, integer, integer).
  listSum(integerList, integer).
  
  listSumOddPoseIter(integerList, integer, integer).
  listSumOddPose(integerList, integer).

clauses

  lengthIter([], Len, Cnt) :- Len = Cnt, !.
  lengthIter([_|T], Len, Cnt) :- NewCnt = Cnt + 1, lengthIter(T, Len, NewCnt).
  length(List, Len) :- lengthIter(List, Len, 0).
  
  listSumIter([], Sum, IterSum) :- Sum = IterSum, !.
  listSumIter([H|T], Sum, IterSum) :- NewIterSum = IterSum + H, listSumIter(T, Sum, NewIterSum).
  listSum(List, Sum) :- listSumIter(List, Sum, 0).
  
  listSumOddPoseIter([], Sum, IterSum) :- Sum = IterSum, !.
  listSumOddPoseIter([_, H|T], Sum, IterSum) :- !, NewIterSum = IterSum + H,
  	listSumOddPoseIter(T, Sum, NewIterSum).
  listSumOddPoseIter([_|T], Sum, IterSum) :- listSumOddPoseIter(T, Sum, IterSum).
  listSumOddPose(List, Sum) :- listSumOddPoseIter(List, Sum, 0).

goal

  %length([7, 1, 4, 8], Len).
  %listSum([9, 1, 8, 5], Sum).
  listSumOddPose([9, 1, 8, 5], Sum).
