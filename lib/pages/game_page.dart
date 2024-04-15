import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nerdesin_ytu/games/dino/main.dart';
import 'package:nerdesin_ytu/games/new2048/main.dart';

import '../components/profile_cards.dart';
import '../games/2048/main.dart';
import '../games/black_jake/view/bj_game.dart';
import '../games/high_score_list.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Oyunlar'),
          backgroundColor: const Color(0xFF231F62),
          centerTitle: true,
          //automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                ProfileCard(
                  title: '21',
                  icon: Ionicons.cash_outline,
                  widget: const BlackJackGame(),
                ),
                ProfileCard(
                  title: '2048',
                  icon: Ionicons.extension_puzzle_outline,
                  widget: MyPuzzleApp(),
                ),
                ProfileCard(
                  title: 'Dino',
                  icon: Ionicons.wine_outline,
                  widget: const MyDino(),
                ),
                ProfileCard(
                  title: 'new2048',
                  icon: Ionicons.wine_outline,
                  widget: const New2048(),
                ),
                ProfileCard(
                  title: 'Leaderboard',
                  icon: Ionicons.wine_outline,
                  widget: const HighScoreList(),
                ),
              ],
            ))
          ],
        ));
  }
}
