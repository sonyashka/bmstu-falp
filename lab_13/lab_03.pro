/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_03
 FileName: LAB_03.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab_03.inc"

domains    

  surname, phone, city, street = symbol.    
  homeNumber, appartmentNumber = unsigned.
  address = address(city, street, homeNumber, appartmentNumber). 
       
  model, color = symbol.   
  price = unsigned.      
  
  bank, account = symbol.   
  sum = unsigned.    
  
  type = symbol.   
  size = unsigned.      
  
  ownership = building(address, price); 
  		area(size, price); 
  		waterTrasnport(type, color, price); 
  		car(model, color, price).  

predicates    

  hasPhone(surname, phone, address).   
  hasDeposit(surname, bank, account, sum).      
  
  own(surname, ownership).   
  ownObject(surname, symbol, price).
  ownObjectPass(surname, symbol, price).  
  objectsPrice(surname, price).
  
clauses    
  hasPhone("Balashov", "+79741632985", address("Moscow", "Baumanskaya", 15, 21)).   
  hasPhone("Serov", "+79146941728", address("Lipetsk", "Gagarina", 192, 13)).   
  hasPhone("Paraskun", "+79172641928", address("Moscow", "Izmaylovskaya", 73, 2)).    
  hasDeposit("Balashov", "Home-credit", "5148465849516259", 24318947).   
  hasDeposit("Balashov", "VTB", "5670148746192648", 478976).   
  hasDeposit("Paraskun", "Sberbank", "7193019871942510", 100000).
  
  own("Balashov", area(20, 139200)).   
  own("Balashov", car("BMW-Y15", "Red", 2345700)).   
  own("Paraskun", building(address("Moscow", "Lubyanka", 13, 182), 1410000)).   
  own("Paraskun", waterTrasnport("Bike", "White", 80000)).
  
  ownObject(Surname, building, Price) :- own(Surname, building(_, Price)).
  ownObject(Surname, area, Price) :- own(Surname, area(_, Price)).
  ownObject(Surname, waterTrasnport, Price) :- own(Surname, waterTrasnport(_, _, Price)).
  ownObject(Surname, car, Price) :- own(Surname, car(_, _, Price)).
  
  ownObjectPass(Surname, building, Price) :- own(Surname, building(_, Price)), !.
  ownObjectPass(Surname, area, Price) :- own(Surname, area(_, Price)), !.
  ownObjectPass(Surname, waterTrasnport, Price) :- own(Surname, waterTrasnport(_, _, Price)), !.
  ownObjectPass(Surname, car, Price) :- own(Surname, car(_, _, Price)), !.
  ownObjectPass(_, _, 0).
  
  objectsPrice(Surname, Price) :- ownObjectPass(Surname, building, BPrice),
  				  ownObjectPass(Surname, area, APrice),
  				  ownObjectPass(Surname, waterTransport, WtPrice),
  				  ownObjectPass(Surname, car, CPrice),
  				  Price = BPrice + APrice + WtPrice + CPrice.
  
goal
  %ownObject("Balashov", Objects, _).
  %ownObject("Paraskun", Objects, Price).
  objectsPrice("Paraskun", Price).