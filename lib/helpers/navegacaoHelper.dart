import '../main.dart';
import 'package:flutter/material.dart';
import 'package:rota_peralles/views/exemplo1View.dart';
import 'package:rota_peralles/views/exemplo2View.dart';
import 'package:rota_peralles/views/principalView.dart';


class NavegacaoHelper {
  static const rotaRoot = "/";
  static const rotaPrincipal = "/principal";
  static const rotaExemplo1 = "/exemplo1";
  static const rotaExemplo2 = "/exemplo2";

  static RouteFactory rotas() {
    return (settings) {
      final Map<String, dynamic> parametros = settings.arguments;
      Widget viewEncontrada;

      switch (settings.name) {
        case rotaRoot:
          viewEncontrada = PrincipalView();
          break;

        case rotaPrincipal:
          viewEncontrada = PrincipalView();
          break;

        case rotaExemplo1:
          viewEncontrada = Exemplo1View();
          break;

        case rotaExemplo2:
          String valorParamentro1 = parametros != null && parametros.containsKey("parametro1") ? parametros["parametro1"] : null;
          int valorParamentro2 = parametros != null && parametros.containsKey("parametro2") ? parametros["parametro2"] : null;

          viewEncontrada = Exemplo2View(
            valorParamentro1,
            parametro2: valorParamentro2,
          );
          break;

        default:
          return null;
      }

      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (BuildContext context) => viewEncontrada,
      );
    };
  }

  static bool checaRotaAtiva(BuildContext context) {
    return ModalRoute.of(context).isCurrent;
  }

  static RouteFactory rotaNaoEncontrada() {
    return (settings) {
      String rotaNaoEncontrada = settings.name;
      return MaterialPageRoute(builder: (context) => _widgetRotaNaoEncontrada(rotaNaoEncontrada));
    };
  }

  static Widget _widgetRotaNaoEncontrada(String rotaNaoEncontrada) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Rota não encontrada"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(text: "A rota ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              TextSpan(text: "$rotaNaoEncontrada", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.yellow)),
              TextSpan(text: " não foi encontrada/definida", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static Future<T> navegaParaView<T extends Object>(String nomeView, {Object arguments}) {
    return PerallesApp.navigatorKey.currentState.pushNamed(nomeView, arguments: arguments);
  }

  static bool voltaNavegacao() {
    return PerallesApp.navigatorKey.currentState.pop();
  }

  static bool voltaNavegacaoPassandoResultado<T extends Object>([T result]) {
    return PerallesApp.navigatorKey.currentState.pop(result);
  }

  static Future<T> resetaNavegacaoENavegaParaView<T extends Object>(BuildContext context, String nomeView, {Object arguments}) {
    return PerallesApp.navigatorKey.currentState.pushNamedAndRemoveUntil(nomeView, (Route<dynamic> route) => false, arguments: arguments);
  }

  static voltaNavegacaoAteView(String nomeView) {
    return PerallesApp.navigatorKey.currentState.popUntil(ModalRoute.withName(nomeView));
  }
}
