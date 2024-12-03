import 'package:flutter/material.dart';
import '../logica/logica_intervalo_numeros.dart';

class PantallaIntervalo extends StatefulWidget {
  @override
  _PantallaIntervaloState createState() => _PantallaIntervaloState();
}

class _PantallaIntervaloState extends State<PantallaIntervalo> {
  final TextEditingController controladorNum1 = TextEditingController();
  final TextEditingController controladorNum2 = TextEditingController();
  List<int> numeros = [];
  String mensajeError = '';

  void calcularIntervalo() {
  final num1 = int.tryParse(controladorNum1.text);
  final num2 = int.tryParse(controladorNum2.text);

  if (num1 != null && num2 != null) {
    if (num1 == num2) {
      setState(() {
        numeros = []; 
        mensajeError = 'Ambos números son iguales. Por favor, ingrese números diferentes.';
      });
    } else {
      setState(() {
        numeros = obtenerNumerosEnIntervalo(num1, num2);
        mensajeError = ''; 
      });
    }
  } else {
    setState(() {
      numeros = []; 
      mensajeError = 'Por favor, ingrese números válidos.';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Intervalo de Números',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Introduce dos números:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controladorNum1,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Primer número',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controladorNum2,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Segundo número',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: calcularIntervalo,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Calcular Intervalo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (mensajeError.isNotEmpty)
              Center(
                child: Text(
                  mensajeError,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            if (numeros.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: numeros.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${numeros[index]}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[400],
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  
                  Navigator.pop(context);
                },
                child: Text(
                  'Regresar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
