import 'package:flutter/material.dart';

import 'ResultadoPage.dart';

void main() {
  runApp(MaterialApp(
    home: const IMC(),
    theme: ThemeData(hintColor: Colors.blue, primaryColor: Colors.white),
  ));
}

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMC();
}

class _IMC extends State<IMC> {
  bool isSelectSim = false;
  bool isSelectNao = false;
  int id = 1;
  String radioButtonItem = 'Feminino';

  var txtAltura = TextEditingController();
  var txtPeso = TextEditingController();
  var txtIdade = TextEditingController();
  var txtSexo = TextEditingController();

  late double altura;
  late double peso;
  late int idade;
  late String sexo;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Calculadora de IMC'),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Container(
                height: 140,
                width: 140,
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/musculo.jpg'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                      ),
                    ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              padding: const EdgeInsets.all(8),
              child: Form(
                child: TextFormField(
                  controller: txtAltura,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 0.9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    labelText: 'Qual a sua altura?',
                    prefixIcon: Icon(Icons.login_rounded, color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: const EdgeInsets.all(8),
              child: Form(
                child: TextFormField(
                  controller: txtPeso,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 0.9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    labelText: 'Qual seu peso?',
                    prefixIcon: Icon(Icons.login_rounded, color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: const EdgeInsets.all(8),
              child: Form(
                child: TextFormField(
                  controller: txtIdade,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 0.9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    labelText: 'Qual sua idade?',
                    prefixIcon: Icon(Icons.login_rounded, color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 50, right: 50),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Qual seu sexo?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                              value: 1,
                              groupValue: id,
                              onChanged: (index) {
                                setState(() {
                                  radioButtonItem = 'feminino';
                                  id = 1;
                                });
                              }),
                          const Text(
                            'Feminino',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                              value: 2,
                              groupValue: id,
                              onChanged: (index) {
                                setState(() {
                                  radioButtonItem = 'masculino';
                                  id = 2;
                                });
                              }),
                          const Text(
                            'Masculino',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () => _calcularIMC(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    side: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: const EdgeInsets.all(8),
              child: const Text(
                'By Vinicius Ribeiro & Gabriel Ribeiro',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _calcularIMC() {
    altura = double.parse(txtAltura.text);
    peso = double.parse(txtPeso.text);
    idade = int.parse(txtIdade.text);
    sexo = radioButtonItem;
    double resultIGC;

    var resultIMC = peso / (altura * altura);
    if (sexo == 'Feminino') {
      resultIGC = (1.2 * resultIMC) + (0.23 * idade) - (10.8 * 0.8) - 5.4;
    } else {
      resultIGC = (1.2 * resultIMC) + (0.23 * idade) - (10.8 * 1.0) - 5.4;
    }

    String resulto = "";

    //os ifs abaixo são para verificar o resultado do IGC e retornar o resultado
    if (resultIMC < 18.5) {
      resulto = "Abaixo do peso";
    } else if (resultIMC >= 18.5 && resultIMC < 24.9) {
      resulto = "Peso normal";
    } else if (resultIMC >= 24.9 && resultIMC < 29.9) {
      resulto = "Sobrepeso";
    } else if (resultIMC >= 29.9 && resultIMC < 34.9) {
      resulto = "Obesidade grau 1";
    } else if (resultIMC >= 34.9 && resultIMC < 39.9) {
      resulto = "Obesidade grau 2";
    } else if (resultIMC >= 40) {
      resulto = "Obesidade grau 3";
    }

    String resultIMCFinal = resultIMC.toStringAsFixed(1);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          result: resulto, valorIMC: resultIMCFinal,
        ),
      ),
    );
  }
}