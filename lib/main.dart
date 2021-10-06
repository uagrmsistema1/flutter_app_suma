//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String infoText="La suma es: ";

  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();

  Widget buildTextField(String label, TextEditingController c){
    return TextField(
            decoration: InputDecoration(
              labelText: label, labelStyle: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
              border: OutlineInputBorder()
            ),
            style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
            keyboardType: TextInputType.number,
            controller: c,
          );
  }
  void _resetFields(){
    setState(() {
      num1controller.text = "";
      num2controller.text = "";
      infoText="La suma es: ";      
    });
    
  }

  void _calculate(){
    double num1 = double.parse(num1controller.text);
    double num2 = double.parse(num2controller.text);

    double suma = num1 + num2;
    setState(() {
      infoText = suma.toString();      
    });
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("App Suma"),
        centerTitle: true,
        actions: [
          IconButton( icon: Icon(Icons.refresh), 
                      onPressed: (){
                        _resetFields();
                      },)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.calculate_outlined, size: 170.0, color: Colors.black),
            buildTextField("Ingrese Número", num1controller),
            Divider(),
            buildTextField("Ingrese Número", num2controller),

            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  child: Text("Sumar", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  onPressed: (){
                    _calculate();
                  },
                  color: Colors.lightBlue,
                ),
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(infoText, style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
              textAlign: TextAlign.center),
            ),

            
          ],
        ),
      ),
    );
  }
}

