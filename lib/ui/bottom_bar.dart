import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajin_app/resources/app_colors.dart';
import 'package:shajin_app/resources/datas.dart';
import 'package:shajin_app/resources/ui_helper.dart';
import 'package:shajin_app/ui/first_screen.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  AppColors appColors = AppColors();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.whiteclr,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: FirstScreenView()),
            UIHelper.verticalSpaceSmall,
            Container(
              height: 50,
              width: Get.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(bottomNavList.length, (i) {
                  return GestureDetector(
                      onTap: () {
                        if (i < 2) {
                          selectedIndex = i;
                          setState(() {});
                        }
                      },
                      child: i != 3
                          ? Image.asset(
                              bottomNavList[i]['image'],
                              height: 30,
                              width: 30,
                              color: selectedIndex == i ? appColors.blackclr : appColors.grey1,
                            )
                          : Image.asset(
                              bottomNavList[i]['image'],
                              height: 30,
                              width: 30,
                            ));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
