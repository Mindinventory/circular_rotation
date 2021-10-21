part of planet_widget;

/*class DrawCircleWidgets extends StatefulWidget {
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
  final bool startAnimation;

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

  bool isAnimationStarted = false;
  bool isAnimationPaused = false;
  bool isAnimationStopped = false;

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
  }) : super(key: key);

  @override
  _DrawCircleWidgetsState createState() => _DrawCircleWidgetsState();


  void startCircleAnimation() {
    if(!isAnimationStarted) {
      isAnimationStarted = true;
      isAnimationPaused = false;
      isAnimationStopped = false;
      firstCircleController?.forward();
      secondCircleController?.forward();
      thirdCircleController?.forward();
    }
  }

  void stopCircleAnimation() {
    if(!isAnimationPaused) {
      isAnimationStarted = false;
      isAnimationPaused = true;
      isAnimationStopped = false;
      firstCircleController?.stop();
      secondCircleController?.stop();
      thirdCircleController?.stop();
    }
  }

  void repeatCircleAnimation() {
    firstCircleController?.repeat();
    secondCircleController?.repeat();
    thirdCircleController?.repeat();
  }

  void resetCircleAnimation() {
    if(!isAnimationStopped) {
      isAnimationStarted = false;
      isAnimationPaused = false;
      isAnimationStopped = false;
      firstCircleController?.reset();
      secondCircleController?.reset();
      thirdCircleController?.reset();
    }
  }
}

class _DrawCircleWidgetsState extends State<DrawCircleWidgets>
    with TickerProviderStateMixin {

  /// First Circle Lists.
  List<Widget> firstCircleWidgets = [];
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

  late Animation<double> firstCircleAnimation;
  late Animation<double> secondCircleAnimation;
  late Animation<double> thirdCircleAnimation;

  @override
  void initState() {
    super.initState();
    setSchedulerForWidgetSize();
    setAnimationForCircle();
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
      if (widget.startAnimation) {
        widget.startCircleAnimation();
      }
    });
  }

  List<Widget> createFirstItems() {
    var firstIndex = firstCircleAnimation.value + widget.firstCircleRadians;
    if (firstCircleWidgetsSize.isNotEmpty) {
      firstCircleWidgets.clear();
    }
    if (widget.firstCircleWidgets != null &&
        widget.firstCircleWidgets!.isNotEmpty) {
      widget.firstCircleWidgets!.asMap().forEach(
        (index, element) {
          var radians =
              ((firstIndex) * 2 * math.pi) / widget.firstCircleWidgets!.length;
          Offset pointOnCircle = Offset(
            _firstRadius * math.cos(radians) +
                _circleCenter.dx -
                ((firstCircleWidgetsSize.length > index)
                    ? firstCircleWidgetsSize[index].width
                    : 0),
            _firstRadius * math.sin(radians) +
                _circleCenter.dy -
                ((firstCircleWidgetsSize.length > index)
                    ? firstCircleWidgetsSize[index].height
                    : 0),
          );
          firstCircleWidgets.add(
            Positioned(
              key: GlobalKey(),
              left: pointOnCircle.dx,
              top: pointOnCircle.dy,
              child: element,
            ),
          );
          firstIndex += 1;
        },
      );
      return firstCircleWidgets;
    }
    return [];
  }

  List<Widget> createSecondItems() {
    var secondIndex = secondCircleAnimation.value + widget.secondCircleRadians;
    if (secondCircleWidgetsSize.isNotEmpty) {
      secondCircleWidgets.clear();
    }
    if (widget.secondCircleWidgets != null &&
        widget.secondCircleWidgets!.isNotEmpty) {
      widget.secondCircleWidgets!.asMap().forEach(
        (index, element) {
          var radians = ((secondIndex) * 2 * math.pi) /
              widget.secondCircleWidgets!.length;
          Offset pointOnCircle = Offset(
            _secondRadius * math.cos(radians) +
                _circleCenter.dx -
                ((secondCircleWidgetsSize.length > index)
                    ? secondCircleWidgetsSize[index].width
                    : 0),
            _secondRadius * math.sin(radians) +
                _circleCenter.dy -
                ((secondCircleWidgetsSize.length > index)
                    ? secondCircleWidgetsSize[index].height
                    : 0),
          );
          secondCircleWidgets.add(
            Positioned(
              key: GlobalKey(),
              left: pointOnCircle.dx,
              top: pointOnCircle.dy,
              child: element,
            ),
          );
          secondIndex += 1;
        },
      );
      return secondCircleWidgets;
    }
    return [];
  }

  List<Widget> createThirdItems() {
    var thirdIndex = thirdCircleAnimation.value + widget.thirdCircleRadians;

    if (thirdCircleWidgetsSize.isNotEmpty) {
      thirdCircleWidgets.clear();
    }
    if (widget.thirdCircleWidgets != null &&
        widget.thirdCircleWidgets!.isNotEmpty) {
      widget.thirdCircleWidgets!.asMap().forEach(
        (index, element) {
          var radians =
              ((thirdIndex) * 2 * math.pi) / widget.thirdCircleWidgets!.length;
          Offset pointOnCircle = Offset(
            _thirdRadius * math.cos(radians) +
                _circleCenter.dx -
                ((thirdCircleWidgetsSize.length > index)
                    ? thirdCircleWidgetsSize[index].width
                    : 0),
            _thirdRadius * math.sin(radians) +
                _circleCenter.dy -
                ((thirdCircleWidgetsSize.length > index)
                    ? thirdCircleWidgetsSize[index].height
                    : 0),
          );
          thirdCircleWidgets.add(
            Positioned(
              key: GlobalKey(),
              left: pointOnCircle.dx,
              top: pointOnCircle.dy,
              child: element,
            ),
          );
          thirdIndex += 1;
        },
      );
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

  void setAnimationForCircle() {
    setFirstCircleAnimation();
    setSecondCircleAnimation();
    setThirdCircleAnimation();
  }

  void setFirstCircleAnimation() {
    widget.firstCircleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: (widget.firstCircleAnimationDuration != -1)
            ? widget.firstCircleAnimationDuration
            : widget.allCircleAnimationDuration,
      ),
    );
    Tween<double> firstCircleTween = Tween(
      begin: 0,
      end: widget.firstCircleWidgets?.length.toDouble(),
    );
    firstCircleAnimation = firstCircleTween.animate(widget.firstCircleController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        manageAnimationStatus(status);
      });
  }

  void setSecondCircleAnimation() {
    widget.secondCircleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: (widget.secondCircleAnimationDuration != -1)
            ? widget.secondCircleAnimationDuration
            : widget.allCircleAnimationDuration,
      ),
    );
    Tween<double> secondCircleTween = Tween(
      begin: 0,
      end: widget.secondCircleWidgets?.length.toDouble(),
    );
    secondCircleAnimation = secondCircleTween.animate(widget.secondCircleController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        manageAnimationStatus(status);
      });
  }

  void setThirdCircleAnimation() {
    widget.thirdCircleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: (widget.thirdCircleAnimationDuration != -1)
            ? widget.thirdCircleAnimationDuration
            : widget.allCircleAnimationDuration,
      ),
    );
    Tween<double> firstCircleTween = Tween(
      begin: 0,
      end: widget.thirdCircleWidgets?.length.toDouble(),
    );
    thirdCircleAnimation = firstCircleTween.animate(widget.thirdCircleController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        manageAnimationStatus(status);
      });
  }

  void manageAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (widget.repeatAnimation) {
        widget.repeatCircleAnimation();
      } else {
        widget.stopCircleAnimation();
      }
    } else if (status == AnimationStatus.dismissed) {
      widget.startCircleAnimation();
    }
  }


}*/
