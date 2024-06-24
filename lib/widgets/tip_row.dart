import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({
    super.key,
    required this.theme,
    required this.tip,
  });

  final ThemeData theme;
  final double tip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tip',
          style: theme.textTheme.titleMedium,
        ),
        Text(
          tip.toStringAsFixed(2),
          style: theme.textTheme.titleMedium,
        )
      ],
    );
  }
}
