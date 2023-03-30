// abstract class NetworkInfo {
//   Future<bool> get isConnected;
// }

// class NetworkInfoImpl implements NetworkInfo {
//   final InternetConnectionChecker internetConnectionChecker;
//   NetworkInfoImpl({
//     required this.internetConnectionChecker,
//   });
//   @override
//   Future<bool> get isConnected => internetConnectionChecker.hasConnection;
// }

// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xstore_cubit/features/auth/presentation/views/widgets/custom_Toast_Widget.dart';

CheckInternet() async {
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (e) {
    CustomToastWidget.getToast(
        text: 'No Internet Connection', color: Colors.red);
    return false;
  }
}
