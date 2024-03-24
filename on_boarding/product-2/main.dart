import 'dart:io';

import 'helpers.dart';
import 'product_manager.dart';

void main(){
var Manger = ProductManager();

while (true){
  print("===============================================================================================");
  print("\u{1D11E} well come to Product manager ${String.fromCharCode(0x1F4D6)}");
  print("===============================================================================================");
  printChoice();

  
  var choice = readUserInput();


    if (choice == "1"){
      var productFields = readAddProductInput();
      helpAddProduct(productFields);
    }

    else if (choice == "2") {
      var allProducts = Manger.viewAllProduct();
      print(allProducts);
    }
   

    else if (choice == "5") {
        var title = readUserInput();
        var ProductFields = readAddProductInput();
        var product = helpEditProduct(ProductFields);
        Manger.Edit(title, product);
       
    }

    else if (choice == "6") {
      print("enter the name of the product you want to delete:");
      var name = readUserInput();
      Manger.deleteProduct(name);
      
    }

    else if (choice == "q") {
      break;
    }

    else {
      print("invalid input");
    }
  }
}

  