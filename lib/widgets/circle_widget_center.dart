part of planet_widget;

class CircleWidgetCenter extends StatefulWidget {
  const CircleWidgetCenter({Key? key}) : super(key: key);

  @override
  State<CircleWidgetCenter> createState() => _CircleWidgetCenterState();
}

class _CircleWidgetCenterState extends State<CircleWidgetCenter> {
  late PlanetWidgetModel _planetWidgetModel;

  final List<Widget> _circleWidgets = [];
  final List<Size> _circleWidgetsSize = [];
  final ValueNotifier<bool> _refreshScreen = ValueNotifier(false);
  bool _hasListener = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _planetWidgetModel =
        PlanetWidgetInheritedModel.of(context).planetWidgetModel;
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
    var index = 0;
    _circleWidgets.add(
      Positioned(
        key: GlobalKey(),
        left: _circleCenter.dx -
            ((_circleWidgetsSize.length > index)
                ? _circleWidgetsSize[index].width
                : 0),
        top: _circleCenter.dy -
            ((_circleWidgetsSize.length > index)
                ? _circleWidgetsSize[index].height
                : 0),
        child: _planetWidgetModel.centerWidget ?? Container(),
      ),
    );
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

  void _updateScreen() {
    _refreshScreen.value = !_refreshScreen.value;
  }

  void _setListeners() {
    if (_hasListener) return;
    _hasListener = true;
    controllerUserAction.stream.listen((event) {
      switch (event) {
        case CircleAnimationStatus.start:
        case CircleAnimationStatus.stop:
        case CircleAnimationStatus.idle:
        case CircleAnimationStatus.startStop:
          break;
        case CircleAnimationStatus.refreshScreen:
          _updateScreen();
          break;
      }
    });
  }
}
