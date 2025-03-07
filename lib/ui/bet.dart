import 'package:flutter/material.dart';

class Bet extends StatelessWidget {
  const Bet(
      {super.key, required this.minus, required this.plus, required this.bet});

  final Function() minus;
  final Function() plus;
  final int bet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Bet:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: minus, child: const Text('-')),
            Text(bet.toString()),
            TextButton(onPressed: plus, child: const Text('+'))
          ],
        )
      ],
    );
  }
}
