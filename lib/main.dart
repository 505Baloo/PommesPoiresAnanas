import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Widget> _widgetList = [];
  String _updatedTitle = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _widgetList.add(_counterWidget());
      _updatedTitle = _updateTitle();
    });
  }

  bool _testPrime(n) {
    if (n == 1) {
      return false;
    } else if (n == 2) {
      return true;
    } else {
      for (var x = 2; x < n; x++) {
        if (n % x == 0) {
          return false;
        }
      }
      return true;
    }
  }

  String _updateTitle() {
    _updatedTitle = "$_counter : Nombre";
    if (_testPrime(_counter)) {
      return _updatedTitle += " premier";
    }
    return _updatedTitle += _counter % 2 == 0 ? " pair" : " impair";
  }

  Widget _fruitImageWidget() {
    if (_testPrime(_counter)) {
      return Image.asset("assets/images/ananas.png");
    }
    return Image.asset(_counter % 2 == 0
        ? "assets/images/poire.png"
        : "assets/images/pomme.png");
  }

  Widget _counterWidget() {
    return Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: _counter % 2 == 0 ? Colors.cyan : Colors.indigo,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: _fruitImageWidget(),
            ),
            Text(
              '$_counter',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Container(
            alignment: Alignment.center,
            child: Text(
              _updatedTitle,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          )),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _widgetList.length,
        itemBuilder: ((context, index) {
          return _widgetList[index];
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
