import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(PrimeraOpcionFinal());

class PrimeraOpcionFinal extends StatelessWidget {
  const PrimeraOpcionFinal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Primera Opcion Final",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

final TextEditingController val = new TextEditingController();
//Creando variables controladoras"Controller" para que cuando escriba se guarde automaticamente ahi
//final TextEditingController val1 = new TextEditingController();

class _InicioState extends State<Inicio> {
  String v = "Respuesta";
  //String valor;

  void escribir(String hola) {
    setState(() {
      v = hola.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Primera Opcion Final",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: Column(
          children: [
            //Donde ingresamos el numero
            TextFormField(
              //porque es un TextEditingController val = new TextEditingController();
              controller: val,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              //Apartir de aqui ya no es necesario
              decoration: InputDecoration(
                hintText: "Ingesar Numero",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38)),
              ),
            ),

            //BOTON
            FlatButton(
              onPressed: () {
                funcionNumero(val.text);
              },
              child: Text(
                "Conseguir Respuesta",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              color: Colors.black38,
            ),
            Text(
              '$v', //apartir de ahora no es necesario
              style: TextStyle(color: Colors.black54, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

//Esta parte se trata de como conseguimos la respuesta
  Future<void> funcionNumero(String numeroController) async {
    final link =
        'https://opcion1final20201211101752.azurewebsites.net/api/operacion?numero=$numeroController';
    //https://sumar20201208225450.azurewebsites.net/
    //En esta parte estan consumiendo la app
    print(link);
    final response = await http.get(link, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    //Ya esta con la respuesta
    var jsonResponse = json.decode(response.body);
    var text = jsonResponse;
    //print("comienza");
    //print(text);
    escribir(text);
    //Con esta funcion es que imprimimos la respuesta(en muy necesaria)
    // v = text.toString();
    //print("termina");
    //sobreescribir(jsonResponse);
  }
}
