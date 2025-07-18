import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          //background with color gredient
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

          //main body content here
          LayoutBuilder(
            builder: (context, constraints) {
              //all content in center widget
              return Center(
                //column for all contents (vertical)
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //spacing for the weather logo
                    SizedBox(height: MediaQuery.of(context).size.height * 0.19),
                    //weather logo
                    LottieBuilder.asset(
                      'assets_project/Cloud.json',
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                      repeat: true,
                    ),
                    //spacing for next content (Text "weather ForeCasts")
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    //dedicated column for the text "weather forecasts"
                    Column(
                      children: [
                        //text "weather"
                        Text(
                          "Weather",
                          style: GoogleFonts.poppins(
                            fontSize: 64,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 0.5,
                            wordSpacing: 0.47,
                          ),
                        ),
                        //text "forecasts"
                        Text(
                          "ForeCasts",
                          style: GoogleFonts.poppins(
                            fontSize: 64,
                            color: Color(0xFFDDB130),
                            fontWeight: FontWeight.w400,
                            wordSpacing: 0.47,
                          ),
                        ),
                      ],
                    ),

                    //spacing for next content (elevated button)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    //elevated button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'secondpage');
                      },
                      //button styles
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
                      //button text
                      child: Text(
                        "Get Start",
                        style: GoogleFonts.openSans(
                          fontSize: 28,
                          color: Color(0xFF362A84),
                          fontWeight: FontWeight.w700,
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
