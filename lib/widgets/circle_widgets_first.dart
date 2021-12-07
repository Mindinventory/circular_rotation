part of planet_widget;

class CircleWidgetsFirst extends StatefulWidget {
  const CircleWidgetsFirst({Key? key}) : super(key: key);

  @override
  State<CircleWidgetsFirst> createState() => _CircleWidgetsFirstState();
}

class _CircleWidgetsFirstState extends State<CircleWidgetsFirst> {
  late PlanetWidgetModel _planetWidgetModel;

  final List<Widget> _circleWidgets = [];
  final List<Size> _circleWidgetsSize = [];
  final ValueNotifier<bool> _refreshScreen = ValueNotifier(false);
  late CircleAnimationStatus _circleAnimationStatus;
  bool _startAnimation = false;
  int totalElements = 0;
  HashMap<int, Map<double, Widget>> _positionedWidgets = HashMap();

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
    totalElements = _planetWidgetModel.firstCircleWidgets?.length ?? 0;
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
    if (_planetWidgetModel.firstCircleWidgets?.isNotEmpty ?? false) {
      _planetWidgetModel.firstCircleWidgets?.asMap().forEach(
        (index, child) {
          _circleWidgets.add(
           TweenBuilderWidget(
              key: GlobalKey(),
              index: index,
              begin: index.toDouble(),
              end: (_startAnimation)
                  ? (index + totalElements).toDouble()
                  : index.toDouble(),
              animationDuration: (_planetWidgetModel.firstCircleAnimationDuration != -1)
                    ? _planetWidgetModel.firstCircleAnimationDuration
                    : _planetWidgetModel.defaultCircleAnimationDuration,
              curve: _planetWidgetModel.curve,
              child: child,
              onBuild: (double size, Widget child) {
                Widget positionedWidget;
                if (_positionedWidgets.containsKey(index)) {
                  Map<double, Widget>? mapPositioned = _positionedWidgets[index];
                  if (mapPositioned?.containsKey(size) ?? false) {
                    positionedWidget = mapPositioned?[size] ?? Container();
                  } else {
                    positionedWidget = calculatePositionedWidget(
                      index: index,
                      totalElements: totalElements,
                      size: size,
                      circleRadius: _firstRadius,
                      circleRadians: _planetWidgetModel.firstCircleRadians,
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
                    circleRadius: _firstRadius,
                    circleRadians: _planetWidgetModel.firstCircleRadians,
                    circleWidgetsSize: (_circleWidgetsSize.length > index) ? _circleWidgetsSize[index] : const Size(0, 0),
                    child: child,
                  );
                  _positionedWidgets.putIfAbsent(
                      index, () => {size: positionedWidget});
                }
                return positionedWidget;
              },
              onEndCallback: () {
                _planetWidgetModel.onEndFirstCallback?.call();
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
      _positionedWidgets.clear();
      _circleWidgets.clear();
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
    _positionedWidgets.clear();
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
