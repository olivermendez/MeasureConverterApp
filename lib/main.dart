import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double _numberFrom;
  late String _startMeasure;
  late String _convertedMeasure;

  final List<String> _measuresMap = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  @override
  void initState() {
    _numberFrom = 0;
    _startMeasure = "meters";
    _convertedMeasure = "kilometers";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Converter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Converter App'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Spacer(),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'From',
                    hintText: "Please insert the measure to be converted",
                  ),
                  //obscureText: false,
                  onChanged: (value) {
                    //comprobar si el valor es un numero
                    var valueEntered = double.tryParse(value);
                    if (valueEntered != null) {
                      setState(() {
                        _numberFrom = valueEntered;
                      });
                    }
                  },
                ),
                Text(_numberFrom.toString()),
                DropdownButton(
                  isExpanded: true,
                  value: _startMeasure,
                  items: _measuresMap.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("To"),

                const SizedBox(),

                DropdownButton(
                  value: _convertedMeasure,
                  isExpanded: true,
                  items: _measuresMap.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _convertedMeasure = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Convert"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
