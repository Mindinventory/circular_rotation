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

  /// Set the animation duration in seconds for all circles.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int allCircleAnimationDuration;

  /// Set the animation duration in seconds for the first circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int firstCircleAnimationDuration;

  /// Set the animation duration in seconds for the second circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int secondCircleAnimationDuration;

  /// Set the animation duration in seconds for the third circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int thirdCircleAnimationDuration;

  ///  [Curves], a collection of common animation easing curves.
  ///  [CurveTween], which can be used to apply a [Curve] to an [Animation].
  ///
  /// Default value is Curves.linear
  final Curve curve;

  AnimationController? firstCircleController;
  AnimationController? secondCircleController;
  AnimationController? thirdCircleController;

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

  HashMap<int, Widget> widgetMap = HashMap();

  late CircleAnimationStatus circleAnimationStatus;

  @override
  void initState() {
    super.initState();
    setSchedulerForWidgetSize();
    circleAnimationStatus = (widget.startAnimation)
        ? CircleAnimationStatus.START
        : CircleAnimationStatus.IDLE;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...createFirstItems(),
        /*...createSecondItems(),
        ...createThirdItems(),*/
        ...createCenterItem(),
      ],
    );
  }

  void setSchedulerForWidgetSize() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      for (var element in firstCircleWidgets) {
        firstCircleWidgetsSize.add(Size(
            (element.key as GlobalKey).currentContext!.size!.width / 2,
            (element.key as GlobalKey).currentContext!.size!.height / 2));
      }
      for (var element in secondCircleWidgets) {
        secondCircleWidgetsSize.add(Size(
            (element.key as GlobalKey).currentContext!.size!.width / 2,
            (element.key as GlobalKey).currentContext!.size!.height / 2));
      }
      for (var element in thirdCircleWidgets) {
        thirdCircleWidgetsSize.add(Size(
            (element.key as GlobalKey).currentContext!.size!.width / 2,
            (element.key as GlobalKey).currentContext!.size!.height / 2));
      }
      for (var element in centerCircleWidgets) {
        centerCircleWidgetsSize.add(Size(
            (element.key as GlobalKey).currentContext!.size!.width / 2,
            (element.key as GlobalKey).currentContext!.size!.height / 2));
      }

      setState(() {});
    });
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
        (index, element) {
          firstCircleWidgets.add(
            tweenBuilder(
              child: element,
              index: index,
              length: widget.firstCircleWidgets!.length,
              duration: widget.firstCircleAnimationDuration,
              circleRadius: _firstRadius,
              circleRadians: widget.firstCircleRadians,
              sizeList: firstCircleWidgetsSize,
              startAnimation: widget.startAnimation,
              widgetMap: widgetMap,
              onEnd: () {
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

  /*List<Widget> createSecondItems() {
    if (!isSecondCircleRepeat) {
      return secondCircleWidgets;
    }
    if (secondCircleWidgetsSize.isNotEmpty) {
      secondCircleWidgets.clear();
    }
    if (widget.secondCircleWidgets != null &&
        widget.secondCircleWidgets!.isNotEmpty) {
      widget.secondCircleWidgets!.asMap().forEach(
        (index, element) {
          secondCircleWidgets.add(
            tweenBuilder(
              child: element,
              index: index,
              length: widget.secondCircleWidgets!.length,
              duration: widget.secondCircleAnimationDuration,
              circleRadius: _secondRadius,
              circleRadians: widget.secondCircleRadians,
              sizeList: secondCircleWidgetsSize,
              startAnimation: widget.startAnimation,
              onEnd: () {
                if (widget.repeatAnimation) {
                  isSecondCircleRepeat = true;
                  setState(() {});
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
        (index, element) {
          thirdCircleWidgets.add(
            tweenBuilder(
              child: element,
              index: index,
              length: widget.thirdCircleWidgets!.length,
              duration: widget.thirdCircleAnimationDuration,
              circleRadius: _thirdRadius,
              circleRadians: widget.thirdCircleRadians,
              sizeList: thirdCircleWidgetsSize,
              startAnimation: widget.startAnimation,
              onEnd: () {
                if (widget.repeatAnimation) {
                  isThirdCircleRepeat = true;
                  setState(() {});
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
  }*/

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

  Widget tweenBuilder({
    required Widget child,
    required int index,
    required int length,
    required int duration,
    required double circleRadius,
    required double circleRadians,
    required List<Size> sizeList,
    required bool startAnimation,
    required Map widgetMap,
    required VoidCallback onEnd,
  }) {
    return TweenAnimationBuilder<double>(
      curve: widget.curve,
      child: child,
      key: GlobalKey(),
      tween: Tween(
        begin: index.toDouble(),
        end: (startAnimation) ? (index + length).toDouble() : index.toDouble(),
      ),
      duration: Duration(
        seconds:
            (duration != -1) ? duration : widget.allCircleAnimationDuration,
      ),
      onEnd: onEnd,
      builder: (BuildContext context, double size, Widget? child) {
        var elementPosition = size + circleRadians;
        var radians = ((elementPosition) * 2 * math.pi) / length;
        Offset pointOnCircle = Offset(
          circleRadius * math.cos(radians) +
              _circleCenter.dx -
              ((sizeList.length > index) ? sizeList[index].width : 0),
          circleRadius * math.sin(radians) +
              _circleCenter.dy -
              ((sizeList.length > index) ? sizeList[index].height : 0),
        );
        var positionedWidget = Positioned(
          left: pointOnCircle.dx,
          top: pointOnCircle.dy,
          child: child!,
        );
        if (widgetMap.containsKey(index)) {
          widgetMap.update(
            index,
            (value) => positionedWidget,
          );
        } else {
          widgetMap.putIfAbsent(
            index,
            () => positionedWidget,
          );
        }
        return widgetMap[index]!;
      },
    );
  }

  void resetCircleAnimation() {
    if (circleAnimationStatus != CircleAnimationStatus.STOP) {
      setState(() {
        isFirstCircleRepeat = true;
        isSecondCircleRepeat = true;
        isThirdCircleRepeat = true;
        widget.startAnimation = false;
      });
      circleAnimationStatus = CircleAnimationStatus.STOP;
    }
  }

  void startCircleAnimation() {
    if (circleAnimationStatus != CircleAnimationStatus.START) {
      setState(() {
        if (circleAnimationStatus == CircleAnimationStatus.PAUSE) {
          firstCircleWidgets.clear();
          firstCircleWidgets = pausedFirstCircleWidgets;
        }
        isFirstCircleRepeat =
            circleAnimationStatus != CircleAnimationStatus.PAUSE;
        isSecondCircleRepeat =
            circleAnimationStatus != CircleAnimationStatus.PAUSE;
        isThirdCircleRepeat =
            circleAnimationStatus != CircleAnimationStatus.PAUSE;
        widget.startAnimation = true;
      });
      circleAnimationStatus = CircleAnimationStatus.START;
    }
  }

  void stopCircleAnimation() {
    if (circleAnimationStatus != CircleAnimationStatus.PAUSE) {
      setState(() {
        pausedFirstCircleWidgets = firstCircleWidgets.toList();
        firstCircleWidgets.clear();
        widgetMap.forEach((key, value) {
          firstCircleWidgets.add(value);
        });
        isFirstCircleRepeat = false;
        isSecondCircleRepeat = false;
        isThirdCircleRepeat = false;
        widget.startAnimation = false;
      });
      circleAnimationStatus = CircleAnimationStatus.PAUSE;
    }
  }
}
