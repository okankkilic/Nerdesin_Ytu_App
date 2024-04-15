import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../components/nerdesin_card.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Nerdesin'),
          backgroundColor: const Color(0xFF231F62),
          //backgroundColor: Colors.indigo[500],
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical, //sonradan
                  shrinkWrap: true, //sonradan eklendi
                  children: [
                    NerdesinCard(
                      title: 'Büyük Ev',
                      icon: Ionicons.cafe_outline,
                    ),
                    NerdesinCard(
                      title: 'Yemekhane',
                      icon: Ionicons.fast_food_outline,
                    ),
                    NerdesinCard(
                      title: 'Kütüphane',
                      icon: Icons.my_library_books_outlined,
                    ),
                    NerdesinCard(
                      title: 'Fakülte',
                      icon: Icons.account_balance_outlined,
                    ),
                    NerdesinCard(
                      title: '8 Bit',
                      icon: Icons.currency_bitcoin,
                    ),
                    NerdesinCard(
                      title: 'Yıldız Kafe',
                      icon: Ionicons.ice_cream_outline,
                    ),
                    NerdesinCard(
                      title: 'A Kapısı',
                      icon: Icons.door_back_door_outlined,
                    ),
                    NerdesinCard(
                      title: 'Orta Bahçe',
                      icon: Ionicons.flower_outline,
                    ),
                    NerdesinCard(
                      title: 'Yeni Kütüphane',
                      icon: Ionicons.library_outline,
                    ),
                    NerdesinCard(
                      title: 'Starbucks',
                      icon: Icons.star_border,
                    ),
                    NerdesinCard(
                      title: 'Ev',
                      icon: Icons.home_outlined,
                    ),
                    NerdesinCard(
                      title: 'Yurt',
                      icon: Icons.home_work_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
