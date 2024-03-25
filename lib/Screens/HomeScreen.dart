import 'package:college_banha_app/Screens/page2.dart';
import 'package:college_banha_app/Screens/page3.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:college_banha_app/AuthPages/logInPage.dart';
import 'package:college_banha_app/FireBase/Authclass.dart';



import 'page1.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> image = [
    Image.asset('assets/image/mostafa1.jpeg'),
    Image.asset('assets/image/mostafa2.jpeg'),
    Image.asset('assets/image/mostafa3.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () async {
              await Auth().signOut();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'تسجيل الخروج',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
              ),
              items: image,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page1()),
                      );
                    },
                    child: Text(' نبذة'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 36, 197, 77)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page2()),
                      );
                    },
                    child: Text('شئون الطلاب '),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 47, 53, 220)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page3()),
                      );
                    },
                    child: Text('الائحة'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
