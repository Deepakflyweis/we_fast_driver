import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/account/widget/transaction_tile.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/home_app_bar.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_string.dart';
import '../../../widgets/buttons/rounded_gradient_button.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: HomeAppBar(
        title: 'Wallet',
      ),
      body: Stack(
        children: [
          Positioned(
              top: 10.h,
              left: -10.w,
              child: SvgPicture.asset(
                'assets/images/wavy_pattern_bg.svg',
                width: 120.w,
              )),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: controller.obx(
              (_) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    walletBalance +
                                        '       ${rs} ${controller.walletBalance}',
                                    style: TextStyle(fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/images/wallet_image.png',
                                width: 20.w,
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 35.w,
                            height: 6.h,
                            child: RoundedGradientButton(
                                title: depositOnline,
                                gradient: buttonGradientGreen,
                                onTap: () {}),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(recentTrips)),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.bookings.length,
                                itemBuilder: (context, index) {
                                  var data = controller.bookings[index];
                                  return TransactionsTile(
                                    companyName: data.senderDetails.name,
                                    transactionDateTime: data.createdAt,
                                    amount: data.amount.toDouble(),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
