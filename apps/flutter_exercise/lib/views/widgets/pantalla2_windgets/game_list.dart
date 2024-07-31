import 'package:flutter/material.dart';
import 'package:flutter_exercise/game_class.dart';


class GameList extends StatelessWidget {
  // Constructor with default image
  const GameList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      // Ensure the column is centered in its parent
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: games.map((game) => _buildItemGameList(game, 0)).toList(),
                //children: games.map(_buildItemGameList).toList(),
            ),
          ), // Revisar
          _backButton(context), // Create the button using context
        ],
      ),
    );
  }
}

// Function that returns a back button
Widget _backButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: ElevatedButton(
      onPressed: () {
        // Navigate back to the previous screen
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 113, 144, 125),
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      ),
      child: const Text(
        'Regresar a login',
        style: TextStyle(color: Color.fromARGB(255, 23, 57, 25), fontSize: 20),
      ),
    ),
  );
}

// Function that returns a item GameList
Widget _buildItemGameList(Game game, int i) {
  return Column(
    children: [
      ListTile(
        title: Text(game.name),
        subtitle: Text("Estudio: ${game.studio}"),
        leading: CircleAvatar(
          backgroundImage:
              NetworkImage(game.pic), // No matter how big it is, it won't overflow
        ), //trailing: Icon(Icons.),
      ),
      const Divider()
    ],
  );
}

// Function that provide a rate icon
/*Icon _getIconRate(Game game) {
  switch () {
    case :
      return ;
    case :
      return ;
    case :
      return ;
    default:
      return const Icon(null);
  }
}*/

