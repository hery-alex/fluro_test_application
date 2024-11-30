# Checkout Application as a test for Fluro

# Requirements: 

Implement the code for a supermarket checkout that calculates the total price of several items.

 Design and implement a UI for the project too, demonstrating your creativity while also showcasing your skills in state management and architecture. In a normal supermarket, items are identified by ‘stock keeping units’ or ‘SKUs’.
 
  In our store, we will use individual letters of the alphabet, A, B, C etc, as the SKUs. Our goods are priced individually. 
  In addition, some items have promotions of any of the following types: 
    •  Multipriced: buy n of them and which will cost you y. For example, item A might cost 50 pence individually but this week we have a special offer where you can buy 3 As for £1.30. 
    •  Buy n get 1 free 
    •  Meal deal: buy different items together and get a special price. For instance, items D and E might cost 150 and 200 pence each individually but this week we have a special offer where you can buy one of each for just £3.


    This week’s prices are the following: 
    Item   Unit Price (in pence)    Special Price
     A      50   
     B      75                       2 for £1.25 
     C      25                       Buy 3, get one free 
     D      150                      Buy D and E for £3 
     E      200                      Buy D and E for £3

# Project Presented:

- Created a json with all the products (jsonDataProducts.json) which sits in assets. (Reason for creating this is to demonstrate capabilities of getting data from an API call) -> which is done in Repository->json_repository.dart
- Used PageRouteBuilder for routes around the app (Routes-> routes_configuration.dart)
- As a state management I opted for a simple yet very efficient way by combining the power of streams with RxDart and dependOnInheritedWidgetOfExactType from flutter SDK inheritedwidget.It can be used in the UI by calling StreamBuilder or we can listen to the streams in various files.

 ## Landing Page: 
 
 ![dashboard](readmeImages/dashboard.png)  -list of all products (productImage,productTitle,productPrice and capability of adding to cart) 
 

 ![dashboard cart](readmeImages/dashboard_cart.png) -top left we have cart that is being updated real time and with number of products

 ![dashboard filters](readmeImages/dashboard_filters.png) - top right button will open the filters from right 
                                                         