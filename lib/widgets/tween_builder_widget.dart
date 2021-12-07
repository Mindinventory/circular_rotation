part of planet_widget;

class TweenBuilderWidget extends StatefulWidget {
  final int index;
  final double begin;
  final double end;

  final Curve curve;
  final Widget child;

  final int animationDuration;
  final Widget Function(double size, Widget child) onBuild;
  final VoidCallback onEndCallback;

  const TweenBuilderWidget({
    required this.index,
    required this.begin,
    required this.end,
    required this.animationDuration,
    required this.curve,
    required this.child,
    required this.onBuild,
    required this.onEndCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<TweenBuilderWidget> createState() => _TweenBuilderWidgetState();
}

class _TweenBuilderWidgetState extends State<TweenBuilderWidget>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
     return TweenAnimationBuilder<double>(
      curve: widget.curve,
      child: widget.child,
      tween: Tween(
        begin: widget.begin.toDouble(),
        end: widget.end,
      ),
      duration: Duration(
        milliseconds: widget.animationDuration,
      ),
      onEnd: (widget.index!=0) ? null : widget.onEndCallback,
      builder: (BuildContext context, double size, Widget? child) {
        if(child==null) return Container();
        return widget.onBuild.call(double.parse(size.toStringAsFixed(2)), child);
      },
    );
  }
}
