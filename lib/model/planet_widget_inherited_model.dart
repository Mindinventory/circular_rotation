part of planet_widget;

class PlanetWidgetInheritedModel extends InheritedModel<PlanetWidgetModel> {
  final PlanetWidgetModel planetWidgetModel;

  const PlanetWidgetInheritedModel({
    required this.planetWidgetModel,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static PlanetWidgetInheritedModel of(
    BuildContext context,
  ) {
    PlanetWidgetInheritedModel? planetWidgetModel = context
        .dependOnInheritedWidgetOfExactType<PlanetWidgetInheritedModel>();
    assert(planetWidgetModel != null,
        'PlanetWidgetInheritedModel not initialized');
    return planetWidgetModel!;
  }

  @override
  bool updateShouldNotify(PlanetWidgetInheritedModel old) {
    var result = planetWidgetModel.visibleFirstCircle !=
            old.planetWidgetModel.visibleFirstCircle ||
        planetWidgetModel.visibleSecondCircle !=
            old.planetWidgetModel.visibleSecondCircle ||
        planetWidgetModel.visibleThirdCircle !=
            old.planetWidgetModel.visibleThirdCircle ||
        planetWidgetModel.firstCircleRadius !=
            old.planetWidgetModel.firstCircleRadius ||
        planetWidgetModel.secondCircleRadius !=
            old.planetWidgetModel.secondCircleRadius ||
        planetWidgetModel.thirdCircleRadius !=
            old.planetWidgetModel.thirdCircleRadius ||
        planetWidgetModel.firstCircleRadians !=
            old.planetWidgetModel.firstCircleRadians ||
        planetWidgetModel.secondCircleRadians !=
            old.planetWidgetModel.secondCircleRadians ||
        planetWidgetModel.thirdCircleRadians !=
            old.planetWidgetModel.thirdCircleRadians ||
        planetWidgetModel.firstCircleWidgets !=
            old.planetWidgetModel.firstCircleWidgets ||
        planetWidgetModel.secondCircleWidgets !=
            old.planetWidgetModel.secondCircleWidgets ||
        planetWidgetModel.thirdCircleWidgets !=
            old.planetWidgetModel.thirdCircleWidgets ||
        planetWidgetModel.centerWidget != old.planetWidgetModel.centerWidget ||
        planetWidgetModel.defaultCircleStrokeColor !=
            old.planetWidgetModel.defaultCircleStrokeColor ||
        planetWidgetModel.firstCircleStrokeColor !=
            old.planetWidgetModel.firstCircleStrokeColor ||
        planetWidgetModel.secondCircleStrokeColor !=
            old.planetWidgetModel.secondCircleStrokeColor ||
        planetWidgetModel.thirdCircleStrokeColor !=
            old.planetWidgetModel.thirdCircleStrokeColor ||
        planetWidgetModel.defaultCircleStrokeWidth !=
            old.planetWidgetModel.defaultCircleStrokeWidth ||
        planetWidgetModel.firstCircleStrokeWidth !=
            old.planetWidgetModel.firstCircleStrokeWidth ||
        planetWidgetModel.secondCircleStrokeWidth !=
            old.planetWidgetModel.secondCircleStrokeWidth ||
        planetWidgetModel.thirdCircleStrokeWidth !=
            old.planetWidgetModel.thirdCircleStrokeWidth ||
        planetWidgetModel.startAnimation !=
            old.planetWidgetModel.startAnimation ||
        planetWidgetModel.repeatAnimation !=
            old.planetWidgetModel.repeatAnimation ||
        planetWidgetModel.defaultCircleAnimationDuration !=
            old.planetWidgetModel.defaultCircleAnimationDuration ||
        planetWidgetModel.firstCircleAnimationDuration !=
            old.planetWidgetModel.firstCircleAnimationDuration ||
        planetWidgetModel.secondCircleAnimationDuration !=
            old.planetWidgetModel.secondCircleAnimationDuration ||
        planetWidgetModel.thirdCircleAnimationDuration !=
            old.planetWidgetModel.thirdCircleAnimationDuration ||
        planetWidgetModel.curve != old.planetWidgetModel.curve;
    return result;
  }

  @override
  bool updateShouldNotifyDependent(
      PlanetWidgetInheritedModel old, Set dependencies) {
    var result = planetWidgetModel.visibleFirstCircle !=
            old.planetWidgetModel.visibleFirstCircle ||
        planetWidgetModel.visibleSecondCircle !=
            old.planetWidgetModel.visibleSecondCircle ||
        planetWidgetModel.visibleThirdCircle !=
            old.planetWidgetModel.visibleThirdCircle ||
        planetWidgetModel.firstCircleRadius !=
            old.planetWidgetModel.firstCircleRadius ||
        planetWidgetModel.secondCircleRadius !=
            old.planetWidgetModel.secondCircleRadius ||
        planetWidgetModel.thirdCircleRadius !=
            old.planetWidgetModel.thirdCircleRadius ||
        planetWidgetModel.firstCircleRadians !=
            old.planetWidgetModel.firstCircleRadians ||
        planetWidgetModel.secondCircleRadians !=
            old.planetWidgetModel.secondCircleRadians ||
        planetWidgetModel.thirdCircleRadians !=
            old.planetWidgetModel.thirdCircleRadians ||
        planetWidgetModel.firstCircleWidgets !=
            old.planetWidgetModel.firstCircleWidgets ||
        planetWidgetModel.secondCircleWidgets !=
            old.planetWidgetModel.secondCircleWidgets ||
        planetWidgetModel.thirdCircleWidgets !=
            old.planetWidgetModel.thirdCircleWidgets ||
        planetWidgetModel.centerWidget != old.planetWidgetModel.centerWidget ||
        planetWidgetModel.defaultCircleStrokeColor !=
            old.planetWidgetModel.defaultCircleStrokeColor ||
        planetWidgetModel.firstCircleStrokeColor !=
            old.planetWidgetModel.firstCircleStrokeColor ||
        planetWidgetModel.secondCircleStrokeColor !=
            old.planetWidgetModel.secondCircleStrokeColor ||
        planetWidgetModel.thirdCircleStrokeColor !=
            old.planetWidgetModel.thirdCircleStrokeColor ||
        planetWidgetModel.defaultCircleStrokeWidth !=
            old.planetWidgetModel.defaultCircleStrokeWidth ||
        planetWidgetModel.firstCircleStrokeWidth !=
            old.planetWidgetModel.firstCircleStrokeWidth ||
        planetWidgetModel.secondCircleStrokeWidth !=
            old.planetWidgetModel.secondCircleStrokeWidth ||
        planetWidgetModel.thirdCircleStrokeWidth !=
            old.planetWidgetModel.thirdCircleStrokeWidth ||
        planetWidgetModel.startAnimation !=
            old.planetWidgetModel.startAnimation ||
        planetWidgetModel.repeatAnimation !=
            old.planetWidgetModel.repeatAnimation ||
        planetWidgetModel.defaultCircleAnimationDuration !=
            old.planetWidgetModel.defaultCircleAnimationDuration ||
        planetWidgetModel.firstCircleAnimationDuration !=
            old.planetWidgetModel.firstCircleAnimationDuration ||
        planetWidgetModel.secondCircleAnimationDuration !=
            old.planetWidgetModel.secondCircleAnimationDuration ||
        planetWidgetModel.thirdCircleAnimationDuration !=
            old.planetWidgetModel.thirdCircleAnimationDuration ||
        planetWidgetModel.curve != old.planetWidgetModel.curve;
    return result;
  }
}
