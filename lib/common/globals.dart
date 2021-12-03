part of planet_widget;

late Offset _circleCenter;

double _radius = 0;
double _firstRadius = 0;
double _secondRadius = 0;
double _thirdRadius = 0;
StreamController<CircleAnimationStatus> controllerUserAction =
StreamController<CircleAnimationStatus>.broadcast();

Size designSize = const Size(392.0,781.0);
double firstCircleRadius = 20;
double secondCircleRadius = 40;
double thirdCircleRadius = 60;