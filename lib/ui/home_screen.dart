import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajin_app/resources/app_colors.dart';
import 'package:shajin_app/resources/datas.dart';
import 'package:shajin_app/resources/ui_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppColors appColors = AppColors();
  List selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UIHelper.titleTextStyle("Choose habit", 25, false, fntweight: FontWeight.bold),
              UIHelper.verticalSpaceSmall,
              UIHelper.titleTextStyle("Choose your daily habits, you can choose more than one", 17, false, fontclr: appColors.grey),
              UIHelper.verticalSpaceSmall,
              Expanded(
                  child: Wrap(
                children: List.generate(habbitsList.length, (i) {
                  return GestureDetector(
                    onTap: () {
                      if (selectedIndex.contains(i)) {
                        selectedIndex.remove(i);
                      } else {
                        selectedIndex.add(i);
                      }
                      setState(() {});
                    },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.all(10),
                      width: Get.width / 2.5,
                      decoration: UIHelper.roundedBorderWithColor(
                        15,
                        selectedIndex.contains(i) ? appColors.primarylightclr.withOpacity(0.2) : appColors.whiteclr,
                        isShadow: selectedIndex.contains(i) ? false : true,
                        borderColor: selectedIndex.contains(i) ? appColors.primaryclr : appColors.whiteclr,
                        borderWidth: selectedIndex.contains(i) ? 2 : 1,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(habbitsList[i]['image'], height: 50, width: 50),
                          UIHelper.verticalSpaceSmall,
                          UIHelper.titleTextStyle(habbitsList[i]['title'], 16, false, fntweight: FontWeight.bold),
                        ],
                      ),
                    ),
                  );
                }),
              )),
              UIHelper.verticalSpaceSmall,
              GestureDetector(
                onTap: () {
                  if (selectedIndex.length > 1) {
                  } else {
                    Get.snackbar(
                      "Warning",
                      "Please select more than one habits",
                      backgroundColor: appColors.errorBorder,
                      colorText: appColors.whiteclr,
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: UIHelper.roundedBorderWithColor(14, appColors.blackclr),
                  child: UIHelper.titleTextStyle("Get Started!", 15, false, fontclr: appColors.whiteclr, fntweight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
