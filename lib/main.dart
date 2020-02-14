import 'package:flutter/material.dart';
import 'package:rota_peralles/helpers/navegacaoHelper.dart';

void main() => runApp(PerallesApp());

class PerallesApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "exemplo de rotas",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      //initialRoute: NavegacaoHelper.rotaCarregaDadosInicias,
      onGenerateRoute: NavegacaoHelper.rotas(),
      onUnknownRoute: NavegacaoHelper.rotaNaoEncontrada(),
    );
  }
}
