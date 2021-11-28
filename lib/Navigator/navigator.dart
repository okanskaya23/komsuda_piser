import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Feed/Feed_page.dart';
import 'package:komsuda_piser_local/Pages/Home/home_page.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Navigator/bottom_bar/app_bottom_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'tab_bar/tab_controller_handler.dart';
import 'tab_bar/content_view.dart';
import 'tab_bar/app_tab.dart';
import 'tab_bar/app_tab_bar.dart';



class navigatorPage extends StatefulWidget {
  @override
  NavigatorPage createState() => NavigatorPage();
}

class NavigatorPage extends State<navigatorPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  double screenHeight;
  double screenWidth;
  double topPadding;
  double bottomPadding;
  double sidePadding;

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Ana Sayfa',icon: Icons.home),
      content: home(),
    ),
    ContentView(
      tab: CustomTab(title: 'Yakındakiler',icon: Icons.dynamic_feed),
      content: feed(),
    ),
    ContentView(
      tab: CustomTab(title: 'Ayarlar',icon: Icons.settings),
      content: feed(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Appcolors.black,
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: desktopView(),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),
        Container(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),
        BottomBar(),
      ],
    );
  }
}
