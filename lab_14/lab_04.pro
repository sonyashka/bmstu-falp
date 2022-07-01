/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_04
 FileName: LAB_04.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab_04.inc"

domains
  
  name, gender = symbol.
  human = human(name, gender).

predicates

  isParent(human, human).
  isGrandparent(human, gender, human).

clauses

  isGrandparent(human(GrandName, GrandGender), LineGender, human(Name, Gender)) :- 
  	isParent(human(GrandName, GrandGender), human(TmpName, LineGender)), 
  	isParent(human(TmpName, LineGender), human(Name, Gender)).

  isParent(human("Irina", woman), human("Olga", woman)).
  isParent(human("Igor", man), human("Olga", woman)).
  isParent(human("Victor", man), human("Irina", woman)).
  isParent(human("Svetlana", woman), human("Irina", woman)).
  isParent(human("Fedor", man), human("Igor", man)).
  isParent(human("Uliya", woman), human("Igor", man)).

goal
  %isGrandparent(human(Name, woman), _, human("Olga", woman)).
  %isGrandparent(human(Name, man), _, human("Olga", woman)).
  %isGrandparent(Human, _, human("Olga", woman)).
  %isGrandparent(human(Name, woman), woman, human("Olga", woman)).
  isGrandparent(Human, woman, human("Olga", woman)).
