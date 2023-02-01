import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/main_screen.dart';
import 'package:rock_paper_scissors/utils/game.dart';
import 'package:rock_paper_scissors/widgets/game_button.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {super.key});
  Choice gameChoice;
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    String? playerChoice;
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40.0;
    String? robotChoice = Game.randomChoice();
    String? robotChoicePath = "";

    switch (robotChoice) {
      case "rock":
        robotChoicePath = "content/rock.png";
        break;
      case "paper":
        robotChoicePath = "content/paper.png";
        break;
      case "scissor":
        robotChoicePath = "content/scissor.png";
        break;
      default:
    }

    switch (widget.gameChoice.type) {
      case "rock":
        playerChoice = "content/rock.png";
        break;
      case "paper":
        playerChoice = "content/paper.png";
        break;
      case "scissor":
        playerChoice = "content/scissor.png";
        break;
      default:
    }

    if (Choice.gameRule[widget.gameChoice.type]![robotChoice] == "win") {
      setState(() {
        Game.score++;
      });
    } else if (Choice.gameRule[widget.gameChoice.type]![robotChoice] ==
        "lose") {
      if (Game.score > 0) {
        setState(() {
          Game.score--;
        });
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xff060a47),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 34.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(width: 5.0, color: Colors.white),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SCORE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Game.score}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gameChoice.type}",
                      child: gameButtonWithImage(null, playerChoice, btnWidth),
                    ),
                    const Text(
                      "VS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Hero(
                      tag: "computer",
                      child:
                          gameButtonWithImage(null, robotChoicePath, btnWidth),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "${Choice.gameRule[widget.gameChoice.type]![robotChoice]}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2.0),
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreenApp(),
                    ),
                  );
                },
                padding: const EdgeInsets.all(16.0),
                shape: const StadiumBorder(
                    side: BorderSide(
                  color: Colors.white,
                  width: 5.0,
                )),
                child: const Text(
                  "play again",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {},
                padding: const EdgeInsets.all(16.0),
                shape: const StadiumBorder(
                    side: BorderSide(
                  color: Colors.white,
                  width: 5.0,
                )),
                child: const Text(
                  "RULES",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
