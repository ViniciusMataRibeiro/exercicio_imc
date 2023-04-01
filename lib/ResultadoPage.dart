import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({
    super.key,
    this.result,
    required this.valorIMC,
  });
  final String? result;
  final String valorIMC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Resultado do Calculo'),
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
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.all(10),
              child: Text(
                'Seu IMC é: $valorIMC',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Descriçao:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(8),
              child: Text(
                result.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
