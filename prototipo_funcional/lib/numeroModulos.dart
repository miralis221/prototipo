import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'calcular.dart';
import 'main.dart';
import 'mobile.dart';

class numeroModulos extends StatelessWidget {
  const numeroModulos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Generación estimada"),
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: MiEstado(),
    );
  }
}

class MiEstado extends StatefulWidget {
  const MiEstado({Key key}) : super(key: key);

  @override
  MiEstadoState createState() {
    return MiEstadoState();
  }
}

class MiEstadoState extends State<MiEstado> {
  String dropdownValue ;
  int nModulos;
  double consumo_real = (dato.k_w_h/0.9)*1000;
  final controlador = TextEditingController();
  final controlador2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(25)),
        Text("Consumo Real Estimado",
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'roboto',
          fontWeight: FontWeight.bold,
        ),
        ),
        Align(alignment: Alignment.center,),
        Text(
          consumo_real.truncate().toString()+" "+"wh/dia",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'roboto',
            //fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.all(25)),
        SizedBox(
          child: DropdownButton<String>(
            //isExpanded: true,
            hint: Text("Potencia Modulos",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.bold
              ),
            ),
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            //iconSize: 24,
            //elevation: 16,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
            ),
            underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                nModulos = ((consumo_real)/(dato.H_S_P*0.9*double.parse(dropdownValue))).truncate();
                controlador.text = nModulos.toString();
                controlador2.text = ((nModulos*12*double.parse(dropdownValue))/1000).toString()+" "+"kWh/dia";
              });
            },
            items: <String>['150','200','250','300','350']
                .map<DropdownMenuItem<String>>
              ((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Padding(padding: EdgeInsets.all(25)),
        Text("Numero de modulos necesarios",
        style: TextStyle(
          fontFamily: 'roboto',
          fontSize: 25,
        ),
        ),
        TextField(
          textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            controller: controlador,
        ),
        Padding(padding: EdgeInsets.all(15)),
        Text("El sistema generara",
        ),
        TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          controller: controlador2,
        ),
        Padding(padding: EdgeInsets.all(35)),
        Padding(padding: EdgeInsets.all(35)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
            icon: Icon(
              Icons.home,
              size: 50,
            ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PantallaPrincipal())
                  );
                }
            ),
            ElevatedButton(
              child: Text('Generar Informe'),
              onPressed: _createPDF,
            )
          ],
        ),
      ],
    );
  }
  Future<void>_createPDF() async{
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Se ha generado un informe"),
    ));
    page.graphics.drawString('El consumo real de la vivienda sera:'
        +consumo_real.truncate().toString()+" "+"wh/dia"+'\n'
        +'El sistema generara:'+' '+controlador2.text+'\n'
        +'El número de modulos nesesario es de: '+controlador.text
        +'\n\n'
        +'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            '\n Cras eleifend tincidunt felis. '
            '\nQuisque quis felis scelerisque, iaculis nibh nec, aliquam velit. '
            '\nPellentesque nulla odio, ullamcorper id posuere in,'
            '\n tempus ac quam.'
            '\n Suspendisse potenti. Etiam id massa aliquam, \naliquam dolor et, volutpat neque. '
            '\nIn sit amet laoreet ligula. Donec vitae elit at \nrisus euismod tempus id vehicula enim. '
            '\nProin ultricies eros at sapien dictum molestie. \nMaecenas malesuada, nibh vel finibus ullamcorper, '
            '\nest dui faucibus leo, vitae tristique enim nisl ut mi.\n Nunc nec fermentum felis.'
            '\n Morbi sed nibh a ante pharetra pellentesque vel \ninterdum tortor.'
            '\n Praesent at luctus dui. Curabitur id malesuada dui,\n sed venenatis quam.',
        PdfStandardFont(PdfFontFamily.helvetica, 20));

    page.graphics.drawImage(
        PdfBitmap(await _readImageData("curva_solar.jpg")),
        Rect.fromLTWH(10, 500, 340, 250));

    List<int> bytes = document.save();
    document.dispose();
    
    saveAndLaunchFile(bytes, 'Output.pdf');
  }
  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('images/$name');
    return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
  }
}
