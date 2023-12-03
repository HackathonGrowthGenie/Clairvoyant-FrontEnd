import 'package:clairvoyant/utils/constants.dart';
import 'package:clairvoyant/controllers/MenuAppController.dart';
import 'package:clairvoyant/utils/responsive.dart';
import 'package:clairvoyant/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text("CLAIRVOYANT HACKATHOON",
              textAlign: TextAlign.center,
              style: GoogleFonts.quattrocentoSans(
                  color: Colors.red,
                  letterSpacing: 20,
                  fontSize: 16,
                  fontWeight: FontWeight.w900
              )
          ),
        ),
      ),
      //key: context.read<MenuAppController>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
