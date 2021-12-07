import 'package:example/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:planet_widget/planet_widget.dart';

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
  late PlanetWidget _planetWidget;
  List<Widget> firstCircleImages = [];
  List<Widget> secondCircleImages = [];
  List<Widget> thirdCircleImages = [];

  @override
  void initState() {
    generateImages();
    _planetWidget = getPlanetWidget();
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
              GALAXY_IMAGE,
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: _planetWidget,
            ),
          ],
        ),
      ),
    );
  }

  PlanetWidget getPlanetWidget() {
    return PlanetWidget(
      planetWidgetProperty: PlanetWidgetModel(
        defaultCircleStrokeWidth: 0.2,
        defaultCircleStrokeColor: Colors.white,
        startAnimation: true,
        repeatAnimation: false,
        firstCircleAnimationDuration: 5000,
        secondCircleAnimationDuration: 7000,
        thirdCircleAnimationDuration: 10000,
        centerWidget: InkWell(
          onTap: () {
            PlanetWidget.eitherStartOrStopAnimation();
          },
          child: Image.asset(
            CENTER_IMAGE,
            width: 96,
            height: 96,
          ),
        ),
        firstCircleWidgets: firstCircleImages,
        secondCircleWidgets: secondCircleImages,
        thirdCircleWidgets: thirdCircleImages,
      ),
    );
  }

  void generateImages() {
    List.generate(15, (index) {
      if (index > 10) {
        firstCircleImages.add(
          Image.asset(
            'assets/planets_${index + 1}.png',
            width: 48,
            height: 48,
          ),
        );
      } else if (index > 5) {
        secondCircleImages.add(Image.asset(
          'assets/planets_${index + 1}.png',
          width: 48,
          height: 48,
        ));
      } else {
        thirdCircleImages.add(Image.asset(
          'assets/planets_${index + 1}.png',
          width: 48,
          height: 48,
        ));
      }
    });
  }
}
