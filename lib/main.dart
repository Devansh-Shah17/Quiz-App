import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// import 'Que.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.yellowAccent[200],
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent[700],
            title: Text(
              "Quiz App",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          body: MyHome(),
        ));
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // List<Icon> scorekeeper = [
  // ];
  List<String> Que = [
    'In C Or C++ Mingw Compiler is used',
    'In Java Code Only 1 System In Work',
    'Flutter Is a Framework ',
    'Boolean data can have at most two possible values.',
    'Syntax: bool variable_name ',
    'Dart Is a Language',
  ];
  List<bool> ans = [true, false, false, false, true, true];
  int QueNum = 0;
  int write = 0;
  int wrong = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 300,
          child: Text(
            Que[QueNum],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: TextButton(
                  onPressed: () {
                    bool CorrecAns = ans[QueNum];
                    if (CorrecAns == true) {
                      print("Right Ans");
                      write++;
                    } else {
                      print("Wrong Ans");
                      wrong++;
                    }
                    setState(() {
                      QueNum++;
                    });
                  },
                  child: Card(
                    color: Colors.greenAccent[700],
                    child: ListTile(
                      iconColor: Colors.black,
                      leading: Icon(Icons.done_outline),
                      title: Text(
                        "True",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: TextButton(
                onPressed: () {
                  bool CorrecAns = ans[QueNum];
                  if (CorrecAns == false) {
                    print("Right Ans");
                    write++;
                  } else {
                    print("Wrong Ans");
                    wrong++;
                  }

                  setState(() {
                    QueNum++;
                  });
                },
                child: Card(
                  color: Colors.red[600],
                  child: ListTile(
                    iconColor: Colors.black,
                    leading: Icon(Icons.cancel_sharp),
                    title: Text(
                      "False",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent[400]),
              child: TextButton(
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Done",
                    desc: "Right Question: $write\n"
                        "Wrong Question: $wrong\n",
                  ).show();
                  setState(() {
                    QueNum = 0;
                  });
                },
                child: Text(
                  "Submit Test",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
