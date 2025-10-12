import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int x = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      HomeScreen(),
      // BookmarkScreen(),
      // CartScreen(),
      // ProfileScreen(),
      Center(child: Text("screen 2")),
      Center(child: Text("screen 3")),
      Center(child: Text("screen 4")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: x,
        onTap: (index) {
          x = index;
          setState(() {});
        },

        items: [
          _bottonNavigationBarItem(asset: AppImages.homeIconSvg, label: "home"),
          _bottonNavigationBarItem(
            asset: AppImages.bookmarkSvg,
            label: "Bookmark",
          ),
          _bottonNavigationBarItem(asset: AppImages.cartSvg, label: "cart"),
          _bottonNavigationBarItem(
            asset: AppImages.profileSvg,
            label: "profile",
          ),
        ],
      ),

      body: screens[x],
    );
  }

  BottomNavigationBarItem _bottonNavigationBarItem({
    required String asset,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        asset,
        colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(asset),

      label: "home",
    );
  }
}
