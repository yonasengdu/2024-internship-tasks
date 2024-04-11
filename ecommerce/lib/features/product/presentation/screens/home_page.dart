import 'package:ecommerce/features/product/domain/entity/product_entity.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/widgets/card_widget.dart';
import 'package:ecommerce/features/product/presentation/widgets/loading.dart';
import 'package:ecommerce/features/product/presentation/widgets/message_display.dart';
import 'package:ecommerce/features/product/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchFieldController = TextEditingController();
  String titleText = "Products";

  void changeHandler(String value) {
    if (value.isNotEmpty) {
      BlocProvider.of<ProductBloc>(context)
          .add(SearchProdutEvent(query: value));
    } else {
      BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMMM d,yyyy').format(date);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInputField(
                  controller: searchFieldController,
                  onChangedHandler: changeHandler),
              SizedBox(
                height: 15,
              ),
              Text(titleText),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: BlocConsumer<ProductBloc, ProductState>(
                      listener: (BuildContext context, ProductState state) {
                if (state is ProductFailureState) {
                  const MessageDisplay(
                    message: "bad state",
                  );
                }
              }, builder: (context, state) {
                if (state is ProductLoadingState) {
                  return const Center(
                    child: Loading(),
                  );
                } else if (state is SearchProductLoadingState) {
                  return const Center(
                    child: Loading(),
                  );
                } else if (state is SearchProductSuccessState) {
                  return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        ProductEntity product = state.products[index];
                        return CardWidget(
                          product: product,
                        );
                      });
                } else if (state is ProductsSuccessState) {
                  return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        ProductEntity product = state.products[index];
                        return CardWidget(
                          product: product,
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No products available'),
                  );
                }
              }))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/addOrUpdatePage');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
