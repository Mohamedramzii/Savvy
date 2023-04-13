import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/Auth/presentation/views/widgets/custom_Toast_Widget.dart';

class NoInternetConnectWIdget extends StatelessWidget {
  const NoInternetConnectWIdget({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomToastWidget.getToast(text: 'No Internet', color: Colors.red);
    // return Scaffold(
    //   body: Stack(
    //     // mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Center(
    //         child: Container(
    //           width: 280.w,
    //           height: 140.h,
    //           padding: const EdgeInsets.all(12),
    //           alignment: Alignment.center,
    //           decoration: BoxDecoration(
    //               color: Colors.grey,
    //               shape: BoxShape.rectangle,
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Text(
    //             'No internet connection, \nPlease check your internet \nconnection!',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontSize: 20.sp,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         top: 220.h,
    //         left: 144.w,
    //         child: Container(
    //           padding: const EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //               shape: BoxShape.circle, color: Colors.grey.shade300),
    //           child: const Icon(Icons.wifi_off_outlined,
    //               color: Colors.red, size: 60),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
