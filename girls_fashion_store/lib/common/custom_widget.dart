
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
  const CustomDivider();
  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1);
  }
}