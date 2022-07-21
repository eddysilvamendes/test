import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/base/custom_button.dart';
import 'package:shopping_app/components/colors.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/screens/food/product_food_details.dart';
import 'package:shopping_app/uitls/app_constants.dart';
import 'package:shopping_app/uitls/app_dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/icon_text_widget.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class FoodListView extends StatelessWidget {
  final int pageId;
  const FoodListView({Key? key, required this.pageId}) : super(key: key);

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
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: Dimensions.width15),
                                height: Dimensions.height20 * 10,
                                width: Dimensions.width20 * 10,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 20,
                                  shadowColor: Colors.grey.withOpacity(0.5),
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //Image Container
                                      Container(
                                        height: Dimensions.height20 * 5,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                                Dimensions.radius20),
                                          ),
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
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      //text
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: Dimensions.padding10,
                                            right: Dimensions.padding10),
                                        child: BigText(
                                          text: popularController
                                              .productList[index].title,
                                          size: Dimensions.font18 + 2.5,
                                          color: AppColors.mainBlackColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      //Price and discont and buttom
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: Dimensions.padding10),
                                            child: Text(
                                              "\$${popularController.productList[index].price.toString()}",
                                              style: TextStyle(
                                                fontSize: Dimensions.font18 + 3,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "40% off",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          CustomButton(
                                            margin: EdgeInsets.only(right: 5),
                                            buttonText: "ADD",
                                            fontSize: 10,
                                            height: Dimensions.height30,
                                            width: Dimensions.width30 * 2,
                                            onPressed: () {
                                              print(
                                                "Product list: " +
                                                    popularController
                                                        .productList[index].id
                                                        .toString(),
                                              );
                                              Get.find<ProductController>()
                                                  .addHomeItem(
                                                Get.find<ProductController>()
                                                        .productList[
                                                    popularController
                                                        .productList[index].id],
                                                Get.find<CartController>(),
                                              );
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
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
