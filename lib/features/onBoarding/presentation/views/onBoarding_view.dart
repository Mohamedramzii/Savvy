import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xstore_cubit/core/app_managers/app_router.dart';
import 'package:xstore_cubit/core/app_managers/color_manager.dart';
import 'package:xstore_cubit/features/onBoarding/presentation/views/widgets/pageview_item.dart';
import '../../data/models/onBoarding_model.dart';
import 'widgets/floating_Button_widget.dart';
import 'widgets/smooth_indicator_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var controller = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () =>
                  GoRouter.of(context).pushReplacement(Routes.loginview),
              icon: Text(
                'SKIP',
                style: TextStyle(
                    color: ColorsManager.kprimaryColor, fontSize: 15.sp),
              ),
            ),
            SizedBox(width:width * 0.04 ,)
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    if (index == OnBoardingModel.dummyList.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: OnBoardingModel.dummyList.length,
                  itemBuilder: (context, index) {
                    return OnBoardingPageViewItemWidget(
                        data: OnBoardingModel.dummyList[index]);
                  }),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SmoothPageIndicatorWidget(controller: controller),
                  const Spacer(),
                  OnBordingFloatingButtonWidget(
                    controller: controller,
                    isLast: isLast,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
