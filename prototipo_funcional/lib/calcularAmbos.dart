import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'calcular.dart';
import 'calcularEolico.dart';
import 'main.dart';
import 'mobile.dart';

class calcularAmbos extends StatelessWidget {
  const calcularAmbos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calcular Hibrido"),
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
      body: MiGeneradorH(),
    );
  }
}

class MiGeneradorH extends StatefulWidget {
  const MiGeneradorH({Key key}) : super(key: key);

  @override
  MiGeneradorHState createState() {
    return MiGeneradorHState();
  }
}

class MiGeneradorHState extends State<MiGeneradorH>{
  String dropDownValue;
  double dropDownValue2;
  int dropDownValue3;
  String dropdownValue;
  double dropdownValue2;
  double consumo;
  final txtResultado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 50)),
        Text("Selecciona la ubicación"),
        Center(
          child: DropdownButton<String>(
            //isExpanded: true,
            hint: Text("Ubicación",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: new FloatingActionButton(
                heroTag: 'anual',
                child: botonAnual(),
                onPressed: (){
                  if(dropdownValue == "Salamanca"){
                    txtResultado.text = "4.1";
                  }
                  else if(dropdownValue == "Isora"){
                    //consumo = 4.35;
                    txtResultado.text = "4.35";
                  }
                  else if(dropdownValue == "VillaVerde"){
                    //consumo = 4.5;
                    txtResultado.text = "4.5";
                  }
                  else if(dropdownValue == "Madrid"){
                    //consumo = 4.35;
                    txtResultado.text = "4.25";

                  }
                  else if(dropdownValue == "Malaga"){
                    //consumo = 4.5;
                    txtResultado.text = "4.6";
                  }
                  else if(dropdownValue == "S/C Tenerife"){
                    //consumo = 4.35;
                    txtResultado.text = "4.75";
                  }
                  else if(dropdownValue == "Las Palmas"){
                    //consumo = 4.5;
                    txtResultado.text = "4.55";
                  }else if(dropdownValue == "Bilbao"){
                    //consumo = 4.35;
                    txtResultado.text = "4.05";
                  }
                  else if(dropdownValue == "Barcelona"){
                    //consumo = 4.5;
                    txtResultado.text = "4.45";
                  }
                  else
                    //consumo = 0;
                    txtResultado.text = "";
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: new FloatingActionButton(
                heroTag: 'invierno',
                child: botonInvierno(),
                onPressed: (){
                  if(dropdownValue == "Salamanca"){
                    //consumo = 2.1;
                    txtResultado.text = "2.1";

                  }
                  else if(dropdownValue == "Isora"){
                    //consumo = 3.35;
                    txtResultado.text = "3.35";

                  }
                  else if(dropdownValue == "VillaVerde"){
                    //consumo = 3.7;
                    txtResultado.text = "3.7";

                  }
                  else if(dropdownValue == "Madrid"){
                    //consumo = 4.35;
                    txtResultado.text = "3.25";

                  }
                  else if(dropdownValue == "Malaga"){
                    //consumo = 4.5;
                    txtResultado.text = "3.6";
                  }
                  else if(dropdownValue == "S/C Tenerife"){
                    //consumo = 4.35;
                    txtResultado.text = "3.75";
                  }
                  else if(dropdownValue == "Las Palmas"){
                    //consumo = 4.5;
                    txtResultado.text = "3.55";
                  }else if(dropdownValue == "Bilbao"){
                    //consumo = 4.35;
                    txtResultado.text = "2.75";
                  }
                  else if(dropdownValue == "Barcelona"){
                    //consumo = 4.5;
                    txtResultado.text = "3.2";
                  }
                  else
                    //consumo = 0;
                    txtResultado.text = "";
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: new FloatingActionButton(
                heroTag: "verano",
                child: botonVerano(),
                onPressed: (){
                  if(dropdownValue == "Salamanca"){
                    //consumo = 5.1;
                    txtResultado.text = "5.1";
                  }
                  else if(dropdownValue == "Isora"){
                    //consumo = 5.35;
                    txtResultado.text = "5.35";
                  }
                  else if(dropdownValue == "VillaVerde"){
                    //consumo = 6.0;
                    txtResultado.text = "6.0";
                  }
                  else if(dropdownValue == "Madrid"){
                    //consumo = 4.35;
                    txtResultado.text = "5.25";

                  }
                  else if(dropdownValue == "Malaga"){
                    //consumo = 4.5;
                    txtResultado.text = "5.6";
                  }
                  else if(dropdownValue == "S/C Tenerife"){
                    //consumo = 4.35;
                    txtResultado.text = "5.75";
                  }
                  else if(dropdownValue == "Las Palmas"){
                    //consumo = 4.5;
                    txtResultado.text = "5.55";
                  }else if(dropdownValue == "Bilbao"){
                    //consumo = 4.35;
                    txtResultado.text = "5.05";
                  }
                  else if(dropdownValue == "Barcelona"){
                    //consumo = 4.5;
                    txtResultado.text = "5.45";
                  }
                  else
                    //consumo = 0;
                    txtResultado.text = "";
                },
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(20)),
        Text("Hora Solar Seleccionada"),
        TextField(
          decoration: new InputDecoration.collapsed(
              hintText: "Hora Solar Pico",
              fillColor: Colors.deepPurpleAccent,
              hintStyle: TextStyle(fontFamily: 'roboto')),
          textInputAction: TextInputAction.none,
          keyboardType: TextInputType.number,
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'roboto',
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
          controller: txtResultado,
        ),

        Padding(padding: EdgeInsets.all(20)),
        Text("Altura"),
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
        Padding(padding: EdgeInsets.all(20)),
        Text("Consumo a abastecer"),
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
              dato.H_S_P = double.parse(txtResultado.text);
              //dato.k_w_h = dropdownValue2;
              if(dato.H_S_P == null){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("No se ha seleccionado el uso de la instalacion"),
                ));
              }
              else if(dropDownValue2 == null){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("No se ha seleccionado el consumo"),
                ));
              }
              else {
                dato.k_w_h = dropDownValue2;
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FinalScreen()),
                );
              }
            }
        ),
      ],
    );
  }
}

