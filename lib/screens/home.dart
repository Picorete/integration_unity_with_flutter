import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(viewportFraction: .85);
  final ValueNotifier<double> valueNotifier = ValueNotifier<double>(0.0);

  void listener() {
    valueNotifier.value = pageController.page;
  }

  @override
  void initState() {
    pageController.addListener(listener);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F9),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.drive_eta_rounded,
                color: Color(0xFF1F31E4),
              ),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Find your dealer",
                    style: TextStyle(
                        color: Color(0xFF1F31E4),
                        fontSize: 16,
                        letterSpacing: -1),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.filter_alt,
                    color: Color(0xFFB8C2CC),
                    size: 28,
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.notifications,
                    color: Color(0xFFB8C2CC),
                    size: 28,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Available vehicles',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1.5),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<double>(
                valueListenable: valueNotifier,
                builder: (_, value, __) => PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return _vehicleCard(
                          size, ((index - value)).clamp(0.0, 1.0));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _vehicleCard(Size size, opacity) {
    return Transform.scale(
      scale: ((opacity - 1) * -1).clamp(0.9, 1.0),
      child: Opacity(
        opacity: ((opacity - 1) * -1).clamp(0.5, 1.0),
        child: Container(
          width: size.width * .9,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BMW",
                        style: TextStyle(
                            color: Color(0xFF0D0A0D),
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1.5),
                      ),
                      Text(
                        "\$950",
                        style: TextStyle(
                            color: Color(0xFFA8463E),
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -1.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "M850 xDrive Gran Coupé",
                        style: TextStyle(
                            color: Color(0xFFB8C2CC), letterSpacing: -1.5),
                      ),
                      Text(
                        "/ month",
                        style: TextStyle(
                            color: Color(0xFFB8C2CC), letterSpacing: -1.5),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset('assets/car.png')),
                  Expanded(
                    child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 4.5,
                        children: [
                          Text(
                            'Engine power',
                            style: TextStyle(color: Color(0xFFB8C2CC)),
                          ),
                          Text(
                            '390kW (530 KM)',
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            '0-100 km/h',
                            style: TextStyle(color: Color(0xFFB8C2CC)),
                          ),
                          Text(
                            '3.0 sec',
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            'Fuel consumption',
                            style: TextStyle(color: Color(0xFFB8C2CC)),
                          ),
                          Text(
                            '11.5 - 11.6 l',
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            'CO2 emissions',
                            style: TextStyle(color: Color(0xFFB8C2CC)),
                          ),
                          Text(
                            '260 - 265 g/km',
                            textAlign: TextAlign.end,
                          ),
                        ]),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/unity'),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: Text(
                                "View 3D Model",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Choose this vehicle',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xFF1F31E4)),
                              minimumSize: MaterialStateProperty.resolveWith(
                                  (states) => Size(double.infinity, 40)),
                              shadowColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xFF1F31E4)),
                              elevation: MaterialStateProperty.resolveWith(
                                  (states) => 5)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
