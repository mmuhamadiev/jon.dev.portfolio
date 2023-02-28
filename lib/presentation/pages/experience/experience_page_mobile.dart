import 'package:flutter/material.dart';
import 'package:itsolutions.team/presentation/pages/experience/experience_page.dart';
import 'package:itsolutions.team/presentation/widgets/app_drawer.dart';
import 'package:itsolutions.team/presentation/widgets/custom_app_bar.dart';
import 'package:itsolutions.team/presentation/widgets/experience_section.dart';
import 'package:itsolutions.team/values/values.dart';

class ExperiencePageMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: Data.experienceData.length,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.secondaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: CustomAppBar(
            title: StringConst.WORK,
            onLeadingPressed: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            bottom: TabBar(
              tabs: _buildTabBar(Data.experienceData),
              indicatorColor: AppColors.complimentColor2,
              labelColor: AppColors.secondaryColor,
              labelPadding: EdgeInsets.all(Sizes.PADDING_8),
              labelStyle: theme.textTheme.titleLarge!.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: AppColors.accentColor2,
              unselectedLabelStyle: theme.textTheme.bodyLarge!.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [],
          ),
        ),
        drawer: AppDrawer(
          menuList: Data.menuList,
          selectedItemRouteName: ExperiencePage.experiencePageRoute,
        ),
        body: TabBarView(
          children: _buildTabContent(Data.experienceData),
        ),
      ),
    );
  }

  List<Widget> _buildTabBar(List<ExperienceData> experienceData) {
    List<Widget> tabBarItems = [];
    for (var index = 0; index < experienceData.length; index++) {
      tabBarItems.add(
        Text(experienceData[index].company!),
      );
    }
    return tabBarItems;
  }

  List<Widget> _buildTabContent(List<ExperienceData> experienceData) {
    List<Widget> tabContent = [];
    for (var index = 0; index < experienceData.length; index++) {
      tabContent.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceSection(
            position: experienceData[index].position,
            company: experienceData[index].company,
            duration: experienceData[index].duration,
            location: experienceData[index].location,
            roles: experienceData[index].roles,
            companyUrl: experienceData[index].companyUrl,
          ),
        ),
      );
    }
    return tabContent;
  }
}

//      body: Container(
//        padding: EdgeInsets.symmetric(
//          horizontal: Sizes.PADDING_16,
//          vertical: Sizes.PADDING_16,
//        ),
//        child: ListView.separated(
//          itemCount: Data.experienceData.length,
//          separatorBuilder: (BuildContext context, int index) {
//            return SpaceH30();
//          },
//          itemBuilder: (BuildContext context, int index) {
//            return ExperienceColumn(
//              duration: Data.experienceData[index].duration,
//              position: Data.experienceData[index].position,
//              company: Data.experienceData[index].company,
//              location: Data.experienceData[index].location,
//              role: Data.experienceData[index].role,
//              onTap: () {
//                Functions.launchUrl(Data.experienceData[index].companyUrl);
//              },
//            );
//          },
//        ),
//      )
