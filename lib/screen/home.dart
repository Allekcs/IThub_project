import 'package:casino/ui/body.dart';
import 'package:casino/ui/slots.dart';
import 'package:flutter/material.dart';

import '../ui/head.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _addCounter() {
    setState(() {
      bet += 10;
    });
  }

  void _minusCounter() {
    setState(() {
      bet -= 10;
    });
  }

  int bet = 100;
  int balance = 1000;

  List<int> slots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head(
        balance: balance,
      ),
      body: Body(
        counter: _counter,
        onTap: () => setState(spinLogic),
        bet: bet,
        plus: _addCounter,
        minus: _minusCounter,
        slots: slots,
      ),
    );
  }

  spinLogic() {
    if (balance < bet) {
      slots = Slots.slotsError;
      return;
    }

    balance -= bet;

    slots = Slots.spin();
    winBetLogic();

    balance += _counter;
  }

  winBetLogic() {
    _counter = 0;

    Map<String, int> slotsWinCounters = {
      for (String slotName in Slots.slotsIcon) slotName: 0,
    };

    for (int slot in slots) {
      String slotName = Slots.slotsIcon[slot];
      slotsWinCounters[slotName] = slotsWinCounters[slotName]! + 1;
    }

    int maxSovpadenie = 0;
    // String sovpadenieName = '';
    for (String slotName in slotsWinCounters.keys) {
      if (slotsWinCounters[slotName]! > maxSovpadenie) {
        maxSovpadenie = slotsWinCounters[slotName]!;
        // sovpadenieName = slotName;
      }
    }

    switch (maxSovpadenie) {
      case 3:
        _counter = bet * 2;
        break;
      case 4:
        _counter = bet * 3;
        break;
      case 5:
        _counter = bet * 5;
        break;
      default:
        _counter = 0;
    }
  }
}
