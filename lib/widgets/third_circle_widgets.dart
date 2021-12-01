part of planet_widget;

class ThirdCircleWidgets extends StatefulWidget {
  const ThirdCircleWidgets({Key? key}) : super(key: key);

  @override
  State<ThirdCircleWidgets> createState() => _ThirdCircleWidgetsState();
}

class _ThirdCircleWidgetsState extends State<ThirdCircleWidgets> {
  late PlanetWidgetModel _planetWidgetModel;

  final List<Widget> _circleWidgets = [];
  final List<Size> _circleWidgetsSize = [];
  final ValueNotifier<bool> _refreshScreen = ValueNotifier(false);
  late CircleAnimationStatus _circleAnimationStatus;
  bool _startAnimation = false;

  /// hasListener: We have added this variable because stream listener calls twice.
  bool _hasListener = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _planetWidgetModel = PlanetWidgetModel.of(context);
    _circleAnimationStatus = (_planetWidgetModel.startAnimation)
        ? CircleAnimationStatus.start
        : CircleAnimationStatus.idle;
    _startAnimation = _planetWidgetModel.startAnimation;
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
    if (_planetWidgetModel.thirdCircleWidgets?.isNotEmpty ?? false) {
      _planetWidgetModel.thirdCircleWidgets?.asMap().forEach(
        (index, child) {
          _circleWidgets.add(
            TweenBuilderWidget(
              key: GlobalKey(),
              child: child,
              currentElementPosition: index,
              totalElementsLength:
                  _planetWidgetModel.thirdCircleWidgets?.length ?? 0,
              animationDuration:
                  _planetWidgetModel.thirdCircleAnimationDuration,
              circleRadius: _thirdRadius,
              circleRadians: _planetWidgetModel.thirdCircleRadians,
              circleWidgetsSize: _circleWidgetsSize,
              startAnimation: _startAnimation,
              onEndCallback: () {
                if (_planetWidgetModel.repeatAnimation) {
                  _refreshScreen.value = !_refreshScreen.value;
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
      }
    });
  }
}
