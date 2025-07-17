import 'package:flutter/material.dart';
import 'package:weather_app_demo/style.dart';
import 'package:weather_app_demo/utils.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  //maximum and minimum temperature variables
  var Maxtemp = "24°";
  var Mintemp = "18°";

  //list to save the 7-days forecast data
  final List<Map<String, String>> forecast = [
    {"day": "Mon", "temp": "19°C", "icon": "🌦️"},
    {"day": "Tue", "temp": "18°C", "icon": "🌧️"},
    {"day": "Wed", "temp": "18°C", "icon": "🌧️"},
    {"day": "Thu", "temp": "19°C", "icon": "🌦️"},
    {"day": "Fri", "temp": "20°C", "icon": "🌤️"},
    {"day": "Sat", "temp": "21°C", "icon": "🌤️"},
    {"day": "Sun", "temp": "22°C", "icon": "🌤️"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF0D0C3F),
                  Color(0xFF543DAD),
                  Color.fromARGB(255, 187, 68, 169),
                ],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
          ),

          //main content here
          LayoutBuilder(
            builder: (context, constraints) {
              //width and height for responsive width and height of a device
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              //all content in center
              return Center(
                //all content in column
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //spacing for the buttons
                    SizedBox(height: height * 0.04),

                    //buttons in the top in a row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //spacing from the left
                        SizedBox(width: width * 0.05),
                        //button for backward
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'firstpage');
                          },
                          iconSize: width * 0.07,
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                        //spacer for responsive space between to icons
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              //text "dhaka,bangladesh"
                              Text(
                                "Dhaka,Bangladesh",
                                style: TextStyle(
                                  fontFamily: 'ProductSans-Regular',
                                  fontSize: width * 0.06,
                                  color: Colors.white,
                                ),
                              ),

                              //text min and max tempareture
                              Text(
                                "Max : $Maxtemp   Min : $Mintemp",
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),

                        //button for profile
                        IconButton(
                          onPressed: () {},
                          iconSize: width * 0.07,
                          icon: Icon(Icons.person, color: Colors.white),
                        ),
                        //space from the right
                        SizedBox(width: width * 0.05),
                      ],
                    ),

                    //space for the next content in column (7-days forecast)
                    SizedBox(height: height * 0.001),

                    //padding for the text "7-days forecast"
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        width * 0.08,
                        height * 0.06,
                        width * 0.4,
                        height * 0.009,
                      ),
                      //text "7-days forecast"
                      child: Text(
                        "7-Days Forecast",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'OpenSans-Regular.ttf',
                          fontSize: width * 0.06,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //spacing for the next content (horizontal slider and control button)
                    //SizedBox(height: height * 0.001),

                    //container to
                    Expanded(
                      child: SizedBox(
                        height: height * 0.2,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              iconSize: width * 0.06,
                              onPressed: () {
                                scrollbackward();
                              },
                            ),
                            Expanded(
                              child: ListView.builder(
                                controller: scrollController,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: forecast.length,
                                itemBuilder: (context, index) {
                                  final dayForecast = forecast[index];
                                  return Container(
                                    // height: height * 0.001,
                                    width: width * 0.25,
                                    margin: EdgeInsets.only(
                                      left: width * 0.005,
                                      right: width * 0.007,
                                      top: height * 0.01,
                                      bottom: height * 0.05,
                                    ),
                                    //padding: EdgeInsets.all(width * 0.0015),
                                    decoration:
                                        (dayForecast['day'] == 'Mon')
                                            ? boxdecorationunique
                                            : boxDecorationregular,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          dayForecast['day'] ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: width * 0.055,
                                          ),
                                        ),
                                        SizedBox(height: height * 0.005),
                                        Text(
                                          dayForecast['icon'] ?? '',
                                          style: TextStyle(
                                            fontSize: width * 0.09,
                                          ),
                                        ),
                                        SizedBox(height: height * 0.005),
                                        Text(
                                          dayForecast['temp'] ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.055,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),

                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              iconSize: width * 0.06,
                              onPressed: () {
                                scrollforward();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.92,
                        margin: EdgeInsets.only(
                          top: height * 0.0004,
                          bottom: height * 0.0004,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xFF3D2E8F), Color(0xFF9D52AC)],
                            stops: [0.1, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(width * 0.05),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.03,
                                left: width * 0.05,
                              ),
                              child: Text(
                                "⨁  Air Quality",
                                style: TextStyle(
                                  fontFamily: 'OpenSans-Regular.ttf',
                                  fontSize: width * 0.05,
                                  letterSpacing: 0.47,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.008,
                                left: width * 0.05,
                              ),
                              child: Text(
                                "3-Low Health Risk",
                                style: TextStyle(
                                  fontFamily: 'OpenSans-Semibold.ttf',
                                  fontSize: width * 0.07,
                                  letterSpacing: 0.47,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.03,
                                left: width * 0.05,
                              ),
                              child: Container(
                                width: width * 0.88,
                                height: height * 0.005,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF362A84),
                                      Color(0xFF805BCA).withOpacity(0.82),
                                      Color(0xFFBD08FC),
                                    ],
                                    stops: [0.0, 1.0, 1.0],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.05,
                                left: width * 0.05,
                                right: width * 0.05,
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "See More",
                                    style: TextStyle(
                                      fontFamily: 'OpenSans-SemiBold.ttf',
                                      fontSize: width * 0.045,
                                      letterSpacing: 0.47,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),

                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: width * 0.08,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [],
                            ),
                            padding: EdgeInsets.all(18),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [],
                            ),
                            padding: EdgeInsets.all(18),
                          ),
                        ],
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
