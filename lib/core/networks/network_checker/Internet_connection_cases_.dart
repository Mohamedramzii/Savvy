import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'no_internet_connection_widget.dart';

class InternetConnectionCases extends StatelessWidget {
  const InternetConnectionCases({
    Key? key,
    required this.snapshot,
    required this.widget,
  }) : super(key: key);

  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;

        switch (state) {
          case ConnectivityResult.none:
            return const NoInternetConnectWIdget();
          default:
            return widget;
        }

      default:
        return const NoInternetConnectWIdget();
    }
  }
}