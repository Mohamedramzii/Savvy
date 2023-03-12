import 'package:xstore_cubit/core/assets_manager.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });


  static List<OnBoardingModel> dummyList=[
    OnBoardingModel(image: ImagesManager.onBoarding1, title: 'Single Cart', body: 'Collect all your needs in one cart!'),
    OnBoardingModel(image: ImagesManager.onBoarding2, title: 'Many Categories', body: 'Choose all what you want from our categories! '),
    OnBoardingModel(image: ImagesManager.onBoarding3, title: 'Your Time', body: 'Save your time and purchase from Savvy!'),
    
  ];
}


