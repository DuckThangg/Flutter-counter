import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int _value = 0;
  int n = 0;

  void _increment() {
    setState(() {
      _value++;
    });
  }

  void _decrement() {
    setState(() {
      _value--;
    });
  }

  void _multiplyByTen() {
    setState(() {
      _value *= 10;
    });
  }

  void _square() {
    setState(() {
      _value = _value * _value;
    });
  }

  void _power() {
    setState(() {
      _value = MyObject(value: _value).power(n);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Counter Page'),
        actions: [
          IconButton(
            onPressed: _decrement,
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Count',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$_value',
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Nhập số nguyên n'),
              onChanged: (value) {
                n = int.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: _multiplyByTen,
                  child: const Text('Multiply by 10'),
                ),
                ElevatedButton(
                  onPressed: _square,
                  child: const Text('Square'),
                ),
                ElevatedButton(
                  onPressed: _power,
                  child: Text('Power of $n'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyObject {
  int _value;

  MyObject({
    required int value,
  }) : _value = value;

  int get getValue => _value;

  set setValue(int newValue) {
    _value = newValue;
  }

  int power(int exponent) {
    if (exponent < 0) {
      throw ArgumentError("Exponent must be non-negative.");
    }

    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= _value;
    }

    return result;
  }
}
