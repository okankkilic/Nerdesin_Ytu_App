import 'package:flutter/material.dart';
import 'package:nerdesin_ytu/new_components/url_card.dart';

class UrlPage extends StatefulWidget {
  const UrlPage({super.key});

  @override
  State<UrlPage> createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Linkler'),
        backgroundColor: const Color(0xFF231F62),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                UrlCard(
                  title: '41 AT Saatleri',
                  //link:
                  //  'https://iett.istanbul/RouteDetail?hkod=41AT&routename=AYAZA%C4%9EA%20-%20DAVUTPA%C5%9EA%20Y.T.%C3%9C',
                ),
                UrlCard(
                  title: 'Ring Saatleri',
                  //link: 'google.com',
                ),
                UrlCard(
                  title: 'Yemek Listesi',
                  //link: 'https://google.com',
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
