import 'dart:typed_data';

import 'helpers.dart';



class Product {
   String name;
   String description;
   String price;

  Product({required this.name, required this.description, required this.price});



  Product.fromJson(Map<String,dynamic> json)
       :name = json['title'],
        description = json['description'],
        price = json['price'];

        
  Map<String,dynamic> toJson() => {
    "title" : name,
    "description": description,
    "price": price
  };
    
  
}














































































































































































































