import 'package:flutter/material.dart';

class Exemplo1View extends StatefulWidget {
  @override
  _Exemplo1ViewState createState() => _Exemplo1ViewState();
}

class _Exemplo1ViewState extends State<Exemplo1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("VIEW EXEMPLO 1", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "VOCÊ ESTÁ NA VIEW 1",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
      ),
    );
  }
}
