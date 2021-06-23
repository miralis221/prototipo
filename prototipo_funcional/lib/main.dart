import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototipo_funcional/calcular.dart';
import 'package:flutter/services.dart';
import 'calcularAmbos.dart';
import 'calcularEolico.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaPrincipal(title: 'Flutter Demo Home Page'),
    );
  }
}
class PantallaPrincipal  extends StatelessWidget{
  PantallaPrincipal({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF23036A),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(15)),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _Texto1(),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              // ignore: deprecated_member_use
              child: new RaisedButton(
                child: const _BotonSolar(),
                //color: Colors.red,
                  color: Colors.white.withOpacity(0),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => calcular()),
                    );
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _Texto2(),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              // ignore: deprecated_member_use
              child: new RaisedButton(
                  child: const _BotonEolico(),
                  color: Colors.white.withOpacity(0),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => calcularEolico()),
                    );
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _Texto3(),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              // ignore: deprecated_member_use
              child: new RaisedButton(
                  child: _Ambos(),
                  color: Colors.white.withOpacity(0),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => calcularAmbos()),
                    );
                  }
              ),
            ),
          ],
          ),
        ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Boton Pulsado'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

class _BotonSolar extends StatelessWidget {
  const _BotonSolar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
          image: AssetImage(
              'images/solar.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            // color: Colors.grey.withOpacity(0.16),
            offset: Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }

}

class _BotonEolico extends StatelessWidget {
  const _BotonEolico({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
          image: AssetImage(
              'images/eolico.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            // color: Colors.grey.withOpacity(0.16),
            offset: Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }
}

class _Ambos extends StatelessWidget {
  const _Ambos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
          image: AssetImage(
              'images/ambos.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            //color: Colors.grey.withOpacity(0.16),
            offset: Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }
}






class _Texto1 extends StatelessWidget {
  const _Texto1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393.0,
      height: 41.5,
      child: Text(
        'CALCULAR GENERADOR FOTOVOLTAICO',
        style: GoogleFonts.roboto(
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Texto2 extends StatelessWidget {
  const _Texto2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393.0,
      height: 34.5,
      child: Text(
        'CALCULAR GENERADOR EOLICO',
        style: GoogleFonts.roboto(
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Texto3 extends StatelessWidget {
  const _Texto3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'CALCULAR GENERADOR HIBRIDO\nEOLICO/FOTOVOLTAICO',
      style: GoogleFonts.roboto(
        fontSize: 15.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}