import 'package:flutter/material.dart';
import 'package:planet_widget/planet_widget.dart';

class PlanetWidgetBody extends StatefulWidget {
  const PlanetWidgetBody({Key? key}) : super(key: key);

  @override
  _PlanetWidgetBodyState createState() => _PlanetWidgetBodyState();
}

class _PlanetWidgetBodyState extends State<PlanetWidgetBody> {
  late PlanetWidgetModel planetWidgetModel;
  ValueNotifier<bool> isCirclesDrawn = ValueNotifier(false);

  // final GlobalKey<_DrawCircleWidgetsState> _drawCircleWidgetsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    planetWidgetModel = PlanetWidgetModel.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return CustomPaint(
      painter: _buildCirclePainter(),
      child: ValueListenableBuilder(
        builder: (BuildContext context, bool value, Widget? child) {
          return (value) ? _buildCircleWidgets() : Container();
        },
        valueListenable: isCirclesDrawn,
      ),
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
      },
    );
  }

  Widget _buildCircleWidgets() {
    return Stack(
      children: const [
        FirstCircleWidgets(),
        SecondCircleWidgets(),
        ThirdCircleWidgets(),
        CenterCircleWidgets(),
      ],
    );
  }
}
