import 'package:flutter/material.dart';
import 'package:new_shop_app/moduels/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/component/component.dart';
import '../../shared/styles/style.dart';

//////////// CLASS MODEL FOR BOARDING ///////////////
class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

// ignore: must_be_immutable
class BoardingScreen extends StatefulWidget {
   const BoardingScreen({Key? key}) : super(key: key);
  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  bool isLast=false;

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboard_1.jpg',
        title: 'on_boarding TITLE screen 1',
        body: 'on_boarding BODY screen 1'),
    BoardingModel(
        image: 'assets/images/onboard_1.jpg',
        title: 'on_boarding TITLE screen 2',
        body: 'on_boarding BODY screen 3'),
    BoardingModel(
        image: 'assets/images/onboard_1.jpg',
        title: 'on_boarding TITLE screen 3',
        body: 'on_boarding BODY screen 3'),
  ];

  @override
  Widget build(BuildContext context) {
    var boardController = PageController();
    return Scaffold(
      appBar: AppBar(
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: (){navigateAndFinish(context, LoginScreen());},
                child: Text('skipe'.toUpperCase())
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index)
                {
                  if(index==boarding.length-1){
                    // ignore: avoid_print
                    setState(() {
                      isLast=true;
                    });
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    onBoardingItems(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 20.0,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    expansionFactor: 4,
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 5.0,
                    activeDotColor: defaultColor,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: FloatingActionButton(

                      onPressed: () {
                      if(isLast==true)
                      {
                        navigateAndFinish(context, LoginScreen());
                      }else{
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                      },
                      child: const Icon(Icons.arrow_forward_ios,size: 20.0,)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget onBoardingItems(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          '$model.',
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
