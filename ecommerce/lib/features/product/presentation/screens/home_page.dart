
import 'package:ecommerce/features/product/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey
                        ),
                        
                      ),
                      SizedBox(
                    width: 15,
      
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("july 14,2023"),
                      Row(
                        children: [
                          Text("Hello,"),
                          Text("Yohannes")
                        ],
                      ),
                    ],
                  ),
                    ],
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                        
                      )
                    ),
                    child: Icon(Icons.notifications_none_rounded),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text("Available Products",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
            SizedBox(
                height: 15,
              ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index){
                  return  const CardWidget();
                }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
           context.push('/addOrUpdatePage');
        },
        shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 40,),
        ),
      ),
    );
  }
}