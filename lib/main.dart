
import 'package:flutter_svg/flutter_svg.dart';
import 'package:assetsproject/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Mypage()
    );

  }

}

class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    List images = [
      "https://img.itinari.com/pages/images/original/77a1c40d-7743-4d02-8738-52a9d0427017-logar-valley-naslovna.jpg?ch=DPR&dpr=1&w=1200&h=800&s=5594ffbb2114ebf713b4b8590009333a",
      "https://cdn.ttgitalia.com/media/2015/06/14439_12_medium.jpg",
      "https://img2.goodfon.ru/original/1024x768/5/53/tigr-belyy-tigr-koshka-hischnik.jpg",
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => const WelcomePage());
              Navigator.push(context, route);}
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text('Эта кошечка SVG'),
            const SizedBox(height: 10,),
            SvgPicture.asset("images/cat.svg"),
            const SizedBox(height: 20,),
            const Text('А это карусель с картинками напрямую из интернета'),
            const SizedBox(height: 20,),
            CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex){
                  var carimages = images[index];
                  return buildImage(carimages, index);
                },
                options: CarouselOptions(height: 400)
            ),
          ],
        )


    );
  }
  Widget buildImage(String carimage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        carimage,
        fit: BoxFit.cover,
      )
  );
}
