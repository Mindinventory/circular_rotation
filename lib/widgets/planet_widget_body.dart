import 'package:flutter/material.dart';
import 'package:planet_widget/planet_widget.dart';

class PlanetWidgetBody extends StatefulWidget {
  const PlanetWidgetBody({Key? key}) : super(key: key);

  @override
  _PlanetWidgetBodyState createState() => _PlanetWidgetBodyState();
}

class _PlanetWidgetBodyState extends State<PlanetWidgetBody> {
  late PlanetWidgetModel _planetWidgetModel;
  ValueNotifier<bool> isCirclesDrawn = ValueNotifier(false);
  late Size screen;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screen = MediaQuery.of(context).size;
    _planetWidgetModel =
        PlanetWidgetInheritedModel.of(context).planetWidgetModel;
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  double getRadius(
      {required double radius,
      required double currentScreenSize,
      required designSize}) {
    return ((radius * currentScreenSize) / designSize);
  }

  Widget _buildBody() {
    return Stack(
      children: [
        RepaintBoundary(
          child:
              CustomPaint(painter: _buildCirclePainter(), child: Container()),
        ),
        ValueListenableBuilder(
          builder: (BuildContext context, bool value, Widget? child) {
            return (value) ? _buildCircleWidgets() : Container();
          },
          valueListenable: isCirclesDrawn,
        )
      ],
    );
  }

  CustomPainter _buildCirclePainter() {
    return DrawCirclePainter(
      context: context,
      onDrawCompleteCallback: () {
        setSchedulerForCircleDrawn();
      },
    );
  }

  void setSchedulerForCircleDrawn() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (timeStamp) {
        _buildCircleWidgets();
        isCirclesDrawn.value = true;
        controllerUserAction.add(CircleAnimationStatus.refreshScreen);
      },
    );
  }

  Widget _buildCircleWidgets() {
    return Stack(
      children: const [
        CircleWidgetsFirst(),
        CircleWidgetsSecond(),
        CircleWidgetsThird(),
        CircleWidgetCenter(),
      ],
    );
  }
}
