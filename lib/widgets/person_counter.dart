import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personCounter,
    //para funcionar as chamadas que nao tem retorno
    required this.onDecrement,
    required this.onIncrement,
  }) : _personCounter = personCounter;

  final ThemeData theme;
  final int _personCounter;

  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        color: theme.colorScheme.primary,
        icon: const Icon(Icons.remove),
        onPressed: onDecrement,
      ),
      Text(
        "$_personCounter",
        style: theme.textTheme.titleMedium,
      ),
      IconButton(
          color: theme.colorScheme.primary,
          icon: const Icon(Icons.add),
          onPressed: onIncrement),
    ]);
  }
}
