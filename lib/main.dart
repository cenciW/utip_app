import 'package:flutter/material.dart';
import 'package:utip_app/widgets/bill_amount_field.dart';
import 'package:utip_app/widgets/person_counter.dart';
import 'package:utip_app/widgets/tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCounter = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  //methods
  double totalPerPerson() {
    return ((_billTotal * _tipPercentage) + _billTotal) / _personCounter;
  }

  double totalTip() {
    return (_billTotal * _tipPercentage);
  }

  void increment() {
    setState(() {
      _personCounter++;
    });
  }

  void decrement() {
    setState(() {
      if (_personCounter > 1) {
        _personCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double tip = totalTip();

    //add style
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
        fontSize: 24);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
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
                      '$total',
                      style: style.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontSize: theme.textTheme.displaySmall!.fontSize),
                    ),
                  ],
                )),
          ),
          //form
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: theme.colorScheme.primary, width: 2)),
                  child: Column(
                    children: [
                      BillAmountField(
                        billAmount: _billTotal.toString(),
                        onChanged: (String value) {
                          setState(() {
                            _billTotal = double.parse(value);
                          });
                          // print("Amount is: $value");
                        },
                      ),
                      //Split Bill Area
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Split',
                            style: theme.textTheme.titleMedium,
                          ),
                          PersonCounter(
                              theme: theme,
                              personCounter: _personCounter,
                              onDecrement: decrement,
                              onIncrement: increment),
                          // == tip section
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tip',
                            style: theme.textTheme.titleMedium,
                          ),
                          Text(
                            '$tip',
                            style: theme.textTheme.titleMedium,
                          )
                        ],
                      ),

                      //slider text
                      Text('${(_tipPercentage * 100).round()}%'),
                      //tip slider
                      TipSlider(
                        tipPercentage: _tipPercentage,
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
