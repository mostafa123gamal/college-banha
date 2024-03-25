// Page2.dart
/*import 'package:flutter/material.dart';
import 'package:college_banha_app/Models/LevelsModel.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a list of LevelItem instances
    List<LevelItem> levelItems = [
      LevelItem(
        header: 'Header 1',
        body: 'لفصل الدراسي الأول : مدخل إلى العلوم التربوية ,المناهج وتنظيماتها,   القضايا المجتمعية  ,إنتاج الرسومات التعليمية , مقدمة حاسبات  , مقدمة فى البرمجة, أجهزة العرض التعليمة ,             الفصل الدراسى الثاني: مدخل إ لى العلوم النفسية   , طرق تدريس عامة ,إنتاج الصور الفوتوغرافية ,الإذاعة والتسجيلات الصوتية  , البرمجة  (1)  , مقدمة فى التعليم الإلكتروني ,مقدمة فى مراكز مصادر التعليم ',
        pictureUrl: 'assets/image/mostafa4.jpeg',
        color: Colors.blue,
      ),
      LevelItem(
        header: 'Header 2',
        body: 'لفصل الدراسي الأول : مدخل إلى العلوم التربوية ,المناهج وتنظيماتها,   القضايا المجتمعية  ,إنتاج الرسومات التعليمية , مقدمة حاسبات  , مقدمة فى البرمجة, أجهزة العرض التعليمة ,             الفصل الدراسى الثاني: مدخل إ لى العلوم النفسية   , طرق تدريس عامة ,إنتاج الصور الفوتوغرافية ,الإذاعة والتسجيلات الصوتية  , البرمجة  (1)  , مقدمة فى التعليم الإلكتروني ,مقدمة فى مراكز مصادر التعليم ',
        pictureUrl: 'assets/image/mostafa4.jpeg',
        color: Colors.green,
      ),
      // Add more LevelItem instances as needed
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black87,
        title: Row(
          children: [
            const Text('الرئيسية'),
            const Spacer(),
            Image.asset(
              'assets/image/preview.jpg',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8), // Adjust the spacing between the images
            Image.asset(
              'assets/image/preview.jpg',
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: levelItems.length,
        itemBuilder: (BuildContext context, int index) {
          // Retrieve each LevelItem from the list
          LevelItem levelItem = levelItems[index];
          return ListTile(
            title: Text(levelItem.header),
            subtitle: Text(levelItem.body),
            leading: CircleAvatar(
              backgroundColor: levelItem.color,
              backgroundImage: NetworkImage(levelItem.pictureUrl),
            ),
            onTap: () {
              // Add your onTap functionality here
            },
          );
        },
      ),
    );
  }
}

*/


import 'package:flutter/material.dart';
import 'package:college_banha_app/Models/LevelsModel.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assuming 'item' is a list of LevelItem instances
    List<LevelItem> item = [
      LevelItem(
        header: 'Header 1',
        body: 'لفصل الدراسي الأول : مدخل إلى العلوم التربوية ,المناهج وتنظيماتها,   القضايا المجتمعية  ,إنتاج الرسومات التعليمية , مقدمة حاسبات',
        pictureUrl: 'assets/image/mostafa4.jpeg',
        color: Colors.blue,
      ),
      LevelItem(
        header: 'Header 2',
        body: 'لفصل الدراسي الأول : مدخل إلى العلوم التربوية ,المناهج وتنظيماتها,   القضايا المجتمعية  ,إنتاج الرسومات التعليمية , مقدمة حاسبات',
        pictureUrl: 'assets/image/mostafa4.jpeg',
        color: Colors.green,
      ),
      // Add more LevelItem instances as needed
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black87,
        title: Row(
          children: [
            const Text('الرئيسية'),
            const Spacer(),
            Image.asset(
              'assets/image/preview.jpg',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8), // Adjust the spacing between the images
            Image.asset(
              'assets/image/preview.jpg',
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: item.map((item) => ExpansionPanelRadio(
            canTapOnHeader: true,
            value: item.header,
            headerBuilder: (context, isExpanded) => ListTile(
              title: Text(
                item.header,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            body: ListTile(
              title: Text(
                item.body,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }
}
