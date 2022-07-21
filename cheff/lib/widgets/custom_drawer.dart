import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/components/colors.dart';
import 'package:shopping_app/controllers/auth_controller.dart';
import 'package:shopping_app/controllers/user_controller.dart';
import 'package:shopping_app/routes/route_helper.dart';
import 'package:shopping_app/uitls/app_constants.dart';
import 'package:shopping_app/uitls/app_dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'Eddy Mendes';
    final email = 'eddysilvamendes19@gmail.com';
    final img =
        "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png";
    var userLoggedIn = Get.find<AuthController>().isLoggedIn();
    return Drawer(
      child: SafeArea(
        child: Material(
          color: Color.fromRGBO(24, 85, 149, 1),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding20),
            children: [
              SizedBox(height: Dimensions.height45),
              GetBuilder<UserController>(builder: (userController) {
                return !userController.isLoading
                    ? _buildHeader(
                        img: /*userLoggedIn
                        ? userController.userInfoModel!.image!.isNotEmpty
                            ? userController.userInfoModel!.image!
                            : img
                        :*/
                            img,
                        name: userLoggedIn
                            ? userController.userInfoModel!.fName
                            : "User Not Logged In",
                        email: userLoggedIn
                            ? userController.userInfoModel!.email
                            : "User Not Logged In")
                    : CircularProgressIndicator(
                        color: AppColors.mainColor,
                      );
              }),
              //SizedBox(height: Dimensions.height30),
              _buildMenuItem(
                  text: 'Search',
                  icon: Icons.search,
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.toNamed(RouteHelper.getSearchRoute());
                  }),
              SizedBox(height: Dimensions.height15),
              _buildMenuItem(
                  text: 'Cheffs',
                  icon: Icons.people,
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.toNamed(RouteHelper.getCheff());
                  }),
              SizedBox(height: Dimensions.height15),
              _buildMenuItem(
                text: 'Coisine',
                icon: Icons.kitchen,
                onTap: () {
                  Navigator.of(context).pop();
                  Get.toNamed(RouteHelper.getSignInRoute());
                },
              ),
              SizedBox(height: Dimensions.height15),
              _buildMenuItem(
                  text: 'Order',
                  icon: Icons.bookmark,
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.toNamed(RouteHelper.search);
                  }),
              SizedBox(height: Dimensions.height15),
              _buildMenuItem(
                text: 'Favorite',
                icon: Icons.favorite,
              ),
              SizedBox(height: Dimensions.height15),
              Divider(color: Colors.white70),
              SizedBox(height: Dimensions.height15),
              SizedBox(height: Dimensions.height15),
              _buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
              ),
              SizedBox(height: Dimensions.height15),
              _buildMenuItem(
                text: 'Contact Support',
                icon: Icons.contact_support,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onTap}) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onTap,
    );
  }

  _buildHeader(
      {required String img, required String name, required String email}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.padding40),
        child: Row(
          children: [
            CircleAvatar(
              radius: Dimensions.radius30,
              backgroundImage: NetworkImage(/*AppConstants.UPLOADS_URL +*/ img),
            ),
            SizedBox(
              width: Dimensions.width20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: name,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: Dimensions.font20,
                ),
                SizedBox(
                  height: Dimensions.height10 / 2,
                ),
                BigText(
                  text: email,
                  color: Colors.white,
                  size: Dimensions.font26 / 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
