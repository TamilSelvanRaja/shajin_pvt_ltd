import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajin_app/resources/app_colors.dart';
import 'package:shajin_app/resources/datas.dart';
import 'package:shajin_app/resources/ui_helper.dart';
import 'package:shajin_app/resources/app_images.dart';
import 'package:http/http.dart' as http;

class SecondScreenView extends StatefulWidget {
  const SecondScreenView({super.key});

  @override
  State<SecondScreenView> createState() => _SecondScreenViewState();
}

class _SecondScreenViewState extends State<SecondScreenView> {
  AppColors appColors = AppColors();
  bool isLoading = false;
  List challangeList = [];

  @override
  void initState() {
    super.initState();
    apiFetching();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.appBarWidget("Calorie Stats"),
                  UIHelper.verticalSpaceMedium,
                  analyticsWidget(),
                  UIHelper.verticalSpaceMedium,
                  challangeListWidget(),
                ],
              ),
            ),
          );
  }

  Widget analyticsWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      decoration: UIHelper.roundedBorderWithColor(15, appColors.whiteclr, borderColor: appColors.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHelper.horizontalSpaceSmall,
          UIHelper.titleTextStyle("Analytics", 25, false, fntweight: FontWeight.w700),
          UIHelper.titleTextStyle("7,380 Calls", 15, false, fntweight: FontWeight.bold, fontclr: appColors.errorBorder),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 130,
              padding: const EdgeInsets.all(5),
              decoration: UIHelper.roundedBorderWithColor(0, Colors.white, isShadow: true, shadowcolor: appColors.grey1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages().fire, height: 30, width: 30),
                  UIHelper.horizontalSpaceSmall,
                  Column(
                    children: [
                      UIHelper.titleTextStyle("Burn", 25, false, fntweight: FontWeight.w700),
                      UIHelper.titleTextStyle("335 Calls", 15, false, fontclr: appColors.grey),
                    ],
                  )
                ],
              ),
            ),
          ),
          UIHelper.verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(analyzeList.length, (i) {
              return Container(
                height: analyzeList[i]["count"],
                width: 25,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: UIHelper.roundedBorderWithColor(20, i == 5 ? appColors.primaryclr : appColors.grey1),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget challangeListWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UIHelper.titleTextStyle("Chalenge", 20, false, fntweight: FontWeight.w700),
            UIHelper.titleTextStyle("See all", 15, false, fontclr: appColors.grey),
          ],
        ),
        Wrap(
          children: List.generate(challangeList.length, (i) {
            int imageIndex = i % repetedimageList.length;
            bool isCompleted = challangeList[i]['completed'];
            return Container(
              padding: const EdgeInsets.all(16),
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(repetedimageList[imageIndex], height: 40, width: 40),
                  UIHelper.horizontalSpaceMedium,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.titleTextStyle(challangeList[i]['title'], 16, false, fntweight: FontWeight.bold),
                        UIHelper.titleTextStyle(isCompleted ? "Completed!" : "Not Complete", 14, false, fontclr: isCompleted ? appColors.greenclr : appColors.errorBorder),
                      ],
                    ),
                  ),
                  UIHelper.horizontalSpaceSmall,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(AppImages().fire, height: 20, width: 20),
                        UIHelper.titleTextStyle("332 Calls", 14, false, fontclr: appColors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  apiFetching() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      challangeList = json.decode(response.body);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
