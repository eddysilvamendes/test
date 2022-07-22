import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/components/colors.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/screens/food/product_food_details.dart';
import 'package:shopping_app/uitls/app_constants.dart';
import 'package:shopping_app/uitls/app_dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/icon_text_widget.dart';

class FoodImage extends StatelessWidget {
  final int pageId;
  const FoodImage({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().getProductList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GetBuilder<ProductController>(
            builder: (popularController) {
              return popularController.isLoading
                  ? Container(
                      margin: EdgeInsets.only(
                        //left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height10,
                      ),
                      height: Dimensions.height20 * 10,
                      //width: double.maxFinite,
                      //color: Colors.blue,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: popularController.productList.length,
                        itemBuilder: (context, index) {
                          if (popularController.productList[index].typeId ==
                              pageId) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => ProductFoodDelail(
                                    pageId: index,
                                    page: "home",
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width10),
                                    height: Dimensions.height20 * 2.5,
                                    width: Dimensions.width20 * 2.5,
                                    decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          AppConstants.UPLOADS_URL +
                                              popularController
                                                  .productList[index].img,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height10 / 2),
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ))
                  : Container();
            },
          )
        ],
      ),
    );
  }
}
