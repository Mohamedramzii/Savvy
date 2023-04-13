import 'package:flutter/material.dart';
import 'package:xstore_cubit/features/products/presentation/views/home_products_view/home_layout.dart';

class RootRoute extends MaterialPageRoute {
  RootRoute() : super(builder: (context) => const HomeLayout());
}