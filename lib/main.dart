import 'package:flutter/material.dart';

void main() {
  runApp(const ContadorClicksApp());
}

class ContadorClicksApp extends StatelessWidget {
  const ContadorClicksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Clicks',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const PaginaContadorClicks(),
    );
  }
}

class PaginaContadorClicks extends StatefulWidget {
  const PaginaContadorClicks({super.key});

  @override
  State<PaginaContadorClicks> createState() => _PaginaContadorClicksState();
}

class _PaginaContadorClicksState extends State<PaginaContadorClicks> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _disminuir() {
    if (_contador > 0) {
      setState(() {
        _contador--;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Clicks'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_contador ${_contador == 1 ? 'clic' : 'clics'}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementar, child: const Text('+')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _disminuir, child: const Text('-')),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _reiniciar,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
