import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SlideUpView extends StatefulWidget {
  const SlideUpView({super.key});

  @override
  State<SlideUpView> createState() => _SlideUpView();
}

class _SlideUpView extends State<SlideUpView> {

  @override
  void dispose() {
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

    List data = [];
    for (var i = 1; i <= 10; i++) {
      data.add('Content data $i');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/undostres_logo.png'),
          width: 180,
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Text("Slide up page"),
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  maxChildSize: 0.75,
                  minChildSize: 0.12,
                  initialChildSize: 0.25,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 5.0, 
                        right: 5.0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 20.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: ListView(
                          controller: scrollController,
                          children: <Widget>[
                            Center(
                              child: Container( // Barra de desplazamiento
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 216, 216, 216),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              "Slide Up Title",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter a text",
                                  hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0)
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const ListTile(
                              title: Text("Data 1"),
                            ),
                            const ListTile(
                              title: Text("Data 2"),
                            ),
                            const ListTile(
                              title: Text("Data 3"),
                            ),
                            const ListTile(
                              title: Text("Data 3"),
                            ),
                            const ListTile(
                              title: Text("Data 4"),
                            ),
                            const ListTile(
                              title: Text("Data 5"),
                            ),
                            const ListTile(
                              title: Text("Data 6"),
                            ),
                            const ListTile(
                              title: Text("Data 7"),
                            ),
                            const ListTile(
                              title: Text("Data 8"),
                            ),
                          ],
                        ),
                    ),

                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
