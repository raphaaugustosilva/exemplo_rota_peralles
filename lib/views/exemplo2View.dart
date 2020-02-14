import 'package:flutter/material.dart';
import 'package:rota_peralles/helpers/navegacaoHelper.dart';

class Exemplo2View extends StatefulWidget {
  final String parametro1;
  final int parametro2;

  Exemplo2View(this.parametro1, {this.parametro2});

  @override
  _Exemplo2ViewState createState() => _Exemplo2ViewState();
}

class _Exemplo2ViewState extends State<Exemplo2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VIEW EXEMPLO 2"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Parâmetro 1:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.parametro1),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Parâmetro 2:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${widget.parametro2 ?? ""}"),
              ],
            ),
            SizedBox(height: 100),
            RaisedButton(
              color: Colors.black,
              child: Text(
                "Voltar para tela anterior programaticamente",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                NavegacaoHelper.voltaNavegacao();
              },
            )
          ],
        ),
      ),
    );
  }
}
