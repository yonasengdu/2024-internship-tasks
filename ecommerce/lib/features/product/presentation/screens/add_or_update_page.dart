
import 'package:ecommerce/features/product/presentation/widgets/button_widget.dart';
import 'package:ecommerce/features/product/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AddOrUpdatePage extends StatelessWidget {
  const AddOrUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.chevron_left,color: Colors.blue,size: 35)
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text("Add  Product",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(243, 243, 243, 1)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_outlined,size: 50,),
                            SizedBox(height: 12),
                            Text("upload image",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                      ),
                      TextBoxWidget(title: 'name',),
                      TextBoxWidget(title: 'category',),
                      TextBoxWidget(title: 'price',),
                      TextBoxWidget(title: 'description',height: 140),
                       
                      
                      ButtonWidget(
                      buttonWidth: double.infinity,
                      buttonText: "UPDATE",
                      buttonType: false,
                      ),
                      
                      ButtonWidget(
                      buttonWidth: double.infinity,
                      buttonText: "DELETE",
                      buttonType: true,
                      )
                      

                      
                     
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}