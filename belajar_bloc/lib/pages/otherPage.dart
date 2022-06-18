import 'package:belajar_bloc/bloc/counterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class otherPage extends StatelessWidget {
  const otherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    counter myCounter = context.read<counter>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Other Page"),
      ),
      body: Center(
        child: BlocBuilder<counter, int>(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              "${state}",
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
      ),
    );
  }
}
