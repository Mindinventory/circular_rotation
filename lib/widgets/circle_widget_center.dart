part of circular_rotation;

class CircleWidgetCenter extends StatefulWidget {
  const CircleWidgetCenter({Key? key}) : super(key: key);

  @override
  State<CircleWidgetCenter> createState() => _CircleWidgetCenterState();
}

class _CircleWidgetCenterState extends State<CircleWidgetCenter> {
  late CircularRotationModel _circularRotationModel;

  final List<Widget> _circleWidgets = [];
  final List<Size> _circleWidgetsSize = [];
  final ValueNotifier<bool> _refreshScreen = ValueNotifier(false);

  @override
  void initState() {
    _setSchedulerBinding();
    _setListeners();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _circularRotationModel =
        CircularRotationInheritedModel.of(context).circularRotationModel;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _refreshScreen,
      builder: (_, __, ___) {
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
        left: _calculateLeftPosition(index),
        top: _calculateTopPosition(index),
        child: _circularRotationModel.centerWidget ?? Container(),
      ),
    );
  }

  double _calculateLeftPosition(int index) =>
      _circleCenter.dx -
      ((_circleWidgetsSize.length > index)
          ? _circleWidgetsSize[index].width
          : 0);

  double _calculateTopPosition(int index) =>
      _circleCenter.dy -
      ((_circleWidgetsSize.length > index)
          ? _circleWidgetsSize[index].height
          : 0);

  void _setSchedulerBinding() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      for (var element in _circleWidgets) {
        assert(element.key is GlobalKey, 'Element must be a Global Key');
        _circleWidgetsSize.add(element.calculateWidgetHalfSize());
      }
      _updateScreen();
    });
  }

  void _updateScreen() => _refreshScreen.value = !_refreshScreen.value;

  void _setListeners() {
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
