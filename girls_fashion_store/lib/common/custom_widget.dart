
import 'package:flutter/material.dart';

class SpacerHeight extends StatelessWidget {
  final double value;
  const SpacerHeight(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class SpacerWidth extends StatelessWidget {
  final double value;
  const SpacerWidth(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}

class CustomDivider extends StatelessWidget {
  final thickness;
  final color;
  final indent;
  final endIndent;

  CustomDivider({this.thickness, this.color, this.indent, this.endIndent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1,
      color: color ?? Colors.black,
      indent: indent ?? 0.0,
      endIndent: endIndent ?? 0.0,
    );
  }
}