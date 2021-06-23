import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototipo_funcional/main.dart';
import 'package:prototipo_funcional/numeroModulos.dart';

import 'DatosInstalacion.dart';

Data dato = new Data(0,0);

class calcular extends StatelessWidget {
  const calcular({Key key}) : super(key: key);
  final appTitle = 'Generador Fotovoltaico';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appTitle),
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
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  String dropdownValue;
  double dropdownValue2;
  double consumo;
  final txtResultado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 120),
        ),
        Text("Selecciona la ubicación"),
        Align(alignment: Alignment.center),
        Padding(padding: EdgeInsets.only(top: 10,right:20,left: 20),
        ),
        SizedBox(
          width: 250,
          height: 50,
          child: DropdownButton<String>(
            isExpanded: true,
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
        Padding(padding: EdgeInsets.only(top: 120),
        ),
        Text("Uso de la Instalación"),
        Padding(padding: EdgeInsets.only(top: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Uso Continuo"),
            Text("Uso Temporal"),
          ],
        ),
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
        Padding(padding: EdgeInsets.only(top: 120),
        ),
        Text(
            "Consumo a abastecer en kW/h"
        ),
        DropdownButton<double>(
          //isExpanded: true,
          hint: Text("Consumo a abastecer",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          value: dropdownValue2,
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
              dropdownValue2 = newValue;

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
            else if(dropdownValue2 == null){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("No se ha seleccionado el consumo"),
              ));
            }
            else {
              //dato.H_S_P = consumo;
              dato.k_w_h = dropdownValue2;
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => numeroModulos()),
              );
            }
            }
            ),
      ],
    );
  }
}

class botonAnual extends StatelessWidget {
  const botonAnual({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.0,
      height: 68.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 65.0,
            height: 68.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33.0),
              color: const Color(0xFF35C035),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          Text(
            'Anual',
            style: GoogleFonts.roboto(
              fontSize: 15.0,
              //color: AppColors.color4,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class botonInvierno extends StatelessWidget {
  const botonInvierno({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0,
      height: 68.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 65.0,
            height: 68.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33.0),
              color: const Color(0xFF7CACE2),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          Text(
            'Invierno',
            style: GoogleFonts.roboto(
              fontSize: 10.0,
              //color: AppColors.color4,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class botonVerano extends StatelessWidget {
  const botonVerano({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0,
      height: 68.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 65.0,
            height: 68.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33.0),
              color: const Color(0xFFF0C543),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          Text(
            'Verano',
            style: GoogleFonts.roboto(
              fontSize: 15.0,
              //color: AppColors.color4,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