class FinalScreen extends StatelessWidget {
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
      body: MyFinalForm(),
    );
  }
}

class MyFinalForm extends StatefulWidget{
  const MyFinalForm({Key key}): super(key: key);

  MyFinalFormState createState(){
    return MyFinalFormState();
  }
}

class MyFinalFormState extends State<MyFinalForm> {

  List<int> generador = [150,200,225,250];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          "Modulos necesarios:"+" "+"5",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'roboto',
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
            "Generador Fotovoltaico:"+" "+(generador[Random().nextInt(3)]*5*12).toString()
            +" Wh/dia",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'roboto',
            ),
        ),

        Padding(padding: EdgeInsets.only(top: 20)),
        Center(
          child: Text(
            "Altura seleccionada:"+" "+gen.altura.toString(),
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'roboto',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
            "Consumo real a abastecer:"+" "+((dato.k_w_h/0.9)*1000).truncateToDouble().toString()
                +" "+"Wh/dia",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'roboto',
            ),
          ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
            "Velocidad del viento en la ubicacion y altura:"+ " "+
                wSpeed[Random().nextInt(5)].toString()+
                " "+ "m/s",
            style: TextStyle(
              fontSize: 22.5,
              fontFamily: 'roboto',
            ),
          ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
            "Generación total estimada:"+" "+
                ((aero[Random().nextInt(9)]*24)+(generador[Random().nextInt(3)]*5*12)).toString()
                +" "+"wh/día",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'roboto',
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
      "Modulos necesarios:"+" "+"5"
          +"\nGenerador Fotovoltaico:"+" "+(generador[Random().nextInt(3)]*5*12).toString()
          +" Wh/dia"
          "\nAltura del aerogenerador:"+" "+gen.altura.toString()+
            "\n"+"Consumo a abastecer:"+" "
            +((gen.consumo/0.9)*1000).truncateToDouble().toString()
            +"\n"+"Velocidad del viento en la ubicacion y altura:"+ " "+
            wSpeed[Random().nextInt(12)].toString()+
            " "+ "m/s"
            +"\nGeneración total estimada:"+" "+
          ((aero[Random().nextInt(9)]*24)+(generador[Random().nextInt(3)]*5*12)).toString()
          +" "+"wh/día"
            +"\n",PdfStandardFont(PdfFontFamily.helvetica, 25));

    page.graphics.drawImage(
        PdfBitmap(await _readImageData('curva.jpg')),
        Rect.fromLTWH(10, 200, 340, 250));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('images/$name');
    return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
  }

}

