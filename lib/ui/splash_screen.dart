import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajin_app/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.visitChildElements((element) {
        Future.delayed((const Duration(seconds: 2)), () {
          Get.to(() => const HabitsListScreen());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
