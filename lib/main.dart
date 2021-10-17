import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  double _result = 0;

  void calculateBMI() {
    double height = double.parse(_height.text) / 100;
    double weight = double.parse(_weight.text);
    double heightSquare = height * height;
    double result = weight / heightSquare;
    print(result);

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _height,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm):',
              ),
            ),
            TextField(
              controller: _weight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg):',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                _result == 0
                    ? "Enter Values"
                    : "BMI : ${_result.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.yellow[900],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: calculateBMI,
        label: const Text('Calculate'),
        icon: const Icon(Icons.calculate),
        backgroundColor: Colors.green,
      ),
    );
  }
}
