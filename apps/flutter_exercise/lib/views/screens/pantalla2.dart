import 'package:flutter/material.dart';
import '../widgets/pantalla2_windgets/game_list.dart';


// Create Pantalla2 Screen
class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GameList(),
      backgroundColor:  Color.fromARGB(255, 247, 255, 247),
    );
  }
}