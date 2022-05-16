// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:assetsproject/pages/welcome_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
                  return CustomBuildImage(carimage: carimages, index: index);
                },
                options: CarouselOptions(height: 400)
            ),
          ],
        )


    );
  }
}

class CustomBuildImage extends StatelessWidget {
  const CustomBuildImage({
    Key? key,
    required this.carimage,
    required this.index,
  }) : super(key: key);

  final String carimage;
  final int index;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        carimage,
        fit: BoxFit.cover,
      )
  );
}


