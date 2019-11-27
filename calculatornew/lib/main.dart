import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  String operand = "";
  double num1 = 0.0;
  double num2 = 0.0;

  buttonPressed(String x)
  {
    if(x == "Clear")
      {
        _output = "0";
        operand = "";
        num1 = 0.0;
        num2 = 0.0;
      }
    else if(x == "+" || x == "-" || x == "*" || x == "/")
      {
        num1 = double.parse(output);
        operand = x;
        _output = "0";
      }
    else if(x == ".")
      {
        if(_output.contains("."))
          return;
      }
    else if(x == "=")
      {
        num2 = double.parse(output);

        if(operand == "+")
          _output = (num1 + num2).toString();

        if(operand == "-")
          _output = (num1 - num2).toString();

        if(operand == "*")
          _output = (num1 * num2).toString();

        if(operand == "/")
          _output = (num1 / num2).toString();

        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      }
    else
      {
        _output = _output + x;
      }
    
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText)
  {
    return new Expanded(
        child: new MaterialButton(
          padding: EdgeInsets.all(40.0),
          onPressed: () =>
            buttonPressed(buttonText),
          child: new Text(
              buttonText,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
          ),
          color: Colors.teal,
          textColor: Colors.white,
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Container(
                child: new Text(
                  output,
                  style: TextStyle(
                  fontSize: 75.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              alignment: Alignment.bottomRight,
            ),

            new Expanded(
              child: new Divider(),
            ),

            Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("-"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("+"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("/"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("*"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("Clear"),
                    buildButton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );// This trailing comma makes auto-formatting nicer for build methods.
  }
}
