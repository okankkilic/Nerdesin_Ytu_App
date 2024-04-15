import 'package:flutter/material.dart';

import '../new_components/add_lesson_card.dart';

class AddLessonPage extends StatefulWidget {
  const AddLessonPage({super.key});

  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}

List lessons = [
  //Pazartesi
  'Analiz 4',
  'Reel Analiz',
  'Lineer Cebir 2',
  'Oyunlar Teorisi',
  'İleri İngilizce 2',
  'Hilbert',
  'Sistem Analizi', //6
  //Salı
  'Dif Geo 2',
  'Cebir 2',
  'Kısmi Dif Denklemler',
  'İntegral Denk Giriş', //10
  //Çarşamba
  'Olasılık ve İstatistik',
  'Analiz 4', //12
  //Perşembe
  'Kısmi Dif Denklemler',
  'Reel Analiz',
  'Graf Teoriye Giriş',
  'Sistem Analizi',
  'Lineer Cebir 2', //17
  //Cuma
  'Analiz 4',
  'Finans ve Yön Mat',
  'Cebir 2',
  'Sayısal Analiz 2',
  'Sigorta Matematiği', //22
];
List days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

class _AddLessonPageState extends State<AddLessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Ders Ekle'),
          backgroundColor: const Color(0xFF231F62),
          //backgroundColor: Colors.indigo[500],
          centerTitle: true,
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
                    for (int i = 0; i < 7; i++)
                      AddLessonCard(
                        title: lessons[i],
                        day: days[0],
                      ),
                    for (int i = 7; i < 11; i++)
                      AddLessonCard(
                        title: lessons[i],
                        day: days[1],
                      ),
                    for (int i = 11; i < 13; i++)
                      AddLessonCard(
                        title: lessons[i],
                        day: days[2],
                      ),
                    for (int i = 13; i < 18; i++)
                      AddLessonCard(
                        title: lessons[i],
                        day: days[3],
                      ),
                    for (int i = 18; i < 23; i++)
                      AddLessonCard(
                        title: lessons[i],
                        day: days[4],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
