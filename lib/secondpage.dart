import 'utils.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_demo/style.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  // Maximum and minimum temperature variables
  var Maxtemp = "24°";
  var Mintemp = "18°";

  // List to save the 7-days forecast data
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
    // Get device width and height for responsiveness
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Responsive background gradient
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
          // Main content with scroll for small screens/web
          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height, minWidth: width),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.06,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Top bar with back/profile buttons and city info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Back button
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
                            // City and temperature info
                            Column(
                              children: [
                                Text(
                                  "Dhaka,Bangladesh",
                                  style: poppinsregular(width * 0.05),
                                ),
                                Text(
                                  "Max : $Maxtemp   Min : $Mintemp",
                                  style: poppinsregular(width * 0.05),
                                ),
                              ],
                            ),
                            // Profile button
                            IconButton(
                              onPressed: () {},
                              iconSize: width * 0.07,
                              icon: Icon(Icons.person, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.07),

                        // 7-Days Forecast title
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.05),
                            child: Text(
                              "7-Days Forecast",
                              style: TextStyle(
                                fontFamily: 'OpenSans-Regular.ttf',
                                fontSize: width * 0.055,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.01),

                        // Forecast horizontal list with scroll buttons
                        SizedBox(
                          height: height * 0.19,
                          child: Row(
                            children: [
                              // Scroll backward button
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                iconSize: width * 0.04,
                                onPressed: scrollbackward,
                              ),
                              // Forecast list
                              Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: forecast.length,
                                  itemBuilder: (context, index) {
                                    final dayForecast = forecast[index];
                                    return Container(
                                      width: width * 0.16, // smaller capsule
                                      margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.004,
                                        // vertical: height * 0.004,
                                      ),
                                      decoration:
                                          (dayForecast['day'] == 'Mon')
                                              ? boxdecorationunique
                                              : boxDecorationregular,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            dayForecast['temp'] ?? '',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20, // smaller text
                                              fontFamily:
                                                  "OpenSans-Regular.ttf",
                                            ),
                                          ),

                                          SizedBox(height: height * 0.003),
                                          Text(
                                            dayForecast['icon'] ?? '',
                                            style: TextStyle(
                                              fontSize: 28, // smaller icon
                                              fontFamily:
                                                  "OpenSans-Regular.ttf",
                                            ),
                                          ),
                                          SizedBox(height: height * 0.003),
                                          Text(
                                            dayForecast['day'] ?? '',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20, // smaller text
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

                              // Scroll forward button
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                iconSize: width * 0.04,
                                onPressed: scrollforward,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.025),

                        // Air Quality Card
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: height * 0.01),
                          decoration: cardDecoration.copyWith(
                            boxShadow: [shadowstyle],
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.025,
                            horizontal: width * 0.05,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "⨁  Air Quality",
                                style: opensansregular(width * 0.04),
                              ),
                              SizedBox(height: height * 0.008),
                              Text(
                                "3-Low Health Risk",
                                style: opensanssemibold(width * 0.07),
                              ),
                              SizedBox(height: height * 0.02),
                              // Gradient line
                              Container(
                                width: double.infinity,
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
                              SizedBox(height: height * 0.02),
                              // See More row
                              Row(
                                children: [
                                  Text(
                                    "See More",
                                    style: opensanssemibold(width * 0.05),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: width * 0.06,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: height * 0.02),
                        // Two responsive cards at the bottom
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                height: height * 0.18,
                                decoration: cardstyle_2,
                                padding: EdgeInsets.symmetric(
                                  vertical: height * 0.025,
                                  horizontal: width * 0.05,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.sunny, color: Colors.white),
                                        SizedBox(width: width * 0.008),
                                        Text(
                                          "SUNRISE",
                                          style: opensansregular(width * 0.04),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.009),
                                    Text(
                                      "5:28 AM",
                                      style: opensanssemibold(width * 0.06),
                                    ),
                                    SizedBox(height: height * 0.009),
                                    Text(
                                      "Sunset: 7.25PM",
                                      style: opensanssemibold(width * 0.04),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: width * 0.04),
                            Flexible(
                              child: Container(
                                height: height * 0.18,
                                decoration: cardstyle_2,
                                child: Padding(
                                  padding: EdgeInsetsGeometry.symmetric(
                                    vertical: height * 0.025,
                                    horizontal: width * 0.05,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sunny,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: width * 0.009),
                                          Text(
                                            "UV INDEX",
                                            style: opensansregular(
                                              width * 0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.009),
                                      Text(
                                        "8",
                                        style: opensanssemibold(width * 0.06),
                                      ),
                                      SizedBox(height: height * 0.002),
                                      Text(
                                        "Moderate",
                                        style: opensanssemibold(width * 0.06),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
