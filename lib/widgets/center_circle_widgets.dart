part of planet_widget;

class CenterCircleWidgets extends StatefulWidget {
  const CenterCircleWidgets({Key? key}) : super(key: key);

  @override
  State<CenterCircleWidgets> createState() => _CenterCircleWidgetsState();
}

class _CenterCircleWidgetsState extends State<CenterCircleWidgets> {
  late PlanetWidgetModel _planetWidgetModel;

  final List<Widget> _circleWidgets = [];
  final List<Size> _circleWidgetsSize = [];
  final ValueNotifier<bool> _refreshScreen = ValueNotifier(false);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _planetWidgetModel = PlanetWidgetModel.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    _setSchedulerBinding();
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
}
