
import 'package:ecommerce/features/product/presentation/widgets/button_widget.dart';
import 'package:ecommerce/features/product/presentation/widgets/number_widget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 286 ,
                    child: Image.asset(
                      "assets/shoe.png"
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 25,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            weight: 240,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
              )
                ],
              ),
          Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Men’s shoe",style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200
          
                                ),),
                                Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.yellow,),
                                    Text("(4.0)",style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200
          
                                ),)
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Derby Leather Shoes",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24
                                ),),
                                Text("\$120")
                              ],
                            ),
                             SizedBox(
                              height: 18,
                            ),
                            Text("Size:",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20
                            ),
                            ),
                            
          
                          ],
                        ),
                        
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16 ),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 11,
                          itemBuilder: (context, index){
                            num number = index + 39;
                            return  NumberWidget(number: number,);
                          }),
                        ),
                      ),
                
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text("A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe."
                      ,style: TextStyle(
                        fontSize: 14,
                        height: 1.65
                      ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonWidget(
                          buttonWidth: 152,
                          buttonText: "Delete",
                          buttonType: true,
                        ),
                        ButtonWidget(
                          buttonText:"UPDATE" , 
                          buttonType: false, 
                          buttonWidth: 152
                          )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}