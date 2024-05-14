import 'package:flutter/material.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CAppbar(),
    );
  }
}