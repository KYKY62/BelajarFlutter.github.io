import 'package:belajar_bloc/bloc/counterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    counter myCounter = BlocProvider.of<counter>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Bloc Provider"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      myCounter.kurangData();
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: const SizedBox(
                      width: 70,
                      height: 100,
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: BlocBuilder(
                    bloc: myCounter,
                    builder: (context, state) {
                      return Center(
                        child: Text(
                          "$state",
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      myCounter.tambahData();
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: const SizedBox(
                      width: 70,
                      height: 100,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
