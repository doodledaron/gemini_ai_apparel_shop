import 'package:flutter/material.dart';
import 'package:gemini_ai_apparel_shop/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/item_card.dart';
import 'active_tab.dart';
import 'casual_tab.dart';
import 'formal_tab.dart';
import 'streetwear_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
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
                child: TabBarView(children: [
                  //1st tab
                  CasualTab(),
                  //2nd tab
                  FormalTab(),
                  //3rd tab
                  ActiveTab(),
                  //4th tab
                  StreetwearTab(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



