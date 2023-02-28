import 'package:flutter/material.dart';
import 'package:itsolutions.team/presentation/pages/portfolio/portfolio_page.dart';
import 'package:itsolutions.team/presentation/widgets/app_drawer.dart';
import 'package:itsolutions.team/presentation/widgets/content_wrapper.dart';
import 'package:itsolutions.team/presentation/widgets/custom_app_bar.dart';
import 'package:itsolutions.team/values/values.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class LiveDemoMobile extends StatefulWidget {
  LiveDemoMobile({Key? key,required this.title, required this.index}) : super(key: key);

  final String title;
  final int index;

  @override
  State<LiveDemoMobile> createState() => _LiveDemoMobileState();
}

class _LiveDemoMobileState extends State<LiveDemoMobile> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
    child: CustomAppBar(
        title: widget.title,
        actionIcon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.accentColor2,
          size: Sizes.ICON_SIZE_20,
        ),
        onLeadingPressed: () {
          if (_scaffoldKey.currentState!.isEndDrawerOpen) {
            _scaffoldKey.currentState!.openEndDrawer();
          } else {
            _scaffoldKey.currentState!.openDrawer();
          }
        },
        onActionsPressed: () {
          Navigator.pop(context);
        },
      ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: PortfolioPage.portfolioPageRoute,
      ),
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: Data.listOfWebControllers[widget.index]),
      ).build(context),
    );
  }
}
