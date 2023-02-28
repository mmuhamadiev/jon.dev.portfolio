import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:itsolutions.team/core/layout/adaptive.dart';
import 'package:itsolutions.team/core/utils/functions.dart';
import 'package:itsolutions.team/presentation/pages/home/home_page.dart';
import 'package:itsolutions.team/presentation/pages/portfolio/portfolio_page.dart';
import 'package:itsolutions.team/presentation/widgets/circular_container.dart';
import 'package:itsolutions.team/presentation/widgets/content_wrapper.dart';
import 'package:itsolutions.team/presentation/widgets/menu_list.dart';
import 'package:itsolutions.team/presentation/widgets/spaces.dart';
import 'package:itsolutions.team/presentation/widgets/trailing_info.dart';
import 'package:itsolutions.team/values/values.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
//  GlobalKey imageKey = GlobalKey();
//  double offsetRoleLeaf;
//
//  @override
//  void initState() {
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      _getSizeOfImage();
//    });
//    super.initState();
//  }
//
//  _getSizeOfImage() {
//    final RenderBox imageRenderBox = imageKey.currentContext.findRenderObject();
//    final imageSize = imageRenderBox.size.height;
//    setState(() {
//      print("Size ${imageRenderBox.size}");
//      offsetRoleLeaf = 0;
//    });
//  }

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = new Completer<ui.Image>();
    AssetImage(ImagePath.DEV).resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool _) {
          completer.complete(image.image);
        },
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double widthOfImage = assignWidth(context: context, fraction: 0.4);

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.5),
                      color: AppColors.primaryColor,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Sizes.MARGIN_20,
                          top: Sizes.MARGIN_20,
                          bottom: Sizes.MARGIN_20,
                        ),
                        child: MenuList(
                          menuList: Data.menuList,
                          selectedItemRouteName: HomePage.homePageRoute,
                        ),
                      ),
                    ),
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.5),
                      color: AppColors.secondaryColor,
                      child: TrailingInfo(
                        onLeadingWidgetPressed: () {
                          Functions.launchUrl(StringConst.EMAIL_URL);
//                          Navigator.pushNamed(
//                            context,
//                            ContactPage.contactPageRoute,
//                          );
                        },
                        leadingWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              StringConst.SEND_ME_A_MESSAGE,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SpaceW8(),
                            CircularContainer(
                              width: Sizes.WIDTH_24,
                              height: Sizes.HEIGHT_24,
                              color: AppColors.primaryColor,
                              child: Icon(
                                Icons.email,
                                color: AppColors.secondaryColor,
                                size: Sizes.ICON_SIZE_20,
                              ),
                            )
                          ],
                        ),
                        onTrailingWidgetPressed: () {
                          Navigator.pushNamed(
                            context,
                            PortfolioPage.portfolioPageRoute,
                          );
                        },
                        trailingWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              StringConst.VIEW_PORTFOLIO,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SpaceW8(),
                            CircularContainer(
                              color: AppColors.primaryColor,
                              width: Sizes.WIDTH_24,
                              height: Sizes.HEIGHT_24,
                              child: Icon(
                                Icons.chevron_right,
                                color: AppColors.secondaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          isDisplaySmallDesktop(context)?
              // ? FutureBuilder<ui.Image>(
              //     future: _getImage(),
              //     builder:
              //         (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
              //       if (snapshot.hasData) {
              //         ui.Image image = snapshot.data!;
                       Positioned(
                        top: assignHeight(context: context, fraction: 0.0),
                         left: assignWidth(context: context, fraction: 0.51) -
                             widthOfImage / 2,
                        child: Container(
                          child: Image.asset(
                            ImagePath.DEV,
                            width: widthOfImage,
                            height:
                                assignHeight(context: context, fraction: 1.0),
                            fit: BoxFit.fitHeight,
                            scale: 1.0,
                          ),
                        ),
                      )
                //     } else {
                //       return Text('Loading...');
                //     }
                //   },
                // )
              : Positioned(
                  top: assignHeight(context: context, fraction: 0.05),
                  left: assignWidth(context: context, fraction: 0.51) -
                      widthOfImage / 2,
                  child: Container(
                    //child: Lottie.asset('lottie/developer.json',width: widthOfImage, height: assignHeight(context: context, fraction: 1),fit: BoxFit.cover,),
                    child: SimpleShadow(
                      opacity: 0.6,
                      color: AppColors.primaryColor,
                      //offset: Offset(2, 2),
                      sigma: 10,
                      child: Image.asset(
                        ImagePath.DEV,
                        width: widthOfImage,
                        height: assignHeight(context: context, fraction: 1),
                        fit: BoxFit.cover,
                        scale: 2.0,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

//          Positioned(
////            key: imageKey,
//            top: assignHeight(context: context, fraction: 0.0),
//            left: assignWidth(context: context, fraction: 0.5) - 600 / 2,
//            child: Container(
////              color: Colors.red,
//              child: Image.asset(
//                ImagePath.DEV,
//                width: 600,
//                height: assignHeight(context: context, fraction: 1),
//                fit: BoxFit.cover,
//                scale: 2.0,
//              ),
//            ),
//          ),
