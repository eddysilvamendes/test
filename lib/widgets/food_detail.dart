import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/components/colors.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/routes/route_helper.dart';
import 'package:shopping_app/screens/food/product_food_details.dart';
import 'package:shopping_app/uitls/app_constants.dart';
import 'package:shopping_app/uitls/app_dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/icon_text_widget.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class FoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  final String? name;
  const FoodDetails(
      {Key? key, required this.pageId, required this.page, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().getProductList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cuisine Chef "), //+ name),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: Dimensions.height15),
              //List of recommended food and images
              GetBuilder<ProductController>(
                builder: (productController) {
                  return productController.isLoading
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productController.productList.length,
                          itemBuilder: (context, index) {
                            var typeId =
                                productController.productList[index].typeId;
                            if (typeId == pageId) {
                              return GestureDetector(
                                onTap: () {
                                  print("Index: " + index.toString());
                                  print("Index 2 " +
                                      productController.productList[index]
                                          .toString());
                                  Get.to(() => ProductFoodDelail(
                                        page: "categories",
                                        pageId: index,
                                      ));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: Dimensions.width20,
                                    right: Dimensions.width20,
                                    bottom: Dimensions.height15,
                                  ),
                                  child: Row(
                                    children: [
                                      //Image Section
                                      Container(
                                        width: Dimensions.listViewImg,
                                        height: Dimensions.listViewImg,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white38,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              AppConstants.UPLOADS_URL +
                                                  productController
                                                      .productList[index].img,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Text Section Container
                                      Expanded(
                                        child: Container(
                                          height: Dimensions.listViewCon,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(
                                                  Dimensions.radius20),
                                              bottomRight: Radius.circular(
                                                  Dimensions.radius20),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: Dimensions.width10,
                                              right: Dimensions.width10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BigText(
                                                  text: productController
                                                      .productList[index].title,
                                                  color:
                                                      AppColors.mainBlackColor,
                                                ),
                                                SizedBox(
                                                    height:
                                                        Dimensions.height10),
                                                TextWidget(
                                                  text: productController
                                                      .productList[index]
                                                      .description,
                                                  color: Colors.grey,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                    height:
                                                        Dimensions.height10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconAndTextWidget(
                                                      icon: Icons.circle_sharp,
                                                      text: "Normal",
                                                      iconColor:
                                                          AppColors.iconColor1,
                                                    ),
                                                    IconAndTextWidget(
                                                      icon: Icons.location_on,
                                                      text: "1.7km",
                                                      iconColor:
                                                          AppColors.mainColor,
                                                    ),
                                                    IconAndTextWidget(
                                                      icon: Icons
                                                          .access_time_filled_rounded,
                                                      text: "32min",
                                                      iconColor:
                                                          AppColors.iconColor2,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        )
                      : CircularProgressIndicator(color: AppColors.mainColor);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
