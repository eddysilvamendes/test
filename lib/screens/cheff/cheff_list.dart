import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/components/colors.dart';
import 'package:shopping_app/controllers/cheff_controller.dart';
import 'package:shopping_app/screens/cheff/cheff_detail.dart';
import 'package:shopping_app/uitls/app_constants.dart';
import 'package:shopping_app/uitls/app_dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/icon_text_widget.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class CheffScreen extends StatelessWidget {
  const CheffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          elevation: 0.0,
          title: Text("Cheff's"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                GetBuilder<CheffController>(
                  builder: (cheffController) {
                    return cheffController.isLoaded
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cheffController.cheffList.length,
                            itemBuilder: (context, index) {
                              return cheffController.cheffList[index].status ==
                                      1
                                  ? GestureDetector(
                                      onTap: () {
                                        print("THE INDEX " +
                                            cheffController.cheffList[index].id
                                                .toString());
                                        Get.to(
                                          () => CheffDetailPage(
                                            pageId: index,
                                            page: "cheff",
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: Dimensions.width20,
                                          right: Dimensions.width20,
                                          //bottom: Dimensions.height15,
                                          top: Dimensions.height15,
                                        ),
                                        child: Row(
                                          children: [
                                            //Image Section
                                            Container(
                                              width: Dimensions.listViewImg,
                                              height: Dimensions.listViewImg,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimensions.radius20,
                                                ),
                                                color: Colors.white38,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    AppConstants.UPLOADS_URL +
                                                        cheffController
                                                            .cheffList[index]
                                                            .img,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                      Dimensions.radius20,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(
                                                      Dimensions.radius20,
                                                    ),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: Dimensions.width20,
                                                    right: Dimensions.width10,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconAndTextWidget(
                                                        icon: Icons.person,
                                                        text: cheffController
                                                            .cheffList[index]
                                                            .title,
                                                        size: Dimensions.font22,
                                                        color: AppColors
                                                            .mainBlackColor,
                                                        iconColor:
                                                            AppColors.mainColor,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Dimensions.height10,
                                                      ),
                                                      IconAndTextWidget(
                                                        icon: Icons.email,
                                                        text: cheffController
                                                            .cheffList[index]
                                                            .email,
                                                        color: AppColors
                                                            .mainBlackColor,
                                                        iconColor:
                                                            AppColors.mainColor,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Dimensions.height10,
                                                      ),
                                                      IconAndTextWidget(
                                                        icon: Icons.phone,
                                                        text: "+238 " +
                                                            cheffController
                                                                .cheffList[
                                                                    index]
                                                                .phone,
                                                        color: AppColors
                                                            .mainBlackColor,
                                                        iconColor:
                                                            AppColors.mainColor,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container();
                            },
                          )
                        : CircularProgressIndicator(color: AppColors.mainColor);
                  },
                ),
                SizedBox(height: Dimensions.height15),
              ],
            ),
          ),
        ));
  }
}
