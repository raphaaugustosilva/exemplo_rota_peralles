import 'package:flutter/material.dart';
import 'package:rota_peralles/helpers/navegacaoHelper.dart';
import 'package:rota_peralles/views/exemplo1View.dart';

class PrincipalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Principal"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Navegar para View de exemplo 1"),
              onPressed: () {
                //COM HELPER QUE CRIEI
                NavegacaoHelper.navegaParaView(NavegacaoHelper.rotaExemplo1);

                //OU
                //Navigator.of(context).pushNamed(NavegacaoHelper.rotaExemplo1);

                //OU JEITO "NATIVO" SEM CONTROLE CENTRALIZADO DE ROTAS
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Exemplo1View()),
                // );
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text(
                "Navegar para View de exemplo 2 com passagem de parâmetros",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                //PASSANDO PARAMETROS (propriedade opcional chamada "arguments")
                NavegacaoHelper.navegaParaView(NavegacaoHelper.rotaExemplo2, arguments: {
                  "parametro1": "OLÁ",
                  "parametro2": 31,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
