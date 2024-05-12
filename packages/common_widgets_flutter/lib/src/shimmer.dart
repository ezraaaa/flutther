import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template shimmer}
/// Shimmer loader
/// {@endtemplate}
class Shimmer extends StatelessWidget {
  /// {@macro shimmer}
  const Shimmer({
    required this.child,
    super.key,
    this.backgroundColor,
  });

  /// This property is used for background color
  final Color? backgroundColor;

  /// This property is used for child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: [
        TintEffect(color: Colors.grey.shade700),
        ShimmerEffect(
          duration: 1200.ms,
          color: backgroundColor ??
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
        ),
      ],
      child: child,
    );
  }
}
