import 'package:ecommerce/core/routes/routing_config.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/dependency_injection.dart' as di;

void main() async {
  await di.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ProductBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Internship',
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        routerConfig: router,
        
      ),
    );
  }
}
