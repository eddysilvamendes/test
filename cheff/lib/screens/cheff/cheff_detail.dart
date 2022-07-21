import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/components/colors.dart';
import 'package:shopping_app/components/expanded_widget.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/categories_controller.dart';
import 'package:shopping_app/controllers/cheff_controller.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/routes/route_helper.dart';
import 'package:shopping_app/uitls/app_constants.dart';
import 'package:shopping_app/uitls/app_dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/food_horizontal_image.dart';
import 'package:shopping_app/widgets/food_horizontal_list_view.dart';
import 'package:shopping_app/widgets/icon_text_widget.dart';
import 'package:shopping_app/widgets/text_widget.dart';
import 'package:get/get.dart';

class CheffDetailPage extends StatelessWidget {
  int pageId;
  String page;
  CheffDetailPage({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("hi........." + pageId.toString());
    //var productItem = Get.find<CategoriesController>().categoriesList[pageId];
    var cheffItem = Get.find<CheffController>().cheffList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.sliverHeight + 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.UPLOADS_URL + cheffItem.img,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 6),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Get.toNamed(RouteHelper.getInitialRoute());
                        Get.back();
                      },
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Colors.black54,
                      )),
                    ),
                  ),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.sliverHeight + 150,
              // bottom: 0,
              child: Container(
                height: 500,
                //width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.padding20),
                        topLeft: Radius.circular(Dimensions.padding20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                        size: Dimensions.font26,
                        text: cheffItem.title,
                        color: Colors.black87),
                    SizedBox(
                      height: Dimensions.padding10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  color: AppColors.mainColor, size: 15)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                            text: "4.5",
                            color: Color.fromARGB(255, 232, 73, 10)),
                        SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                            text: "1287 comments", color: Color(0xFFccc7c5))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.padding20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          text: cheffItem.phone,
                          color: AppColors.mainBlackColor,
                          icon: Icons.phone,
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(
                          text: cheffItem.email,
                          color: AppColors.mainBlackColor,
                          icon: Icons.email_sharp,
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(
                          text: cheffItem.status == 1 ? "Active" : "Inactive",
                          color: AppColors.mainBlackColor,
                          icon: Icons.online_prediction,
                          iconColor: AppColors.mainColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),

                    //plate
                    GetBuilder<CategoriesController>(
                      builder: (categorieController) {
                        return Container(
                          //height: 100,
                          //width: 100,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount:
                                categorieController.categoriesList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: categorieController
                                            .categoriesList[index].cheffId ==
                                        cheffItem.id
                                    ? Column(
                                        children: [
                                          Row(
                                            children: [
                                              BigText(
                                                text: categorieController
                                                    .categoriesList[index]
                                                    .title,
                                                color: AppColors.mainBlackColor,
                                                fontWeight: FontWeight.bold,
                                                size: Dimensions.font22,
                                              )
                                            ],
                                          ),
                                          Divider(
                                            height: Dimensions.height10,
                                            color: AppColors.mainColor,
                                          ),
                                          Row(
                                            children: [
                                              FoodImage(
                                                pageId: categorieController
                                                    .categoriesList[index].id,
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    : Container(),
                              );
                            },
                          ),
                        );
                      },
                    ),

                    /*
                    BigText(
                        size: 22,
                        text: "Couisine | Humburguer",
                        color: AppColors.titleColor),
                    SizedBox(
                      height: Dimensions.padding20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: DescriptionTextWidget(
                          text: cheffItem.email,
                        ),
                      ),
                    )*/
                  ],
                ),
              ))
        ],
      ),
      //bottomNavigationBar: ,
    );
    // );
  }
}
