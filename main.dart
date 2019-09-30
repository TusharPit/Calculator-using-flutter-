import 'package:flutter/material.dart';

void main()
{
  runApp(new MyApp());
}
class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner:false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePage();
  }
}
class _MyHomePage extends State<HomePage>{
  int num1;
  int num2;
  String result = "";
  String display = "0";
  String operation;
  void buttonClicked(String btnVal){
    if(btnVal == "CLR"){
      num1 = 0;
      num2 = 0;
      result = "";
      display = "";
    }else if(btnVal == "+" || btnVal == "-" || btnVal == "x" || btnVal == "/"){
      num1 = int.parse(display);
      operation = btnVal;
      result = "";
    }
    else if(btnVal == "="){
      num2 = int.parse(display);
      if(operation == "+"){
        result = (num1 + num2).toString();
      }
      if(operation == "-"){
        result = (num1 - num2).toString();
      }
      if(operation == "x"){
        result = (num1 * num2).toString();
      }
      if(operation == "/"){
        result = (num1 /num2).toString();
      }
    }
    else{
      result = int.parse(display + btnVal).toString();
    }
    setState(() {
      display = result;
    });
  }

  Widget customButton(String buttonValue){
    return Expanded(child: OutlineButton(onPressed: () => buttonClicked(buttonValue),child:
      Text("$buttonValue",style: TextStyle(
        fontSize: 20.0
      ),),padding: EdgeInsets.all(24.0),),);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(title: new Text("Calculator"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(child: Container(
                padding: EdgeInsets.all(24.0),
                alignment: Alignment.bottomRight,
                child: Text("$display",style: TextStyle(
                    fontSize: 48.0
                ),),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("/"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("CLR"),
              customButton("0"),
              customButton("="),
              customButton("x"),
            ],
          )
        ],
      ),
    );
  }
}