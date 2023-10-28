import 'package:flutter/material.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutCart extends StatefulWidget {
  final String? text1;
  final String? text2;
  final Function()? onTap;
  const CheckoutCart({
    Key? key,
    this.text1,
    this.text2,
    this.onTap,
  }) : super(key: key);

  @override
  State<CheckoutCart> createState() => _CheckoutCartState();
}

class _CheckoutCartState extends State<CheckoutCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 10.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            // borderRadius: BorderRadius.circular(1.h),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(6, 1),
              )
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: AppStyle.texttitle.copyWith(
                              color: Color.fromARGB(255, 131, 130, 130),
                              fontSize: 16.sp),
                        ),
                        Text(
                          widget.text1 ?? '',
                          style: AppStyle.texttitle
                              .copyWith(color: Colors.black, fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Container(
                      height: 6.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        color: AppColors.primarycolor,
                        borderRadius: BorderRadius.circular(1.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(-1, 3),
                          )
                        ],
                      ),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Text(
                          widget.text2 ?? '',
                          style: AppStyle.texttitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
