//import 'dart:html';

import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';

import 'DatosInstalacion.dart';
import 'main.dart';
import 'mobile.dart';

Data datos = new Data(0,0);
Eolico gen = new Eolico();

List<double> wSpeed = [3.2,3.5,3.7,3.9,4.1,4.3,4.5,4.7,8.2,9.5,6.3,7.5];
List<double> aero = [1000,1250,1500,1750,2000,2250,2500,2750,3000];
// ignore: camel_case_types
class calcularEolico extends StatelessWidget {
  const calcularEolico({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calcular Eolico"),
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PantallaPrincipal())
              );
            },
          ),
        ],
      ),
      body: MiGenerador(),
    );
  }
}

class MiGenerador extends StatefulWidget {
  const MiGenerador({Key key}) : super(key: key);

  @override
  MiGeneradorState createState() {
    return MiGeneradorState();
  }
}

class MiGeneradorState extends State<MiGenerador>{
  String dropDownValue;
  double dropDownValue2;
  int dropDownValue3;
  @override
  Widget build(BuildContext context) {
    return Column(
     // crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 40)),

        Center(
          child: DropdownButton<String>(
            //isExpanded: true,
            hint: Text("Ubicación",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            dropdownColor: Colors.white,

            value: dropDownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
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
                dropDownValue = newValue;
              });
            },
            items: <String>[' ','Salamanca','Isora','VillaVerde','Madrid'
              ,'Malaga','S/C Tenerife','Las Palmas','Bilbao','Barcelona']
                .map<DropdownMenuItem<String>>
              ((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),


        Padding(padding: EdgeInsets.all(20)),
          Center(
            child: DropdownButton<double>(
              //isExpanded: true,
              hint: Text("Consumo a abastecer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: dropDownValue2,
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
              onChanged: (double newValue) {
                setState(() {
                  dropDownValue2 = newValue;
                });
              },
              items: <double>[1.15,2.3,3.45,4.6,
                5.75,6.9,8.05,9.2,10.35,11.5,14.49]
                  .map<DropdownMenuItem<double>>
                ((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),

          Padding(padding: EdgeInsets.all(20)),
          Center(
            child: DropdownButton<int>(
              //isExpanded: true,
              hint: Text("Altura del aerogenerador",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: dropDownValue3,
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
              onChanged: (int newValue) {
                setState(() {
                  dropDownValue3 = newValue;
                });
              },
              items: <int>[15,20,25,30,35,40]
                  .map<DropdownMenuItem<int>>
                ((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
          TextButton(
              child: Container(
                alignment: Alignment(0.02,0.0),
                width: 165.0,
                height: 61,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31),
                  color: Colors.deepPurpleAccent,
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Text(
                  'Calcular',
                  style: GoogleFonts.roboto(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onPressed: (){
                if(dropDownValue2 == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("No se ha seleccionado el consumo a abastecer"),
                    ));
                }
                else if(dropDownValue3 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("No se ha seleccionado la altura"),
                  ));
                }
                else{
                  gen.consumo = dropDownValue2;
                  gen.altura = dropDownValue3;
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> CalcularScreen()),
                  );
                }
              }
          ),
      ],
    );
  }
}


class CalcularScreen extends StatelessWidget {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PantallaPrincipal())
              );
            },
          ),
        ],
      ),
      body: MyEolicGenForm(),
    );
  }
}


class MyEolicGenForm extends StatefulWidget {
  const MyEolicGenForm({Key key}) : super(key: key);

  @override
  MyEolicGenFormState createState() {
    return MyEolicGenFormState();
  }
}

class MyEolicGenFormState extends State<MyEolicGenForm> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Center(
          child: Text(
            "Altura seleccionada:"+" "+gen.altura.toString(),
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'roboto',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(20)),
        Center(
          child: Text(
            "Consumo real a abastecer:"+" "+((gen.consumo/0.9)*1000).truncateToDouble().toString()
            +" "+"Wh/dia",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'roboto',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(20)),
        Center(
          child: Text(
            "Velocidad del viento en la ubicacion y altura:"+ " "+
            wSpeed[Random().nextInt(11)].toString()+
            " "+ "m/s",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'roboto',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(20)),
        Center(
          child: Text(
            "Generación estimada:"+" "+
                (aero[Random().nextInt(9)]*24).toString()
            +" "+"wh/día",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'roboto',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(20)),
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

    page.graphics.drawString(
        "Altura del aerogenerador:"+" "+gen.altura.toString()+
        "\n"+"Consumo a abastecer:"+" "
        +((gen.consumo/0.9)*1000).truncateToDouble().toString()
        +"\n"+"Velocidad del viento en la ubicacion y altura:"+ " "+
        wSpeed[Random().nextInt(12)].toString()+
        " "+ "m/s"
        +"\nGeneración estimada:"+" "+
        (aero[Random().nextInt(9)]*24).toString()
        +" "+"wh/día"
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
        PdfBitmap(await _readImageData('curva.jpg')),
        Rect.fromLTWH(50, 520, 340, 250));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('images/$name');
    return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
  }
}

