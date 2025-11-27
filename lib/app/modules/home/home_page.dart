import 'package:carousel_slider/carousel_slider.dart';
import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = AppRoutes.home;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white900,
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Hello'),
          subtitle: Text('Dustin Styles'),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/img/moto1.png'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: CarouselSlider(
                items: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.teal,
                      image: const DecorationImage(
                        image: AssetImage('assets/img/moto1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('OLA S1X'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.teal,
                      image: const DecorationImage(
                        image: AssetImage('assets/img/moto2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('OLA S2X'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.teal,
                      image: const DecorationImage(
                        image: AssetImage('assets/img/moto3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('OLA S3X'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.teal,
                      image: const DecorationImage(
                        image: AssetImage('assets/img/moto4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('OLA S4X'),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  padEnds: true,
                  animateToClosest: true,
                  height: 400.0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {},
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: context.black500, width: 1),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Text('0.0 KM'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: context.black500, width: 1),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Text('84.2 KM'),
                    ),
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
