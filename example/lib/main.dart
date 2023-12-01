import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';

import 'constants/const.dart';
import 'constants/dimens.dart';
import 'constants/images.dart';
import 'constants/strings.dart';

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
  final List<Widget> _firstCircleImages = [];
  final List<Widget> _secondCircleImages = [];
  final List<Widget> _thirdCircleImages = [];

  @override
  void initState() {
    generateImages();
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
        child: CircularRotation(
          circularRotationProperty: CircularRotationModel(
            firstCircleFill: true,
            secondCircleFill: true,
            thirdCircleFill: true,
            firstCircleFillColor: Colors.red,
            secondCircleFillColor: Colors.blue,
            thirdCircleFillColor: Colors.purple,
            defaultCircleStrokeWidth: Dimens.strokeSmall,
            defaultCircleStrokeColor: Colors.white,
            startAnimation: true,
            repeatAnimation: false,
            firstCircleAnimationDuration: Constants.firstCircleAnimationDurationInMilliseconds,
            secondCircleAnimationDuration: Constants.secondCircleAnimationDurationInMilliseconds,
            thirdCircleAnimationDuration: Constants.thirdCircleAnimationDurationInMilliseconds,
            centerWidget: const InkWell(
              onTap: CircularRotation.eitherStartOrStopAnimation,
              child: _GetProfile(
                name: Strings.tom,
                image: Images.center,
                radius: Dimens.radiusLarge,
              ),
            ),
            firstCircleWidgets: _firstCircleImages,
            secondCircleWidgets: _secondCircleImages,
            thirdCircleWidgets: _thirdCircleImages,
            thirdCircleRadians: Dimens.thirdCircleRadians,
            secondCircleRadians: Dimens.secondCircleRadians,
            firstCircleRadians: Dimens.firstCircleRadians,
          ),
        ),
      ),
    );
  }

  void generateImages() {
    var listOfNames = [
      Strings.dad,
      Strings.uncleP,
      Strings.cindy,
      Strings.sally,
      Strings.sammy,
      Strings.bob,
      Strings.aria,
    ];

    /// Adding images into first circle.
    _firstCircleImages.add(
      _GetProfile(name: listOfNames[4], image: Images.planet_5),
    );
    _firstCircleImages.add(
      _GetProfile(name: listOfNames[3], image: Images.planet_4),
    );
    _firstCircleImages.add(
      _GetProfile(name: listOfNames[6], image: Images.planet_7),
    );

    /// Adding images into second circle.
    _secondCircleImages.add(
      _GetProfile(name: listOfNames[1], image: Images.planet_2),
    );
    _secondCircleImages.add(
      _GetProfile(name: listOfNames[2], image: Images.planet_3),
    );
    _secondCircleImages.add(
      _GetProfile(name: listOfNames[5], image: Images.planet_6),
    );

    /// Adding images into third circle.
    _thirdCircleImages.add(
      _GetProfile(name: listOfNames[0], image: Images.planet_1),
    );
  }
}

class _GetProfile extends StatelessWidget {
  const _GetProfile({
    required this.name,
    required this.image,
    this.radius = Dimens.radiusNormal,
    Key? key,
  }) : super(key: key);
  final String name;
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CircularImage(image: image, radius: radius),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _CircularImage extends StatelessWidget {
  const _CircularImage({required this.image, required this.radius, Key? key}) : super(key: key);
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(image),
      backgroundColor: Colors.transparent,
    );
  }
}
