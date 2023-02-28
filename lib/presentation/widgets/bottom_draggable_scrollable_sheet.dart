import 'package:flutter/material.dart';
import 'package:itsolutions.team/core/layout/adaptive.dart';
import 'package:itsolutions.team/presentation/widgets/skill_level.dart';
import 'package:itsolutions.team/presentation/widgets/spaces.dart';
import 'package:itsolutions.team/values/values.dart';

import 'horizontal_bar.dart';

class BottomDraggableScrollableSheet extends StatefulWidget {
  BottomDraggableScrollableSheet({
    this.initialChildSize = 0.08,
    this.maxChildSize = 0.6,
    this.minChildSize = 0.08,
    this.backgroundColor = AppColors.primaryColor,
  });

  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Color backgroundColor;

  @override
  _BottomDraggableScrollableSheetState createState() =>
      _BottomDraggableScrollableSheetState();
}

class _BottomDraggableScrollableSheetState
    extends State<BottomDraggableScrollableSheet> {
  bool isEducationSelected = false;

  bool isKeySkillsSelected = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle selectedItem = theme.textTheme.bodyLarge!.copyWith(
      color: AppColors.accentColor2,
    );
    TextStyle unselectedItem = theme.textTheme.bodyLarge!.copyWith(
      color: AppColors.secondaryColor,
    );
    return DraggableScrollableSheet(
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          color: widget.backgroundColor,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SpaceH8(),
                HorizontalBar(
                  color: AppColors.secondaryColor,
                  margin: EdgeInsets.only(right: 8),
                  width: 40,
                  height: 2,
                ),
                SpaceH8(),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: _switchTabs,
                        child: Text(
                          StringConst.KEY_SKILLS,
                          style: isKeySkillsSelected
                              ? selectedItem
                              : unselectedItem,
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        width: 24,
                        color: AppColors.complimentColor2,
                      ),
                      InkWell(
                        onTap: _switchTabs,
                        child: Text(
                          StringConst.EDUCATION,
                          style: isEducationSelected
                              ? selectedItem
                              : unselectedItem,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.PADDING_16,
                    vertical: Sizes.PADDING_16,
                  ),
                  child: Column(
                    children: [
                      isKeySkillsSelected
                          ? _buildSkillsSection(skills: Data.skillData)
                          : Container(),
                      isEducationSelected
                          ? Text(
                              StringConst.EDUCATION_TEXT,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: Sizes.TEXT_SIZE_18,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _switchTabs() {
    setState(() {
      isKeySkillsSelected = !isKeySkillsSelected;
      isEducationSelected = !isEducationSelected;
    });
  }

  Widget _buildSkillsSection({required List<SkillData> skills}) {
    List<Widget> skillWidgets = [];
    ThemeData theme = Theme.of(context);
    for (var index = 0; index < skills.length; index++) {
      skillWidgets.add(
        SkillLevel(
          width: assignWidth(context: context, fraction: 0.4),
          skillLevel: skills[index].skillLevel,
          skillName: skills[index].skillName,
          progressColor: AppColors.complimentColor2,
          baseColor: AppColors.accentColor,
          textStyle: theme.textTheme.bodyLarge!
              .copyWith(color: AppColors.secondaryColor),
          skillNameTextStyle: theme.textTheme.bodyLarge!
              .copyWith(color: AppColors.secondaryColor),
        ),
      );
    }
    return Wrap(
//      spacing: 8,
      runSpacing: 8,
      children: [
        ...skillWidgets,
      ],
    );
  }
}
