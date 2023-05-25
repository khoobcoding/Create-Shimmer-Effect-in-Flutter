dependencies:
  flutter:
    sdk: flutter
  shimmer: ^2.0.0  // Add this package in your pubspec.yaml

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectApp extends StatefulWidget {
  const ShimmerEffectApp({super.key});

  @override
  State<ShimmerEffectApp> createState() => _ShimmerEffectAppState();
}

class _ShimmerEffectAppState extends State<ShimmerEffectApp> {
  bool isloading = true;
  mydata() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      isloading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Shimmer Effect App',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade400,
                  direction: ShimmerDirection.ltr,
                  period: const Duration(seconds: 1),
                  loop: 0,
                  enabled: true,
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 20,
              ),
              Shimmer(
                  gradient:
                      // SweepGradient(colors:  [Colors.red, Colors.amber]),
                      // RadialGradient(colors:  [Colors.red, Colors.amber]),
                      const LinearGradient(colors: [Colors.red, Colors.amber]),
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 20,
              ),
              Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.grey.shade700,
                  child: const Icon(
                    Icons.apple,
                    size: 250,
                  )
                  //  const Text(
                  //   'Shimmer',
                  //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  // )
                  ),
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return isloading
                        ? myshimmer()
                        : ListTile(
                            title: Text('My Data No - $index'),
                          );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Shimmer myshimmercontainer(
      {required double width,
      required double height,
      double? borderradius = 0}) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade400,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderradius!)),
        ));
  }

  ListTile myshimmer() {
    return ListTile(
      leading: myshimmercontainer(width: 50, height: 50, borderradius: 30),
      title: Align(
          alignment: Alignment.centerLeft,
          child: myshimmercontainer(width: 120, height: 14, borderradius: 10)),
      subtitle: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          myshimmercontainer(
              width: double.maxFinite, height: 16, borderradius: 10),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              myshimmercontainer(width: 115, height: 14, borderradius: 10),
              const SizedBox(
                width: 18,
              ),
              myshimmercontainer(width: 115, height: 14, borderradius: 10),
            ],
          )
        ],
      ),
    );
  }
}
