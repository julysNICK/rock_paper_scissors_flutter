import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/game_screen.dart';
import 'package:rock_paper_scissors/utils/game.dart';
import 'package:rock_paper_scissors/widgets/game_button.dart';

class MainScreenApp extends StatefulWidget {
  const MainScreenApp({super.key});

  @override
  State<MainScreenApp> createState() => _MainScreenAppState();
}

class _MainScreenAppState extends State<MainScreenApp> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40.0;
    return Scaffold(
      backgroundColor: const Color(0xff060a47),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
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
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 -
                          btnWidth / 2 -
                          20,
                      child: Hero(
                        tag: "scissor",
                        child: gameButtonWithImage(() {
                          print("you clicked on scissor");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  GameScreen(Choice("scissor"))),
                            ),
                          );
                        }, "content/scissor.png", btnWidth),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left: MediaQuery.of(context).size.width / 2 -
                          btnWidth -
                          40.0,
                      child: Hero(
                        tag: "paper",
                        child: gameButtonWithImage(() {
                          print("you clicked on paper");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  GameScreen(Choice("paper"))),
                            ),
                          );
                        }, "content/paper.png", btnWidth),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left: MediaQuery.of(context).size.width / 2 + 3.0,
                      child: Hero(
                        tag: "rock",
                        child: gameButtonWithImage(() {
                          print("you clicked on rock");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  GameScreen(Choice("rock"))),
                            ),
                          );
                        }, "content/rock.png", btnWidth),
                      ),
                    ),
                  ],
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
