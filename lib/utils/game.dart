import 'dart:math';

class Game {
  static int score = 0;
  static List<String> choices = ["rock", "paper", "scissor"];
  static String? randomChoice() {
    Random random = Random();
    int robotChoice = random.nextInt(3);
    return choices[robotChoice];
  }
}

class Choice {
  String? type = "";
  static var gameRule = {
    "rock": {"rock": "draw", "paper": "lose", "scissor": "win"},
    "paper": {"rock": "win", "paper": "draw", "scissor": "lose"},
    "scissor": {"rock": "lose", "paper": "win", "scissor": "draw"},
  };
  Choice(this.type);
}
