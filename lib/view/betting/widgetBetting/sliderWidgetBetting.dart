import 'package:flutter/material.dart';

class SliderBetting extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final status;
  final ValueSetter<double> data;

  const SliderBetting({
    Key? key,
    required this.min,
    required this.max,
    required this.value,
    required this.data,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: min,
      max: max,
      divisions: 100,
      onChanged: (status == 'paid') ? data : null,
      value: value,
    );
  }
}
