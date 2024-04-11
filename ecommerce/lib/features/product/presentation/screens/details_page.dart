import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/widgets/loading.dart';
import 'package:ecommerce/features/product/presentation/widgets/number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductEvent(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child:
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: Loading(),
            );
          } else if (state is ProductSuccessState) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 286,
                      child: Image.network(
                        state.productEntity.imageUrl,
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
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
                              color: Colors.white, shape: BoxShape.circle),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.productEntity.catagory,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w200),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                "${state.productEntity.rating.rate}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200),
                              )
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
                          Text(
                            state.productEntity.description,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 24),
                          ),
                          Text("\$${state.productEntity.price}")
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        state.productEntity.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 11,
                        itemBuilder: (context, index) {
                          num number = index + 39;
                          return NumberWidget(
                            number: number,
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    state.productEntity.description,
                    style: TextStyle(fontSize: 14, height: 1.65),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('No products available'),
            );
          }
        })),
      ),
    );
  }
}
