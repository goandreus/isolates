import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FibonacciArguments {
  final String message;
  final int n;

  FibonacciArguments(this.n, this.message);

  FibonacciArguments copyWith(int n) {
    return FibonacciArguments(n, this.message);
  }
}

int fibonacci(FibonacciArguments arguments) {
  final n = arguments.n;

  /// la cantidad de ejecuciones que se lleva, no imprimirla :p
  // final message = arguments.message;
  // print(message);
  if (n < 2) {
    return n;
  }
  return fibonacci(arguments.copyWith(n - 2)) +
      fibonacci(arguments.copyWith(n - 1));
}

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int number = 0;

  void onPressed() async {
    final result = await compute<FibonacciArguments, int>(
        fibonacci, FibonacciArguments(10, 'Hola mundo'));
    this.number = result;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$number'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.onPressed();
        },
      ),
    );
  }
}
