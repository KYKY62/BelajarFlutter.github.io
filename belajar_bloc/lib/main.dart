import 'package:belajar_bloc/bloc/counterBloc.dart';
import 'package:belajar_bloc/pages/homePage.dart';
import 'package:belajar_bloc/pages/homepagedua.dart';
import 'package:belajar_bloc/pages/otherPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => counter(),
        )
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => HomePageDua(),
        '/otherPage': (context) => otherPage(),
      }),
    );
  }
}
