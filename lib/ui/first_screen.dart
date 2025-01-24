import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajin_app/resources/app_colors.dart';
import 'package:shajin_app/resources/datas.dart';
import 'package:shajin_app/resources/ui_helper.dart';
import 'package:shajin_app/resources/app_images.dart';

class FirstScreenView extends StatefulWidget {
  const FirstScreenView({super.key});

  @override
  State<FirstScreenView> createState() => _FirstScreenViewState();
}

class _FirstScreenViewState extends State<FirstScreenView> {
  AppColors appColors = AppColors();
  List colorList = [];
  int selectedDate = 0;

  @override
  void initState() {
    super.initState();
    colorList = [appColors.greenclr, appColors.orangeclr, appColors.yellowclr, appColors.pinkclr];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.appBarWidget("Wednesday,24"),
            UIHelper.verticalSpaceMedium,
            noticicationWidget(),
            UIHelper.verticalSpaceMedium,
            daysListWidget(),
            UIHelper.verticalSpaceMedium,
            habitsList(),
          ],
        ),
      ),
    );
  }

  Widget noticicationWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: UIHelper.roundedBorderWithColor(15, appColors.blackclr),
      child: Row(
        children: [
          Container(
            decoration: UIHelper.circleBorderBox(appColors.grey),
            padding: const EdgeInsets.all(10),
            child: Image.asset(AppImages().books, height: 50, width: 50),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.titleTextStyle("Notification!", 18, false, fontclr: appColors.whiteclr),
                UIHelper.verticalSpaceSmall,
                UIHelper.titleTextStyle("Now is the time to read the book, you can change it in setting.", 15, false, fontclr: appColors.grey1),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget daysListWidget() {
    return SizedBox(
        width: Get.width,
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: dayList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                selectedDate = i;
                setState(() {});
              },
              child: Container(
                width: 70,
                margin: const EdgeInsets.all(5),
                decoration: UIHelper.roundedBorderWithColor(15, selectedDate == i ? appColors.primaryclr : appColors.whiteclr, isShadow: true),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelper.titleTextStyle(dayList[i]['title'], 18, false, fontclr: selectedDate == i ? appColors.whiteclr : appColors.blackclr),
                    UIHelper.verticalSpaceSmall,
                    UIHelper.titleTextStyle(dayList[i]['id'], 20, false, fntweight: FontWeight.bold, fontclr: selectedDate == i ? appColors.whiteclr : appColors.blackclr),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return UIHelper.horizontalSpaceSmall;
          },
        ));
  }

  Widget habitsList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UIHelper.titleTextStyle("Tuesday habits", 20, false, fntweight: FontWeight.w700),
            UIHelper.titleTextStyle("See all", 15, false, fontclr: appColors.grey),
          ],
        ),
        Wrap(
          children: List.generate(habbitsList1.length, (i) {
            Color bgclr = colorList[i];
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16),
              width: Get.width / 2.5,
              // ignore: deprecated_member_use
              decoration: UIHelper.roundedBorderWithColor(15, bgclr.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(habbitsList1[i]['image'], height: 50, width: 50),
                      Container(
                        decoration: UIHelper.circleBorderBox(appColors.whiteclr),
                        padding: const EdgeInsets.all(5),
                        child: Icon(Icons.done, color: appColors.errorBorder),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpaceSmall,
                  UIHelper.titleTextStyle(habbitsList1[i]['title'], 16, false, fntweight: FontWeight.bold),
                  UIHelper.titleTextStyle(habbitsList1[i]['content'], 14, false, fontclr: appColors.grey),
                  UIHelper.verticalSpaceSmall,
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
