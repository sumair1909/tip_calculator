import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

double billAmount, tipPercent, tipAmount, totalAmount;
    
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Tip Calculator",
              style: TextStyle(
                color: Colors.white,
              ))),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(child: Image.network("assets/rupee.png")),
        SizedBox(height: 40),
        Text(
          "Bill Amount",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextField(
            onChanged: (val) {
              billAmount = double.parse(val);
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: "Enter Your Amount Here"),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(60),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text("Next", style: TextStyle(fontSize: 17)),
            style:
                ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
          ),
        )
      ])),
    ));
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void calculate() {
    setState(() {
      tipAmount = tipPercent * billAmount / 100;
      totalAmount = billAmount + tipAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(backgroundColor: Colors.blue,
          title: Text("Tip Calculator",
              style: TextStyle(
                color: Colors.white,
              )), leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp),onPressed: (){Navigator.pop(context,MaterialPageRoute(builder: (context)=>MyApp()));}),) ,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The Amount Entered By You Is:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 15),
                Text("${billAmount}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                SizedBox(height: 75),
                Text("Enter % Tip You Want To Give",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 15),
                SizedBox(
                  width: 200,
                  child: TextField(
                    onChanged: (val1) {
                      tipPercent = double.parse(val1);
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Enter Your % Here"),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 75),
                SizedBox(
                    height: 45,
                    width: 90,
                    child: ElevatedButton(
                        onPressed: () {calculate();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Total Bill"),
                                  content: Text(
                                      "Bill Amount: ${billAmount}\n Tip Amount: ${tipAmount}\n Total Amount: ${totalAmount}"),
                                  actions: [],
                                );
                              });
                        },
                        child:
                            Text("Calculate", style: TextStyle(fontSize: 17))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Text("Calculate", style: TextStyle(fontSize: 17))
//title: Text("Total Bill"),content: Text("Bill Amount: ${billAmount}\n Tip Amount: ${tipAmount}\n Total Amount: ${totalAmount}"
