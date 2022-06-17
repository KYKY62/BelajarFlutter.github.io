import 'package:belajar_bloc/bloc/counterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homePage extends StatelessWidget {
  counter myCounter = counter(initialData: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bloc App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer(
            bloc: myCounter,
            builder: (context, state) {
              return Center(
                child: Text(
                  "$state",
                  style: TextStyle(fontSize: 50),
                ),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Tidak boleh dibawah 0"),
              ));
            },
            listenWhen: (sebelum, sekarang) {
              if (sekarang == 0) {
                return true;
              } else {
                return false;
              }
            },
          ),

          // BlocListener<counter, int>(
          //   bloc: myCounter,
          //   listener: (context, state) {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text("Tidak boleh dibawah 0"),
          //     ));
          //   },
          //   listenWhen: (sebelum, sekarang) {
          //     if (sekarang <= 0) {
          //       return true;
          //     } else {
          //       return false;
          //     }
          //   },
          //   child: BlocBuilder<counter, int>(
          //     bloc: myCounter,
          //     builder: (context, state) {
          //       return Center(
          //         child: Text(
          //           "$state",
          //           style: TextStyle(fontSize: 50),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          // BlocBuilder<counter, int>(
          //   bloc: myCounter,
          //   buildWhen: (sebelum, sekarang) {
          //     if (sekarang % 2 == 0) {
          //       return true;
          //     } else {
          //       return false;
          //     }
          //   },
          //   builder: (context, state) {
          //     return Center(
          //       child: Text(
          //         "$state",
          //         style: TextStyle(fontSize: 50),
          //       ),
          //     );
          //   },
          // ),
          // StreamBuilder(
          //   initialData: myCounter.initialData,
          //   stream: myCounter.stream,
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     return Center(
          //       child: Text(
          //         "${snapshot.data}",
          //         style: TextStyle(fontSize: 50),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.kurangData();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.tambahData();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
