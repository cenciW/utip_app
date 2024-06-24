import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.style,
    required this.theme,
    required this.total,
  });

  final TextStyle style;
  final ThemeData theme;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                'Total per Person',
                style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall!.fontSize),
              ),
              Text(
                total.toStringAsFixed(2),
                style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall!.fontSize),
              ),
            ],
          )),
    );
  }
}
