part of planet_widget;

class CircleWidgetsSecond extends StatefulWidget {
  const CircleWidgetsSecond({Key? key}) : super(key: key);

  @override
  State<CircleWidgetsSecond> createState() => _CircleWidgetsSecondState();
}

class _CircleWidgetsSecondState extends State<CircleWidgetsSecond> {

  late PlanetWidgetModel _planetWidgetModel;
  final List<Widget> _circleWidgets = [];
  final List<Size> _circleWidgetsSize = [];
  final ValueNotifier<bool> _refreshScreen = ValueNotifier(false);
  late CircleAnimationStatus _circleAnimationStatus;
  bool _startAnimation = false;
  int totalElements = 0;

  HashMap<int, Map<double, Widget>> positionedWidgets = HashMap();

  /// hasListener: We have added this variable because stream listener calls twice.
  bool _hasListener = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _planetWidgetModel =
        PlanetWidgetInheritedModel.of(context).planetWidgetModel;
    _circleAnimationStatus = (_planetWidgetModel.startAnimation)
        ? CircleAnimationStatus.start
        : CircleAnimationStatus.idle;
    _startAnimation = _planetWidgetModel.startAnimation;
    totalElements = _planetWidgetModel.secondCircleWidgets?.length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    _setSchedulerBinding();
    _setListeners();
    return ValueListenableBuilder(
      valueListenable: _refreshScreen,
      builder: (BuildContext context, value, Widget? child) {
        _initData();
        return Stack(
          children: _circleWidgets,
        );
      },
    );
  }

  void _initData() {
    if (_circleWidgetsSize.isNotEmpty) {
      _circleWidgets.clear();
    }
    if (_planetWidgetModel.secondCircleWidgets?.isNotEmpty ?? false) {
      _planetWidgetModel.secondCircleWidgets?.asMap().forEach(
            (index, child) {
          _circleWidgets.add(
            TweenBuilderWidget(
              key: GlobalKey(),
              index: index,
              begin: index.toDouble(),
              end: (_startAnimation)
                  ? (index + totalElements).toDouble()
                  : index.toDouble(),
              animationDuration: (_planetWidgetModel.secondCircleAnimationDuration != -1)
                  ? _planetWidgetModel.secondCircleAnimationDuration
                  : _planetWidgetModel.defaultCircleAnimationDuration,
              curve: _planetWidgetModel.curve,
              child: child,
              onBuild: (double size, Widget child) {
                Widget positionedWidget;
                if (positionedWidgets.containsKey(index)) {
                  Map<double, Widget>? mapPositioned = positionedWidgets[index];
                  if (mapPositioned?.containsKey(size) ?? false) {
                    positionedWidget = mapPositioned?[size] ?? Container();
                  } else {
                    positionedWidget = calculatePositionedWidget(
                      index: index,
                      totalElements: totalElements,
                      size: size,
                      circleRadius: _secondRadius,
                      circleRadians: _planetWidgetModel.secondCircleRadians,
                      circleWidgetsSize: (_circleWidgetsSize.length > index) ? _circleWidgetsSize[index] : const Size(0, 0),
                      child: child,
                    );
                    mapPositioned?.putIfAbsent(size, () => positionedWidget);
                  }
                } else {
                  positionedWidget = calculatePositionedWidget(
                    index: index,
                    totalElements: totalElements,
                    size: size,
                    circleRadius: _secondRadius,
                    circleRadians: _planetWidgetModel.secondCircleRadians,
                    circleWidgetsSize: (_circleWidgetsSize.length > index) ? _circleWidgetsSize[index] : const Size(0, 0),
                    child: child,
                  );
                  positionedWidgets.putIfAbsent(
                      index, () => {size: positionedWidget});
                }
                return positionedWidget;
              },
              onEndCallback: () {
                _planetWidgetModel.onEndSecondCallback?.call();
                if (_planetWidgetModel.repeatAnimation) {
                  _refreshScreen.value = !_refreshScreen.value;
                } else {
                  _circleAnimationStatus = CircleAnimationStatus.stop;
                }
              },
            ),
          );
        },
      );
    }
  }



  void _setSchedulerBinding() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      for (var element in _circleWidgets) {
        _circleWidgetsSize.add(Size(
            ((element.key as GlobalKey).currentContext?.size?.width ?? 0) / 2,
            ((element.key as GlobalKey).currentContext?.size?.height ?? 0) /
                2));
      }
      positionedWidgets.clear();
      _refreshScreen.value = !_refreshScreen.value;
    });
  }

  void resetCircleAnimation() {
    if (_circleAnimationStatus != CircleAnimationStatus.stop) {
      _startAnimation = false;
      _circleAnimationStatus = CircleAnimationStatus.stop;
      _refreshScreen.value = !_refreshScreen.value;
    }
  }

  void _startCircleAnimation() {
    if (_circleAnimationStatus != CircleAnimationStatus.start) {
      _startAnimation = true;
      _circleAnimationStatus = CircleAnimationStatus.start;
      _refreshScreen.value = !_refreshScreen.value;
    }
  }
  void eitherStartOrStop(){
    if (_circleAnimationStatus != CircleAnimationStatus.start) {
      _startCircleAnimation();
    } else {
      resetCircleAnimation();
    }
  }
  void _updateScreen() {
    _refreshScreen.value = !_refreshScreen.value;
  }

  void _setListeners() {
    if (_hasListener) return;
    _hasListener = true;
    controllerUserAction.stream.listen((event) {
      switch (event) {
        case CircleAnimationStatus.start:
          _startCircleAnimation();
          break;
        case CircleAnimationStatus.stop:
          resetCircleAnimation();
          break;
        case CircleAnimationStatus.idle:
          break;
        case CircleAnimationStatus.refreshScreen:
          _updateScreen();
          break;
        case CircleAnimationStatus.startStop:
          eitherStartOrStop();
          break;
      }
    });
  }
}
