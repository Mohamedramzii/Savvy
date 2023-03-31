import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'Internet_connection_cases_.dart';

class InternetConnectionCheckerStream extends StatelessWidget {
  InternetConnectionCheckerStream({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;

  Connectivity? connect = Connectivity();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: connect!.onConnectivityChanged,
      builder: (_, snapshot) {
        return InternetConnectionCases(
          snapshot: snapshot,
          widget: widget,
        );
      },
    );
  }
}
