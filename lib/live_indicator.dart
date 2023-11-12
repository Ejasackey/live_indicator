library live_indicator;

import 'dart:async';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LiveIndicator extends StatefulWidget {
  /// child widget
  final Widget child;

  /// radius of indicator
  double radius;

  /// radius of spread
  double? spreadRadius;

  /// color of indicator
  Color color;

  /// duration to animate the spread, it controls how fast the ripple happens,
  Duration spreadDuration;

  /// duration to wait between spread animations. it controls the frequency of the ripples.
  Duration waitDuration;
  LiveIndicator({
    super.key,
    this.child = const SizedBox.shrink(),
    this.radius = 4,
    this.spreadRadius,
    this.color = Colors.red,
    this.spreadDuration = const Duration(seconds: 1),
    this.waitDuration = const Duration(seconds: 2),
  }) {
    spreadRadius ??= (radius * .45);
  }

  @override
  State<LiveIndicator> createState() => _LiveIndicatorState();
}

class _LiveIndicatorState extends State<LiveIndicator> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      timer = Timer.periodic((widget.spreadDuration + widget.waitDuration),
          (timer) async {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        key: GlobalKey(),
        duration: widget.spreadDuration,
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return SizedBox(
            height: (widget.spreadRadius! + widget.radius) * 2,
            width: (widget.spreadRadius! + widget.radius) * 2,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: widget.radius + widget.spreadRadius! * value,
                    backgroundColor: widget.color.withOpacity(.8 - value * .8),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: widget.radius,
                    backgroundColor: widget.color,
                    child: widget.child,
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
