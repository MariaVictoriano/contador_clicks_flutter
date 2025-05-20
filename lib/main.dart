import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ContadorClicksApp());
}

class ContadorClicksApp extends StatelessWidget {
  const ContadorClicksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Clicks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.antonTextTheme(),

      ),
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
      backgroundColor: const Color(0xFFFDF4FF),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
      body: Column(
        children: [
          // Encabezado morado
          Container(
            width: double.infinity,
            color: Colors.purple,
            padding: const EdgeInsets.only(top: 65, bottom: 20),
            child: Center(
              child: Text(
                'Contador de Clicks',
                style: GoogleFonts.lobster(
                  color: Colors.white,
                  fontSize: 30,
                 
                ),
              ),
            ),
          ),

          
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 249, 245),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_contador',
                      style:GoogleFonts.lobster(
                        fontSize: 100,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      'Click${_contador == 1 ? '' : 's'}',
                      style: GoogleFonts.lobster(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                icon: Icons.remove,
                onPressed: _disminuir,
                backgroundColor: const Color(0xB8DE7EF7)),
            const SizedBox(width: 10),
            CustomButton(
              icon: Icons.refresh,
              onPressed: _reiniciar,
              backgroundColor: const Color(0xB8DE7EF7),
            ),
            const SizedBox(width: 10),
            CustomButton(
              icon: Icons.add,
              onPressed: _incrementar,
              backgroundColor: const Color(0xB8DE7EF7),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? hoverColor;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = const Color(0xB8DE7EF7),
    this.hoverColor = const Color.fromARGB(255, 255, 77, 246),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,  
      height: 60, 
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        hoverColor: hoverColor,
        child: Icon(icon, size: 36, color: Colors.white),
      ),
    );
  }
}

