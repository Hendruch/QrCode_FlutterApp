import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

const colorprimario = Color.fromARGB(253, 20, 45, 85);
const colorsecundario = Color.fromARGB(253, 15, 30, 70);
const colorBotones = Color.fromARGB(252, 24, 60, 156);

String qrText = "Hendrick";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Generador qr",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final miControlador = TextEditingController();

  /*@override
  void dispose() {
    // TODO: implement dispose
    miControlador.dispose();
    super.dispose();
  }*/
  /*
  final qrValidationResult = QrValidator.validate(
      data: qrText,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L);

  final qrCode = QrCode(typeNumber, errorCorrectLevel);

  final painter = QrPainter.withQr(
    qr: qrCode,
    color: const Color(0xFF000000),
    gapless: true,
    embeddedImageStyle: null,
    embeddedImage: null,
  );
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Generador Qr"),
          backgroundColor: colorsecundario,
        ),
        backgroundColor: colorprimario,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              QrImage(
                data: '$qrText',
                version: QrVersions.auto,
                size: 250.0,
                backgroundColor: Colors.white,
              ),

              SizedBox(
                height: 20,
              ),
              //campoTexto(miControlador),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Texto/Link",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  controller: miControlador,
                ),
              ),

              SizedBox(
                height: 20,
              ),
              //botonGenerar(miControlador),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(colorBotones),
                        ),
                        onPressed: () {
                          setState(() {
                            qrText = miControlador.text;
                          });
                        },
                        child: Text(
                          "Generar",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    FloatingActionButton(
                      backgroundColor: colorBotones,
                      onPressed: () {
                        //funcion de descargar imagen
                      },
                      child: Icon(Icons.arrow_downward_rounded),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

/*
Widget campoTexto(controlador){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Texto/Link",
        fillColor: Colors.white,
        filled: true,
    ),
    controller: controlador,
    ),
  );
}

Widget botonGenerar(controla){
  return FlatButton(
    color: Colors.deepPurple,
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    onPressed: (){
      //qrText = controla.text;
    },
    child: Text("Generar", style: TextStyle(color: Colors.white, fontSize: 20.0),)
  );
}
*/

