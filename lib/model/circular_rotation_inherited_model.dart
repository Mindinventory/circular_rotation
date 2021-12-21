part of circular_rotation;

class CircularRotationInheritedModel
    extends InheritedModel<CircularRotationModel> {
  final CircularRotationModel circularRotationModel;

  const CircularRotationInheritedModel({
    required this.circularRotationModel,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static CircularRotationInheritedModel of(
    BuildContext context,
  ) {
    CircularRotationInheritedModel? circularRotationInheritedModel = context
        .dependOnInheritedWidgetOfExactType<CircularRotationInheritedModel>();
    assert(circularRotationInheritedModel != null,
        Strings.circularRotationInheritedModelNotInitialized);
    return circularRotationInheritedModel!;
  }

  @override
  bool updateShouldNotify(CircularRotationInheritedModel old) {
    var result = circularRotationModel.visibleFirstCircle !=
            old.circularRotationModel.visibleFirstCircle ||
        circularRotationModel.visibleSecondCircle !=
            old.circularRotationModel.visibleSecondCircle ||
        circularRotationModel.visibleThirdCircle !=
            old.circularRotationModel.visibleThirdCircle ||
        circularRotationModel.firstCircleRadius !=
            old.circularRotationModel.firstCircleRadius ||
        circularRotationModel.secondCircleRadius !=
            old.circularRotationModel.secondCircleRadius ||
        circularRotationModel.thirdCircleRadius !=
            old.circularRotationModel.thirdCircleRadius ||
        circularRotationModel.firstCircleRadians !=
            old.circularRotationModel.firstCircleRadians ||
        circularRotationModel.secondCircleRadians !=
            old.circularRotationModel.secondCircleRadians ||
        circularRotationModel.thirdCircleRadians !=
            old.circularRotationModel.thirdCircleRadians ||
        circularRotationModel.firstCircleWidgets !=
            old.circularRotationModel.firstCircleWidgets ||
        circularRotationModel.secondCircleWidgets !=
            old.circularRotationModel.secondCircleWidgets ||
        circularRotationModel.thirdCircleWidgets !=
            old.circularRotationModel.thirdCircleWidgets ||
        circularRotationModel.centerWidget !=
            old.circularRotationModel.centerWidget ||
        circularRotationModel.defaultCircleStrokeColor !=
            old.circularRotationModel.defaultCircleStrokeColor ||
        circularRotationModel.firstCircleStrokeColor !=
            old.circularRotationModel.firstCircleStrokeColor ||
        circularRotationModel.secondCircleStrokeColor !=
            old.circularRotationModel.secondCircleStrokeColor ||
        circularRotationModel.thirdCircleStrokeColor !=
            old.circularRotationModel.thirdCircleStrokeColor ||
        circularRotationModel.defaultCircleStrokeWidth !=
            old.circularRotationModel.defaultCircleStrokeWidth ||
        circularRotationModel.firstCircleStrokeWidth !=
            old.circularRotationModel.firstCircleStrokeWidth ||
        circularRotationModel.secondCircleStrokeWidth !=
            old.circularRotationModel.secondCircleStrokeWidth ||
        circularRotationModel.thirdCircleStrokeWidth !=
            old.circularRotationModel.thirdCircleStrokeWidth ||
        circularRotationModel.startAnimation !=
            old.circularRotationModel.startAnimation ||
        circularRotationModel.repeatAnimation !=
            old.circularRotationModel.repeatAnimation ||
        circularRotationModel.defaultCircleAnimationDuration !=
            old.circularRotationModel.defaultCircleAnimationDuration ||
        circularRotationModel.firstCircleAnimationDuration !=
            old.circularRotationModel.firstCircleAnimationDuration ||
        circularRotationModel.secondCircleAnimationDuration !=
            old.circularRotationModel.secondCircleAnimationDuration ||
        circularRotationModel.thirdCircleAnimationDuration !=
            old.circularRotationModel.thirdCircleAnimationDuration ||
        circularRotationModel.curve != old.circularRotationModel.curve;
    return result;
  }

  @override
  bool updateShouldNotifyDependent(
      CircularRotationInheritedModel old, Set dependencies) {
    var result = circularRotationModel.visibleFirstCircle !=
            old.circularRotationModel.visibleFirstCircle ||
        circularRotationModel.visibleSecondCircle !=
            old.circularRotationModel.visibleSecondCircle ||
        circularRotationModel.visibleThirdCircle !=
            old.circularRotationModel.visibleThirdCircle ||
        circularRotationModel.firstCircleRadius !=
            old.circularRotationModel.firstCircleRadius ||
        circularRotationModel.secondCircleRadius !=
            old.circularRotationModel.secondCircleRadius ||
        circularRotationModel.thirdCircleRadius !=
            old.circularRotationModel.thirdCircleRadius ||
        circularRotationModel.firstCircleRadians !=
            old.circularRotationModel.firstCircleRadians ||
        circularRotationModel.secondCircleRadians !=
            old.circularRotationModel.secondCircleRadians ||
        circularRotationModel.thirdCircleRadians !=
            old.circularRotationModel.thirdCircleRadians ||
        circularRotationModel.firstCircleWidgets !=
            old.circularRotationModel.firstCircleWidgets ||
        circularRotationModel.secondCircleWidgets !=
            old.circularRotationModel.secondCircleWidgets ||
        circularRotationModel.thirdCircleWidgets !=
            old.circularRotationModel.thirdCircleWidgets ||
        circularRotationModel.centerWidget !=
            old.circularRotationModel.centerWidget ||
        circularRotationModel.defaultCircleStrokeColor !=
            old.circularRotationModel.defaultCircleStrokeColor ||
        circularRotationModel.firstCircleStrokeColor !=
            old.circularRotationModel.firstCircleStrokeColor ||
        circularRotationModel.secondCircleStrokeColor !=
            old.circularRotationModel.secondCircleStrokeColor ||
        circularRotationModel.thirdCircleStrokeColor !=
            old.circularRotationModel.thirdCircleStrokeColor ||
        circularRotationModel.defaultCircleStrokeWidth !=
            old.circularRotationModel.defaultCircleStrokeWidth ||
        circularRotationModel.firstCircleStrokeWidth !=
            old.circularRotationModel.firstCircleStrokeWidth ||
        circularRotationModel.secondCircleStrokeWidth !=
            old.circularRotationModel.secondCircleStrokeWidth ||
        circularRotationModel.thirdCircleStrokeWidth !=
            old.circularRotationModel.thirdCircleStrokeWidth ||
        circularRotationModel.startAnimation !=
            old.circularRotationModel.startAnimation ||
        circularRotationModel.repeatAnimation !=
            old.circularRotationModel.repeatAnimation ||
        circularRotationModel.defaultCircleAnimationDuration !=
            old.circularRotationModel.defaultCircleAnimationDuration ||
        circularRotationModel.firstCircleAnimationDuration !=
            old.circularRotationModel.firstCircleAnimationDuration ||
        circularRotationModel.secondCircleAnimationDuration !=
            old.circularRotationModel.secondCircleAnimationDuration ||
        circularRotationModel.thirdCircleAnimationDuration !=
            old.circularRotationModel.thirdCircleAnimationDuration ||
        circularRotationModel.curve != old.circularRotationModel.curve;
    return result;
  }
}
