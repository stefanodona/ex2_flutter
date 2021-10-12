import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter"),),
        body: const Counter(),
      ),
    );
  }
}


class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}


class _CounterState extends State<Counter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {     // signal to flutter that there's a state changing
      if (counter<100){
        counter++;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter>0){
        counter--;
      }
    });
  }

  void setCounter(double newValue) {
    setState(() {
      counter = newValue.toInt();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.blue,
            child: Center(
              child: Text('$counter',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.deepOrangeAccent),
                child: const Icon(Icons.remove),
                onPressed: counter == 0 ? null : decrementCounter,  // not calling the function but assign the function decrementCounter to onPressed function
              ),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.deepOrangeAccent),
                child: const Icon(Icons.add),
                onPressed: counter == 100 ? null : incrementCounter,    // setting onPressed to null disable the button
              ),
            ],
          ),
          Slider(
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueGrey,
            value: counter.toDouble(),
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: setCounter,
          ),
        ],
      ),
    );
  }
}
