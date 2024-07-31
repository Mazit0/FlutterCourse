class Game {
  final String name;
  final String studio;
  final String pic;
  final dynamic rate;

  const Game(
      {required this.name,
      this.studio = "Desconocido",
      required this.pic,
      this.rate = "No valorado"});
}

final games = [
  const Game(name: "FFVII", pic: "https://upload.wikimedia.org/wikipedia/en/c/c2/Final_Fantasy_VII_Box_Art.jpg"),
  const Game(name: "Red Dead Redemption 2", studio: "Rockstar", pic: "https://upload.wikimedia.org/wikipedia/commons/2/22/Red_Dead_Redemption_2_Logo.png", rate: 9.5),
  const Game(name: "The Witcher 3", studio: "CD Projekt", pic:"https://p325k7wa.twic.pics/high/the-witcher/the-witcher-3-wild-hunt/00-page-setup/tw3-new-logo.png?twic=v1/resize=720/step=10/quality=80", rate: 9),
  const Game(name: "Sonic", studio: "Sega", pic: "https://uvejuegos.com/img/caratulas/1977/Sonic-the-Hedgehog-MD-EU.jpg")];