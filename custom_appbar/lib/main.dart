import 'package:custom_appbar/cappucino_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  /// List of Tab Bar Item
  List<String> items = [
    "Cappucino",
    "Americano",
    "Expresso",
  ];

  /// List of body icon
  List<Widget> icons = [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CappucinoCategories(
          name: "Cappucino",
          desc: "With Almond Milk",
          price: "\$4.98",
          gambar: "assets/ss.png",
        ),
        CappucinoCategories(
          name: "Cappucino",
          desc: "With Soy Milk",
          price: "\$5.14",
          gambar: "assets/ss.png",
        ),
        CappucinoCategories(
          name: "Cappucino",
          desc: "With Almond Milk",
          price: "\$4.98",
          gambar: "assets/ss.png",
        ),
        CappucinoCategories(
          name: "Cappucino",
          desc: "With Soy Milk",
          price: "\$5.14",
          gambar: "assets/ss.png",
        )
      ],
    ),
    Container(
      child: Center(
        child: Text("Americano"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Expresso"),
      ),
    )
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],

      /// APPBAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Custom TabBar",
          style: GoogleFonts.laila(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            /// CUSTOM TABBAR
            Container(
              width: double.infinity,
              height: 60,
              // color: Colors.red,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              print(index);
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color:
                                  current == index ? Color(0xffE8630A) : null,
                              borderRadius: current == index
                                  ? BorderRadius.circular(15)
                                  : BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: GoogleFonts.laila(
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),

            // MAIN BODY

            Expanded(
              child: Container(
                  // padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      icons[current],
                    ],
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
