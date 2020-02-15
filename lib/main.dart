import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double billAmount = 0, tipPercent = 5, people = 1, tip = 0, totalBill = 0;

  void tipPercentIncrement(){
    setState(() {
      tipPercent++;
    });
  }

  void peopleIncrement(){
   setState(() {
     people++;
   });
  }

  void tipPercentDecrement(){
   setState(() {
     tipPercent--;
   });
  }

  void peopleDecrement(){
    setState(() {
      people--;
    });
  }

  void claculate(){
    setState(() {
      print(billAmount);
      print(tipPercent);
      if(people == 1){
        tip = billAmount*(tipPercent/100);
        totalBill = billAmount + tip;
      }else{
        tip = billAmount*(tipPercent/100);
        tip = tip/people;
        totalBill = billAmount + tip;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/notes.png", width: 100,height: 100,),
            SizedBox(height: 8,),
            Text("Tip Calculator"),
            SizedBox(height: 24,),
            TextField(
              onChanged: (val){
                billAmount = double.parse(val);
              },
              decoration: InputDecoration(hintText: "Bill"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text("Tip %"),
               Spacer(),
                Row(
                  children: <Widget>[
                    GestureDetector(onTap: () {
                      tipPercentDecrement();
                    }, child: Icon(Icons.remove_circle)),
                    SizedBox(
                      width: 8,
                    ),
                    Text("$tipPercent %"),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(onTap: () {
                      tipPercentIncrement();
                    }, child: Icon(Icons.add_circle))
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text("People"),
                Spacer(),
                Row(
                  children: <Widget>[
                    GestureDetector(onTap: () {
                      peopleDecrement();
                    }, child: Icon(Icons.remove_circle)),
                    SizedBox(
                      width: 8,
                    ),
                    Text("$people"),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(onTap: () {
                      peopleIncrement();
                    }, child: Icon(Icons.add_circle))
                  ],
                ),
              ],
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                if(billAmount > 0){
                  claculate();
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 22),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text("Calculate", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),),
              ),
            ),
            SizedBox(height: 16,),
            tip != 0 ? Text(people == 1 ? "Tip : ${tip.toStringAsFixed(2)}": "Tip : ${tip.toStringAsFixed(2)} per person") : Container(),
            SizedBox(height: 8,),
            totalBill != 0 ? Text(people == 1 ? "Total : ${totalBill.toStringAsFixed(2)}": "Tip : ${totalBill.toStringAsFixed(2)} per person") : Container()
          ],
        ),
      ),
    );
  }
}
