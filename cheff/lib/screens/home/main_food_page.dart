import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/components/colors.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/categories_controller.dart';
import 'package:shopping_app/controllers/cheff_controller.dart';
import 'package:shopping_app/controllers/popular_product.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/routes/route_helper.dart';
import 'package:shopping_app/screens/cheff/cheff_detail.dart';
import 'package:shopping_app/screens/search/seach_product_page.dart';
import 'package:shopping_app/screens/search/widget/search_field.dart';
import 'package:shopping_app/uitls/app_constants.dart';
import 'package:shopping_app/uitls/app_dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/food_detail.dart';
import 'package:shopping_app/widgets/food_horizontal_list_view.dart';
import 'package:shopping_app/widgets/icon_text_widget.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class MainFoodPage extends StatefulWidget {
  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  //var cheffController = Get.find<CheffController>().cheffList;
  final TextEditingController _searchController = TextEditingController();
  ProductController controller = Get.find();
  PopularProduct popularProductController = Get.find();
  PageController pageController =
      PageController(viewportFraction: Dimensions.viewPort);
  var _currPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  final places = {
    "img/food11.png": "Cumin Barbecue",
    "img/food12.png": "Chinese Side",
    "img/food1.png": "Breakfast Savor",
    "img/food0.png": "Breakfast1 Savor",
    "img/food13.png": "Breakfast2 Savor",
  };

  //scale factor
  double _scaleFactor = .8;
  //view page height
  double _height = Dimensions.pageViewCon;
  _buildPageItem(int index, Product product) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(
                RouteHelper.getRecommendedFoodRoute(index, "recommended"));
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.padding20, top: Dimensions.padding20),
                  //previously 220
                  height: Dimensions.pageViewInnerCon,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: const EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.padding30),
                      color:
                          index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              AppConstants.UPLOADS_URL + product.img))),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: Dimensions.margin40,
                        left: Dimensions.appMargin,
                        right: Dimensions.appMargin),
                    width: double.maxFinite,
                    //previously 120
                    height: Dimensions.pageViewInnerConText,

                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.padding20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFe8e8e8),
                              blurRadius: 5.0,
                              offset: Offset(0, 5)),
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0))
                        ]),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.padding10, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                              text: product.title, color: AppColors.titleColor),
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
                              TextWidget(text: "4.5", color: Color(0xFFccc7c5)),
                              SizedBox(
                                width: 10,
                              ),
                              TextWidget(
                                  text: "1287 " + "comments".tr,
                                  color: Color(0xFFccc7c5))
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.padding20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndTextWidget(
                                text: "Normal",
                                color: AppColors.textColor,
                                icon: Icons.circle_sharp,
                                iconColor: AppColors.iconColor1,
                              ),
                              IconAndTextWidget(
                                text: "1.7km",
                                color: AppColors.textColor,
                                icon: Icons.location_on,
                                iconColor: AppColors.mainColor,
                              ),
                              IconAndTextWidget(
                                text: "32min",
                                color: AppColors.textColor,
                                icon: Icons.access_time_rounded,
                                iconColor: AppColors.iconColor2,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          //for the pageview
          GetBuilder<ProductController>(builder: (productController) {
            return productController.isLoading
                ? Container(
                    color: Color(0xFFf9f9fa),
                    //previously 320
                    height: Dimensions.pageViewCon,

                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: PageView.builder(
                        controller: pageController,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: productController.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              productController.popularProductList[position]);
                        },
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
          SizedBox(height: Dimensions.height15),

          GestureDetector(
            onTap: () => Get.to(() => SearchScreen()),
            child: Container(
              height: Dimensions.height30 * 2,
              width: double.maxFinite,
              margin: EdgeInsets.only(
                left: Dimensions.padding20,
                right: Dimensions.padding20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimensions.padding10),
                    child: IconAndTextWidget(
                      icon: Icons.search,
                      text: 'search_for_food'.tr,
                      color: AppColors.mainBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //for the dots
          /* GetBuilder<ProductController>(builder: (productController) {
            return new DotsIndicator(
              dotsCount:
                  productController.length == 0 ? 1 : productController.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            );
          }),*/
          //originally height is 30
          SizedBox(
            height: Dimensions.sizedBoxHeight,
          ),
          //texts and the dot

          //Categories
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width20, top: Dimensions.width20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(
                    text: "Chef Cuisine | ", color: AppColors.mainBlackColor),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          GetBuilder<CategoriesController>(
            builder: (categorieController) {
              return Container(
                margin: EdgeInsets.only(left: Dimensions.appMargin),
                height: Dimensions.height20 * 3,
                //width: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categorieController.categoriesList.length,

                  itemBuilder: (context, index) {
                    var categories = categorieController.categoriesList[index];
                    return GestureDetector(
                      onTap: () {
                        print("tapped " + categories.id.toString());
                        Get.to(
                          () => FoodDetails(
                            pageId: categories.id,
                            page: "foodpage",
                            //name: categories.cheff,
                          ),
                        );
                      },
                      child: Tooltip(
                        message:
                            categorieController.categoriesList[index].title,
                        child: Container(
                          margin: EdgeInsets.only(
                            right: Dimensions.width10,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          // height: 100,
                          width: Dimensions.height20 * 3,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20 / 2),
                            color: AppColors.mainColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                AppConstants.UPLOADS_URL +
                                    categorieController
                                        .categoriesList[index].img,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),

          SizedBox(
            height: Dimensions.sizedBoxHeight,
          ),

          //Destaque section
          GetBuilder<CategoriesController>(
            builder: (categorieController) {
              return Container(
                //height: 100,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: categorieController.categoriesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      child: categorieController
                                  .categoriesList[index].released ==
                              1
                          ? GetBuilder<CheffController>(
                              builder: (chefController) {
                              return Container(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: chefController.cheffList.length,
                                  itemBuilder: (context, i) {
                                    return categorieController
                                                .categoriesList[index]
                                                .cheffId ==
                                            chefController.cheffList[i].id
                                        ? Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  BigText(
                                                    text: categorieController
                                                            .categoriesList[
                                                                index]
                                                            .title +
                                                        " |",
                                                    color: AppColors
                                                        .mainBlackColor,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                        () => CheffDetailPage(
                                                          pageId: i,
                                                          page: "home",
                                                        ),
                                                      );
                                                    },
                                                    child: BigText(
                                                      text: " Cheff " +
                                                          chefController
                                                              .cheffList[i]
                                                              .title,
                                                      color: AppColors
                                                          .mainBlackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10 / 2,
                                              ),
                                              FoodListView(
                                                pageId: categorieController
                                                    .categoriesList[index].id,
                                              ),
                                              SizedBox(
                                                height: Dimensions.height30,
                                              )
                                            ],
                                          )
                                        : Container();
                                  },
                                ),
                              );
                            })
                          : Container(),
                    );
                  },
                ),
              );
            },
          ),

          /*  Container(
                margin:  EdgeInsets.only(left: Dimensions.appMargin),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BigText(text: "popular".tr, color: Colors.black),
                    SizedBox(width: 10,),
                    Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: BigText(text: ".", color: Colors.black26),
                    ),
                    SizedBox(width: 10,),
                    Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        child: TextWidget(text: "what_most_people_eat".tr, color: AppColors.textColor)
                    ),
                  ],
                )
            ),
            SizedBox(height: Dimensions.sizedBoxHeight,),
            //here we do with expanded. but in that case parent is not
            // wraped with singlechild scrollview

            GetBuilder<PopularProduct>(builder: (popularProducts){
                  return  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding:  EdgeInsets.only(top: Dimensions.padding10),
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: (){
                            Get.toNamed(RouteHelper.getPopularFoodRoute(index, "popular"));
                          },
                          child:  Container(
                            margin:  EdgeInsets.only(left: Dimensions.appMargin, right: Dimensions.appMargin, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: Dimensions.listViewImg,
                                  height: Dimensions.listViewImg,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.padding20),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.UPLOADS_URL+popularProducts.popularProductList[index].img

                                          )
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: Dimensions.isWeb?EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL, right: Dimensions.PADDING_SIZE_SMALL):EdgeInsets.all(0),
                                    height: Dimensions.listViewCon,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(Dimensions.padding20),
                                            bottomRight: Radius.circular(Dimensions.padding20)
                                        )
                                    ),
                                    child:Padding(
                                      padding:  EdgeInsets.only(left: Dimensions.padding10, right: Dimensions.padding10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          BigText(text: popularProducts.popularProductList[index].title,/* element.value,*/
                                              color: Colors.black87),
                                          SizedBox(height: Dimensions.padding10,),
                                          TextWidget(text: "With chinese characteristics", color: AppColors.textColor),
                                          SizedBox(height: Dimensions.padding10,),
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconAndTextWidget(text: "Normal", color: AppColors.textColor, icon: Icons.circle, iconColor: AppColors.iconColor1,),

                                              IconAndTextWidget(text: "17km",color: AppColors.textColor, icon: Icons.location_on, iconColor: AppColors.mainColor,),

                                              IconAndTextWidget(text: "32min",color:AppColors.textColor, icon: Icons.access_time_rounded, iconColor: AppColors.iconColor2,)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                )
                              ],
                            ),
                          )
                      );
                    },
                  );

                },)

*/
        ]);
  }
}
