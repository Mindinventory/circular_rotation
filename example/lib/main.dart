import 'package:circular_rotation/circular_rotation.dart';
import 'package:example/constants/image_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CircularRotation _circularRotation;
  List<Widget> firstCircleImages = [];
  List<Widget> secondCircleImages = [];
  List<Widget> thirdCircleImages = [];

  @override
  void initState() {
    generateImages();
    _circularRotation = getPlanetWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              Images.galaxy,
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: _circularRotation,
            ),
          ],
        ),
      ),
    );
  }

  CircularRotation getPlanetWidget() {
    return CircularRotation(
      circularRotationProperty: CircularRotationModel(
        defaultCircleStrokeWidth: 0.2,
        defaultCircleStrokeColor: Colors.white,
        startAnimation: true,
        repeatAnimation: false,
        firstCircleAnimationDuration: 10000,
        secondCircleAnimationDuration: 7000,
        thirdCircleAnimationDuration: 5000,
        centerWidget: InkWell(
          onTap: () {
            CircularRotation.eitherStartOrStopAnimation();
          },
          child: getProfile(
            name: 'Tom',
            image: Images.center,
            radius: 45.0,
          ),
        ),
        firstCircleWidgets: firstCircleImages,
        secondCircleWidgets: secondCircleImages,
        thirdCircleWidgets: thirdCircleImages,
        thirdCircleRadians: 3.0,
        secondCircleRadians: 0.4,
        firstCircleRadians: 0.8,
      ),
    );
  }

  void generateImages() {
    var listOfNames = [
      'Dad',
      'Uncle P',
      'Cindy',
      'Sally',
      'Sammy',
      'Bob',
      'Aria'
    ];
    firstCircleImages.add(
      getProfile(name: listOfNames[4], image: Images.planet_5),
    );
    firstCircleImages.add(
      getProfile(name: listOfNames[3], image: Images.planet_4),
    );
    firstCircleImages.add(
      getProfile(name: listOfNames[6], image: Images.planet_7),
    );
    secondCircleImages.add(
      getProfile(name: listOfNames[1], image: Images.planet_2),
    );
    secondCircleImages.add(
      getProfile(name: listOfNames[2], image: Images.planet_3),
    );
    secondCircleImages.add(
      getProfile(name: listOfNames[5], image: Images.planet_6),
    );
    thirdCircleImages.add(
      getProfile(name: listOfNames[0], image: Images.planet_1),
    );
  }

  Widget getProfile(
      {required String name, required String image, double radius = 25}) {
    return Column(
      children: [
        circularImage(image: image, radius: radius),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget circularImage({required String image, required double radius}) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(image),
      backgroundColor: Colors.transparent,
    );
  }
}
