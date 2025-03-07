import 'package:casino/ui/bet.dart';
import 'package:casino/ui/button.dart';
import 'package:casino/ui/slots.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final int counter;
  final Function() onTap;
  final Function() plus;
  final Function() minus;
  final int bet;
  final List<int> slots;

  const Body({
    super.key,
    this.counter = 10,
    required this.onTap,
    required this.plus,
    required this.minus,
    required this.bet,
    required this.slots,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          schet(),
          const SizedBox(
            height: 20,
          ),
          Slots(slotsIndex: slots),
          const SizedBox(
            height: 40,
          ),
          Button(onTap: onTap),
          const SizedBox(
            height: 60,
          ),
          Bet(
            bet: bet,
            minus: minus,
            plus: plus,
          )
        ],
      ),
    );
  }

  Widget schet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(counter.toString()),
        const SizedBox(
          width: 15,
        ),
        const Image(
          width: 36,
          height: 36,
          image: AssetImage('assets/Coin.png'),
        )
      ],
    );
  }
}
