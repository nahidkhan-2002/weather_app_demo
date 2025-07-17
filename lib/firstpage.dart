import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF0D0C3F), // Top: dark navy
                  Color(0xFF543DAD), // Middle: violet
                  Color.fromARGB(255, 187, 68, 169), // Bottom: magenta/purple
                ],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.19),
                    LottieBuilder.asset(
                      'assets_project/Cloud.json',
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                      repeat: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    Column(
                      children: [
                        Text(
                          "Weather",
                          style: TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                            fontFamily: "ProductSans-Regular",
                            fontWeight: FontWeight.bold,
                            height: 0.5,
                          ),
                        ),
                        Text(
                          "ForeCasts",
                          style: TextStyle(
                            fontSize: 64,
                            color: Color(0xFFDDB130),
                            fontFamily: "Poppins-Regular",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'secondpage');
                      },
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all<double>(10),
                        visualDensity: VisualDensity.compact,
                        minimumSize: WidgetStateProperty.all<Size>(
                          Size(304, 72),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Color(0xFFDDB130),
                        ),
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Color(0xFF362A84),
                        highlightColor: const Color.fromARGB(76, 255, 255, 255),
                        period: Duration(seconds: 2),
                        child: Text(
                          "Get Start",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "ProductSans-Regular",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
