part of circular_rotation;

class CircularRotationBody extends StatefulWidget {
  const CircularRotationBody({Key? key}) : super(key: key);

  @override
  _CircularRotationBodyState createState() => _CircularRotationBodyState();
}

class _CircularRotationBodyState extends State<CircularRotationBody> {
  final ValueNotifier<bool> isCirclesDrawn = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  double getRadius({
    required double radius,
    required double currentScreenSize,
    required designSize,
  }) =>
      (radius * currentScreenSize) / designSize;

  Widget _buildBody() {
    return Stack(
      children: [
        RepaintBoundary(
          child: CustomPaint(
            painter: _buildCirclePainter(),
            child: Container(),
          ),
        ),
        ValueListenableBuilder(
          builder: (_, bool value, __) => (value) ? const _CircleWidgets() : Container(),
          valueListenable: isCirclesDrawn,
        )
      ],
    );
  }

  CustomPainter _buildCirclePainter() {
    return DrawCirclePainter(
      context: context,
      onCircleDrawComplete: _setSchedulerForCircleDrawn,
    );
  }

  void _setSchedulerForCircleDrawn() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        const _CircleWidgets();
        isCirclesDrawn.value = true;
        controllerUserAction.add(CircleAnimationStatus.refreshScreen);
      },
    );
  }
}

class _CircleWidgets extends StatelessWidget {
  const _CircleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CircleWidgetsFirst(),
        CircleWidgetsSecond(),
        CircleWidgetsThird(),
        CircleWidgetCenter(),
      ],
    );
  }
}
