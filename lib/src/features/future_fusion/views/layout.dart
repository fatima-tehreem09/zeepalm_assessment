import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zeepalm_assessment/src/const/assets.dart';
import 'package:zeepalm_assessment/src/features/future_fusion/widgets/membership.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/app_bar.dart';
import 'package:zeepalm_assessment/src/widgets/tab_bar.dart';

import '../widgets/content.dart';

class BasicLayout extends ConsumerStatefulWidget {
  const BasicLayout.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const String routeName = 'layout';
  static const String routePath = '/layout';

  @override
  ConsumerState createState() => _BasicLayoutState();
}

class _BasicLayoutState extends ConsumerState<BasicLayout>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: _controller.index == 2 ? "Content" : "Membership",
        actionWidget: InkWell(
          onTap: () {},
          child: SvgPicture.asset(
              _controller.index == 2 ? AppAssets.search : AppAssets.ask),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarWidget(
              controller: _controller,
              tabs: const [
                Tab(
                  text: 'Membership Plans',
                ),
                Tab(
                  text: 'Benefits',
                ),
                Tab(
                  text: 'Articles',
                ),
                Tab(
                  text: 'Billing',
                ),
                Tab(
                  text: 'Galleries',
                ),
                Tab(
                  text: 'Announcements',
                ),
              ],
            ),
            19.53.height,
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: const [
                  Membership(),
                  Text("data"),
                  Content(),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
