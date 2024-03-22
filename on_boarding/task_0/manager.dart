
import 'dart:convert';
import 'helpers.dart';
import 'product.dart';

class ProductManager {
  
    addProduct({required Product product}){
      writeProduct(product);
    }

     viewAllProduct(){
      var product = readProduct();
      return product;
    }

    Edit(String title , Product product){
      var product = readProduct();
      for(var i = 0; i < product.length;i++){
        if(product[i]["name"] == title){
          product[i] = product;
          writeProduct(product);
          return product;
        }
      }


      
    }

    deleteProduct(name){
      var product = readProduct();
      print("--------name ${name}");
    
      product.removeWhere((product) => product["title"] == name);
      writeProduct(product);
    }

}

