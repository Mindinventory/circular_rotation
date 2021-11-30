part of planet_widget;

class DrawCircleWidgets extends StatefulWidget {
  /// Displays the first circle widgets.
  /// It contains the List of Widgets.
  final List<Widget>? firstCircleWidgets;

  /// Displays the second circle widgets.
  /// It contains the List of Widgets.
  final List<Widget>? secondCircleWidgets;

  /// Displays the third circle widgets.
  /// It contains the List of Widgets.
  final List<Widget>? thirdCircleWidgets;

  /// Displays the widget at center of circle.
  /// It contains the Widget.
  final Widget? centerWidget;

  /// Displays the first circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  final double firstCircleRadians;

  /// Displays the second circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  final double secondCircleRadians;

  /// Displays the third circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  final double thirdCircleRadians;

  /// Create the animation in planet widget.
  /// it contains bool value:
  ///
  /// true = display the planets with animation
  ///
  /// false = display the planets without animation
  bool startAnimation;

  /// Repeat the animation in planet widget.
  /// This parameter affects when [startAnimation] is true.
  /// it contains boole value.
  ///
  /// true = repeat the animation.
  ///
  /// false = show animation only for one time.
  final bool repeatAnimation;

  /// Set the animation duration in milliseconds for all circles.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int allCircleAnimationDuration;

  /// Set the animation duration in milliseconds for the first circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int firstCircleAnimationDuration;

  /// Set the animation duration in milliseconds for the second circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int secondCircleAnimationDuration;

  /// Set the animation duration in milliseconds for the third circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int thirdCircleAnimationDuration;

  ///  [Curves], a collection of common animation easing curves.
  ///  [CurveTween], which can be used to apply a [Curve] to an [Animation].
  ///
  /// Default value is Curves.linear
  final Curve curve;

  DrawCircleWidgets({
    Key? key,
    this.centerWidget,
    this.firstCircleWidgets,
    this.secondCircleWidgets,
    this.thirdCircleWidgets,
    required this.firstCircleRadians,
    required this.secondCircleRadians,
    required this.thirdCircleRadians,
    required this.startAnimation,
    required this.repeatAnimation,
    required this.firstCircleAnimationDuration,
    required this.secondCircleAnimationDuration,
    required this.thirdCircleAnimationDuration,
    required this.allCircleAnimationDuration,
    required this.curve,
  }) : super(key: key);

  @override
  _DrawCircleWidgetsState createState() => _DrawCircleWidgetsState();
}

