import 'package:flutter/material.dart';
import 'package:multiplication/screens/model.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TextEditingController txtnumber = TextEditingController(text: ("0"));
  int i = 1;
  int y = 1;
  List<multi_model> ans = [
    multi_model(a: 1, b: 1, c: 1),
    multi_model(a: 1, b: 2, c: 2),
    multi_model(a: 1, b: 3, c: 3),
    multi_model(a: 1, b: 4, c: 4),
    multi_model(a: 1, b: 5, c: 5),
    multi_model(a: 1, b: 6, c: 6),
    multi_model(a: 1, b: 7, c: 7),
    multi_model(a: 1, b: 8, c: 8),
    multi_model(a: 1, b: 9, c: 9),
    multi_model(a: 1, b: 10, c: 10),
  ];

  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text("Multiplication Table",
                style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                //text
                Text(
                  "Input The Number",
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),

                //input
                SizedBox(height: 40),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return "Please Enter The Number";
                    }
                  },
                  controller: txtnumber,
                  decoration: InputDecoration(

                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orange)),
                      label: Text(
                        "Enter Number",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      prefixIcon: Icon(
                        Icons.numbers,
                        color: Colors.orange,
                        size: 30,
                      )),
                ),
                //button
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    if(txtkey.currentState!.validate())
                    {
                      y = int.parse(txtnumber.text);
                      setState(() {
                        ans.clear();
                        result();
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange),
                    alignment: Alignment.center,
                    child: Text(
                      "Result",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                //table
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return multi(ans[index]);
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget multi(multi_model m1) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
      ),
      alignment: Alignment.center,
      child: Text(
        "${m1.a} * ${m1.b} = ${m1.c}",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,letterSpacing: 9),
      ),
    );
  }

  void result() {
    for (i = 1; i <= 10; i++) {
      print("$y $i ${i * y}");
      ans.add(multi_model(a: y, b: i, c: i * y));
    }
  }
}