import 'package:flutter/material.dart';
import 'package:stat_doctor/core/widgets/app_appbar.dart';

class HomeFilterScreen extends StatelessWidget {
  const HomeFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: Text("Filter")),
    );
  }
}