class _DrawCircleWidgetsState extends State<DrawCircleWidgets>
    with TickerProviderStateMixin {
  /// First Circle Lists.
  List<Widget> firstCircleWidgets = [];
  List<Widget> pausedFirstCircleWidgets = [];
  List<Size> firstCircleWidgetsSize = [];

  /// Second Circle Lists.
  List<Widget> secondCircleWidgets = [];
  List<Size> secondCircleWidgetsSize = [];

  /// Third Circle Lists.
  List<Widget> thirdCircleWidgets = [];
  List<Size> thirdCircleWidgetsSize = [];

  /// Center Widget List
  List<Widget> centerCircleWidgets = [];
  List<Size> centerCircleWidgetsSize = [];

  bool isFirstCircleRepeat = true;
  bool isSecondCircleRepeat = true;
  bool isThirdCircleRepeat = true;

  HashMap<int, Widget> widgetsMap = HashMap();

  late CircleAnimationStatus circleAnimationStatus;
  AnimationController? firstCircleController;

  @override
  void initState() {
    super.initState();
    setSchedulerForWidgetSize();
    circleAnimationStatus = (widget.startAnimation)
        ? CircleAnimationStatus.start
        : CircleAnimationStatus.idle;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...createFirstItems(),
        ...createSecondItems(),
        ...createThirdItems(),
        ...createCenterItem(),
      ],
    );
  }


  List<Widget> createFirstItems() {
    if (!isFirstCircleRepeat) {
      return firstCircleWidgets;
    }
    if (firstCircleWidgetsSize.isNotEmpty) {
      firstCircleWidgets.clear();
    }
    if (widget.firstCircleWidgets != null &&
        widget.firstCircleWidgets!.isNotEmpty) {
      widget.firstCircleWidgets!.asMap().forEach(
        (index, child) {
          firstCircleWidgets.add(
            TweenBuilderWidget(
              key: GlobalKey(),
              child: child,
              currentElementPosition: index,
              totalElementsLength: widget.firstCircleWidgets?.length ?? 0,
              defaultAnimationDuration: widget.allCircleAnimationDuration,
              animationDuration: widget.firstCircleAnimationDuration,
              circleRadius: _firstRadius,
              circleRadians: widget.firstCircleRadians,
              circleWidgetsSize: firstCircleWidgetsSize,
              startAnimation: widget.startAnimation,
              curve: widget.curve,
              mapWidgets: widgetsMap,
              onEndCallback: () {
                if (widget.repeatAnimation) {
                  isFirstCircleRepeat = true;
                  setState(() {});
                }
              },
            ),
          );
        },
      );
      isFirstCircleRepeat = false;
      return firstCircleWidgets;
    }
    return [];
  }

  List<Widget> createSecondItems() {
    if (!isSecondCircleRepeat) {
      return secondCircleWidgets;
    }
    if (secondCircleWidgetsSize.isNotEmpty) {
      secondCircleWidgets.clear();
    }
    if (widget.secondCircleWidgets != null &&
        widget.secondCircleWidgets!.isNotEmpty) {
      widget.secondCircleWidgets!.asMap().forEach(
        (index, child) {
          secondCircleWidgets.add(
            TweenBuilderWidget(
              key: GlobalKey(),
              child: child,
              currentElementPosition: index,
              totalElementsLength: widget.secondCircleWidgets?.length ?? 0,
              defaultAnimationDuration: widget.allCircleAnimationDuration,
              animationDuration: widget.secondCircleAnimationDuration,
              circleRadius: _secondRadius,
              circleRadians: widget.secondCircleRadians,
              circleWidgetsSize: secondCircleWidgetsSize,
              startAnimation: widget.startAnimation,
              curve: widget.curve,
              mapWidgets: widgetsMap,
              onEndCallback: () {
                if (widget.repeatAnimation) {
                  isSecondCircleRepeat = true;
                  setState(() {});
                } else {
                  circleAnimationStatus = CircleAnimationStatus.idle;
                }
              },
            ),
          );
        },
      );
      isSecondCircleRepeat = false;
      return secondCircleWidgets;
    }
    return [];
  }

  List<Widget> createThirdItems() {
    if (!isThirdCircleRepeat) {
      return thirdCircleWidgets;
    }
    if (thirdCircleWidgetsSize.isNotEmpty) {
      thirdCircleWidgets.clear();
    }
    if (widget.thirdCircleWidgets != null &&
        widget.thirdCircleWidgets!.isNotEmpty) {
      widget.thirdCircleWidgets!.asMap().forEach(
        (index, child) {
          thirdCircleWidgets.add(
            TweenBuilderWidget(
              key: GlobalKey(),
              child: child,
              currentElementPosition: index,
              totalElementsLength: widget.thirdCircleWidgets?.length ?? 0,
              defaultAnimationDuration: widget.allCircleAnimationDuration,
              animationDuration: widget.thirdCircleAnimationDuration,
              circleRadius: _thirdRadius,
              circleRadians: widget.thirdCircleRadians,
              circleWidgetsSize: thirdCircleWidgetsSize,
              startAnimation: widget.startAnimation,
              curve: widget.curve,
              mapWidgets: widgetsMap,
              onEndCallback: () {
                if (widget.repeatAnimation) {
                  isThirdCircleRepeat = true;
                  setState(() {});
                }else {
                  circleAnimationStatus = CircleAnimationStatus.idle;
                }
              },
            ),
          );
        },
      );
      isThirdCircleRepeat = false;
      return thirdCircleWidgets;
    }
    return [];
  }

  List<Widget> createCenterItem() {
    if (centerCircleWidgetsSize.isNotEmpty) {
      centerCircleWidgets.clear();
    }
    var index = 0;
    centerCircleWidgets.add(
      Positioned(
        key: GlobalKey(),
        left: _circleCenter.dx -
            ((centerCircleWidgetsSize.length > index)
                ? centerCircleWidgetsSize[index].width
                : 0),
        top: _circleCenter.dy -
            ((centerCircleWidgetsSize.length > index)
                ? centerCircleWidgetsSize[index].height
                : 0),
        child: widget.centerWidget ?? Container(),
      ),
    );
    return centerCircleWidgets;
  }

  void resetCircleAnimation() {
    if (circleAnimationStatus != CircleAnimationStatus.stop) {
      setState(() {
        isFirstCircleRepeat = true;
        isSecondCircleRepeat = true;
        isThirdCircleRepeat = true;
        widget.startAnimation = false;
      });
      circleAnimationStatus = CircleAnimationStatus.stop;
    }
  }

  void startCircleAnimation() {
    if (circleAnimationStatus != CircleAnimationStatus.start) {
      setState(() {
        if (circleAnimationStatus == CircleAnimationStatus.pause) {
          firstCircleWidgets.clear();
          firstCircleWidgets = pausedFirstCircleWidgets;
        }
        isFirstCircleRepeat =
            circleAnimationStatus != CircleAnimationStatus.pause;
        isSecondCircleRepeat =
            circleAnimationStatus != CircleAnimationStatus.pause;
        isThirdCircleRepeat =
            circleAnimationStatus != CircleAnimationStatus.pause;
        widget.startAnimation = true;
      });
      circleAnimationStatus = CircleAnimationStatus.start;
    }
  }


  Future<void> setSchedulerForWidgetSize() async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      for (var element in firstCircleWidgets) {
        firstCircleWidgetsSize.add(Size(
            ((element.key as GlobalKey).currentContext?.size?.width ?? 0) / 2,
            ((element.key as GlobalKey).currentContext?.size?.height ?? 0) /
                2));
      }
      for (var element in secondCircleWidgets) {
        secondCircleWidgetsSize.add(Size(
            ((element.key as GlobalKey).currentContext?.size?.width ?? 0) / 2,
            ((element.key as GlobalKey).currentContext?.size?.height ?? 0) / 2));
      }
      for (var element in thirdCircleWidgets) {
        thirdCircleWidgetsSize.add(Size(
            ((element.key as GlobalKey).currentContext?.size?.width ?? 0) / 2,
            ((element.key as GlobalKey).currentContext?.size?.height ?? 0) / 2));
      }
      for (var element in centerCircleWidgets) {
        centerCircleWidgetsSize.add(Size(
            ((element.key as GlobalKey).currentContext?.size?.width ?? 0) / 2,
            ((element.key as GlobalKey).currentContext?.size?.height ?? 0) / 2));
      }
      setState(() {});
    });
  }

}
