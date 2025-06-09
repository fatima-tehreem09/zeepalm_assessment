import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/colors.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.controller,
    required this.tabs,
  });

  final TabController controller;
  final List<Tab> tabs;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      isScrollable: true,
      splashBorderRadius: BorderRadius.circular(0),
      // indicatorPadding: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 30.13, vertical: 17.13),
      controller: widget.controller,
      unselectedLabelColor: AppColors.lightText,
      splashFactory: NoSplash.splashFactory,
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        color: AppColors.lightText,
        fontSize: 14,
      ),
      indicatorColor: AppColors.primaryPink,
      labelStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        color: AppColors.primaryPink,
        fontSize: 14.86,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppColors.primaryPink,
      onTap: (w) {
        setState(() {});
      },
      tabs: widget.tabs.map((Tab tab) {
        print('-----');
        print(widget.controller.index);
        print(widget.tabs.indexOf(tab));

        return tab;
      }).toList(),
    );
  }
}
