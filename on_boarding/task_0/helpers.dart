import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'manager.dart';
import 'product.dart';



var Manger = ProductManager();

final file = File("./product.json");

readProduct(){
  final contents = file.readAsStringSync();
   var product = jsonDecode(contents);
   return product;

}


writeProduct(content){
  final newContent = jsonEncode(content);
  file.writeAsStringSync(newContent);
}

readUserInput(){
  final value = stdin.readLineSync();
  return value;
}

printChoice(){
  print("===============================================================================================");
  print("enter 1- add product");
  print("enter 2- view all products");
  print("enter 5- edit product");
  print("enter 6- delete product");
  print("enter q to quit");
  print("===============================================================================================");
}
  
 readAddProductInput(){
    Map<String,String> productFields =  {};
      print("enter name: ");
      var title = readUserInput();
      productFields["name"] = title;

      print("enter description: ");
      var desc = readUserInput();
      productFields["description"] = desc;

      print("enter price");
      var price = readUserInput();;
      productFields["price"] = price;     
       
      print(productFields);
      return productFields; 
    
}

printAll(List allProducts){
    if (allProducts != []){
        allProducts.forEach((Product){
        print("\n \n \n");
        print("===========================================================");
          print("title => ${Product["name"]}");
          print("-----------------------------------------");
          print("description => ${Product["description"]}");
          print("-----------------------------------------");
          print("price => ${Product["price"]}");
          print("-----------------------------------------");
        print("============================================================");
        print("\n \n \n");
        });

      }
}

helpAddProduct(productFields){
  
      var newProduct = Product(name: productFields["name"], description: productFields["description"], price: productFields["price"] );
      print(newProduct);
      Manger.addProduct(product: newProduct);
}

helpEditProduct(productFields){
      var newTask = Product(name: productFields["name"], description: productFields["description"], price: productFields["price"] );
      return newTask;
}

