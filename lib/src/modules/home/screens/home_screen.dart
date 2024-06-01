import 'package:flutter/material.dart';
import 'package:gemini_ai_apparel_shop/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'active_tab.dart';
import 'casual_tab.dart';
import 'formal_tab.dart';
import 'streetwear_tab.dart';

class HomeScreen extends StatefulWidget {
  final int tabIndex;
  const HomeScreen({super.key, this.tabIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
//initialize a tab controller to animate tab programmatically
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 4, initialIndex: widget.tabIndex);
  }
  //if the old tab index is not same as the new tab index, animate to the new index
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabIndex != widget.tabIndex) {
      _tabController.animateTo(widget.tabIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('the current tab index in home screen is ${widget.tabIndex}');
    return DefaultTabController(
      initialIndex: widget.tabIndex,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Trendify',
            style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TabBar(
                  controller: _tabController,
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return primaryColor; // Color when pressed
                    }
                    if (states.contains(WidgetState.hovered)) {
                      return primaryColor; // Color when hovered
                    }
                    return secondaryColor; // Default color
                  }),
                  labelColor: secondaryColor,
                  indicatorColor: secondaryColor,
                  tabs: const [
                    Tab(
                      text: 'Casual',
                    ),
                    Tab(
                      text: 'Formal',
                    ),
                    Tab(
                      text: 'Active',
                    ),
                    Tab(
                      text: 'Street wear',
                    ),
                  ]),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    //1st tab
                    CasualTab(),
                    //2nd tab
                    FormalTab(),
                    //3rd tab
                    ActiveTab(),
                    //4th tab
                    StreetwearTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
