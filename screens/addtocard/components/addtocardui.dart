import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/likeapi.dart';
import 'package:manaqa_app/model/getaddtocartlistmodel.dart';
import 'package:manaqa_app/provider/getaddressProvider.dart';
import 'package:manaqa_app/screens/addtocard/components/addtocardbutton.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/nodatafoundscreen.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddtoCardShowUiScreen extends StatefulWidget {
  final ValueChanged<GetaddtocartlistmodelDataData> onSelected;
  final GetaddtocartlistmodelDataData model;
  final Function callback;
  const AddtoCardShowUiScreen(
      {Key? key,
      required this.model,
      required this.onSelected,
      required this.callback})
      : super(key: key);

  @override
  State<AddtoCardShowUiScreen> createState() => _AddtoCardShowUiScreenState();
}

class _AddtoCardShowUiScreenState extends State<AddtoCardShowUiScreen> {
  Future fetchdatas() async {
    await widget.callback("api");
  }

  Future addtocard(String quantity, String productid, String cardid) async {
    var body = {'quantity': quantity, "product_id": productid};
    LikeApi _likeapi = new LikeApi(body);
    final response = await _likeapi.updatetocard(cardid);
    fetchdatas();
  }

  Future deleteaddresses(String cartlistid) async {
    var id = {
      "id": cartlistid,
    };

    LikeApi _likeapi = new LikeApi(id);
    final response = await _likeapi.deletecartlist(cartlistid);

    if (response['status'] == "success") {
      DialogHelper.showFlutterToast(strMsg: response['message']);

      fetchdatas();
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.model.id == null
        ? Container(width: 5) //NoDataFoundErrorScreens()

        : Padding(
            padding: EdgeInsets.only(right: 2.h, left: 2.h, bottom: 2.h),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                ClayContainer(
                  borderRadius: 1.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 20.w,
                        width: 20.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(1.h),
                            color: AppColors.colorGrey,
                            image:
                                widget.model.product!.image.toString() != "null"
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          ApiUrl.imageurl +
                                              (widget.model.product!.image!),
                                        ),
                                        fit: BoxFit.fill)
                                    : DecorationImage(
                                        image: AssetImage(AppImages.outro1),
                                        fit: BoxFit.fill),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.colorGrey,
                                blurRadius: 2,
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextStyle(
                              text: widget.model.product!.name!,
                              maxline: 2,
                              textOverflow: TextOverflow.ellipsis,
                              style:
                                  AppStyle.cardtitle.copyWith(fontSize: 15.sp),
                            ),
                            TitleTextStyle(
                              text:
                                  " \$ ${AppHelper().pricecount(int.parse(widget.model.quantity.toString()), widget.model.product!.salePrice.toString())}",
                              style: AppStyle.cardtitle.copyWith(
                                  fontSize: 17.sp,
                                  color: AppColors.primarycolor),
                            ),
                            _rowuishow("SKU No : ",
                                widget.model.product!.sku!.toString()),
                            _rowuishow("Unit Price : ",
                                "\$ ${widget.model.product!.salePrice!.toString()}"),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ).ripple(
                    () {
                      widget.onSelected(widget.model);
                    },
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      Column(
                        children: [
                          AddtoCardquantitytiyScreenActivity(
                            quantity: widget.model.quantity.toString(),
                            callback: (value) {
                              setState(() {
                                widget.model.quantity = value.toString();
                                addtocard(
                                    widget.model.quantity.toString(),
                                    widget.model.productId.toString(),
                                    widget.model.id.toString());
                              });
                            },
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          deleteaddresses(
                            widget.model.id.toString(),
                          );
                        },
                        child: Icon(
                          Icons.delete_sweep,
                          color: Colors.red,
                          size: 3.5.h,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Widget _rowuishow(String title, String data) {
    return Row(
      children: [
        TitleTextStyle(
          text: title,
          style: AppStyle.cardssubtitle
              .copyWith(fontSize: 14.sp, color: AppColors.grey),
        ),
        TitleTextStyle(
          text: data,
          style: AppStyle.cardssubtitle
              .copyWith(fontSize: 14.sp, color: AppColors.grey),
        ),
      ],
    );
  }
}
