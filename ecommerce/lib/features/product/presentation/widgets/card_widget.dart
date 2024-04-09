

import 'package:ecommerce/features/product/presentation/screens/details_page.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
        },
        child: Container(
          
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
          ),
          width: 150,
          height: 240,
          child: Column(
            children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Image.asset(
                      width: double.infinity,
                      height: 160,
                      'assets/shoe.png',
                      fit: BoxFit.cover,
                    )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Derby Leather Shoes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),),
                            Text("\$120")
                          ],
                        ),
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
                        )
      
                      ],
                    ),
                  )
            ]
            ),
        ),
      ),
    ) ;
  }
}