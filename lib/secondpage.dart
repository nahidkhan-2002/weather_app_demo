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
          Transform.scale(
            alignment: Alignment.center,
            scale: 0.9,
            child: LayoutBuilder(
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
                      SizedBox(height: height * 0.01),

                      //two buttons and text in the top in a row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //spacing from the left for backward button
                          SizedBox(width: width * 0.03),
                          //button for backward
                          IconButton(
                            onPressed: () {
                              //it'll take to first page if pressed
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

                          //padding for the text "dhaka,bangladesh and max min temp"
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            //column for the text "dhaka,bangladesh","max min temp"
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
                          //space from the right for the profile button
                          SizedBox(width: width * 0.03),
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

                      //expanded widget to make it responsive
                      Expanded(
                        child: SizedBox(
                          height: height * 0.2,
                          //all slider forecast contents here with controller button
                          child: Row(
                            children: [
                              //button backwards to scroll backwards
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

                              //slider contents
                              Expanded(
                                //listview builder for the forecast contents
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
                                        bottom: height * 0.03,
                                      ),
                                      //padding: EdgeInsets.all(width * 0.0015),
                                      decoration:
                                          (dayForecast['day'] == 'Mon')
                                              ? boxdecorationunique
                                              : boxDecorationregular,

                                      //content inside the slider capsules in column
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
                                              fontFamily:
                                                  "OpenSans-Regular.ttf",
                                            ),
                                          ),
                                          SizedBox(height: height * 0.005),
                                          Text(
                                            dayForecast['icon'] ?? '',
                                            style: TextStyle(
                                              fontSize: width * 0.12,
                                              fontFamily:
                                                  "OpenSans-Regular.ttf",
                                            ),
                                          ),
                                          SizedBox(height: height * 0.005),
                                          Text(
                                            dayForecast['temp'] ?? '',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.055,
                                              fontFamily:
                                                  "OpenSans-Regular.ttf",
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              //backward button to scroll backwards
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
                          height: height * 0.09,
                          width: width * 0.92,
                          margin: EdgeInsets.only(
                            top: height * 0.0004,
                            bottom: height * 0.00001,
                          ),
                          //decoration of card (see more in styles page)
                          decoration: cardDecoration,

                          //box contents
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //padding  for text "air quality" and text "air quality"
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
                                //padding for text 3-low health risk and text "health risk"
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

                                //padding for the line horizontal and horizontal line
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: height * 0.03,
                                    left: width * 0.05,
                                    right: width * 0.09,
                                  ),

                                  child: Container(
                                    width: width * 0.88,
                                    height: height * 0.004,
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

                                //padding for text see more and forward button and contents
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: height * 0.03,
                                    left: width * 0.05,
                                    right: width * 0.05,
                                  ),
                                  //contents
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      //forward Icon beside see more
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
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: height * 0.2,
                              decoration: cardDecoration.copyWith(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                      125,
                                      255,
                                      255,
                                      255,
                                    ),
                                    offset: Offset.zero,
                                    blurRadius: BorderSide.strokeAlignCenter,
                                    spreadRadius: 3.0,
                                    blurStyle: BlurStyle.solid,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(18),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      
                                    ],
                                  )
                                ],
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: height * 0.2,
                              decoration: cardDecoration.copyWith(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                      125,
                                      255,
                                      255,
                                      255,
                                    ),
                                    offset: Offset.zero,
                                    blurRadius: BorderSide.strokeAlignCenter,
                                    spreadRadius: 3.0,
                                    blurStyle: BlurStyle.solid,
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
