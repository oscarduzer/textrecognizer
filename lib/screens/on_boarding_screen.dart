import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex=0;
  List<dynamic> onboardingData = [
    {
      "title": "Capture instantanée",
      "description": "Prenez une photo pour scanner et reconnaître le texte en un seul geste",
      "image": "assets/presentation_1.jpg"
    },
    {
      "title": "Analyse intelligente",
      "description": "L’IA identifie et structure votre texte avec rapidité et précision",
      "image": "assets/presentation_2.jpg"
    },
    {
      "title": "Historique et partage",
      "description":"Retrouvez et partagez toutes vos transcriptions en un clin d’œil",
      "image": "assets/presentation_3.jpg"
    }
  ];


  _onPageChanged(int index){
      setState(() {
        _currentIndex=index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child:PageView(
                  onPageChanged: _onPageChanged,
                  children: onboardingData.map((data)=>Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 50,
                    children: [
                      Column(
                        spacing: 20,
                        children: [
                          Text(
                            data['title'],
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            data['description'],
                            style: Theme.of(context).textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            border: BoxBorder.fromBorderSide(BorderSide(color: Color(0x0000003A)))
                        ),
                        child: Image.asset(data['image'],width: 300,height: 300,),
                      )
                    ],
                  )).toList(),
                ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index)=>
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _currentIndex==index?Theme.of(context).highlightColor:Color(0x3C494747),
                        ),
                        margin: EdgeInsets.all(5),
                        width: _currentIndex==index?12:10,
                        height: 5,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButtonTheme(
                          data: ElevatedButtonThemeData(
                              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(

                              )
                          ),
                          child: ElevatedButton(
                              onPressed: _currentIndex==onboardingData.length-1?(){
                                Navigator.popAndPushNamed(context, '/home');
                              }:null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Commencer",
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                  Icon(Icons.arrow_right_alt,color: Theme.of(context).primaryColor,)
                                ],
                              )
                          )
                      )
                    ],
                  ),
                )
              ],
              ),
          ],
        ),
      ),
    );
  }
}
