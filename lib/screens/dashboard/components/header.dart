import 'package:clairvoyant/data/models/post_model.dart';
import 'package:clairvoyant/screens/onboarding/main_screen.dart';
import 'package:clairvoyant/screens/onboarding/splash.dart';
import 'package:clairvoyant/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import '../../onboarding/client_selection.dart';

class Header extends StatelessWidget {
  const Header(this.customer);
  final List<CustomerModel> customer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu), onPressed: () {  },
            //onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // Expanded(child: SearchField()),
        ProfileCard(customer)
      ],
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard(this.customer);
  final List<CustomerModel> customer;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool userLogout = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          (widget.customer.first.gender.toString()) == "F" ?
    InkWell(
        onTap: (){
          setState(() {
            userLogout = !userLogout;
          });
        },
        child: Image.asset("assets/images/profile_pic.png")
    ):
          InkWell(
              onTap: (){
                setState(() {
                  userLogout = !userLogout;
                });
              },
              child: Image.asset("assets/images/profile_man_pic.png")),
          SizedBox(width: 15,),
          // Text("Welcome ${customer.first.firstName}"),
          // if (!Responsive.isMobile(context))
            userLogout?
            InkWell(
              onTap: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Splash(),
                  ),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    child: Text("Logout"),
                  ),
                  Icon(Icons.power_settings_new, color: Colors.grey,),
                ],
              ),
            ):
            InkWell(
              onTap: (){
                setState(() {
                  userLogout = !userLogout;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    child: Text("Welcome ${widget.customer.first.firstName}"),
                  ),
                  Icon(Icons.keyboard_double_arrow_down, color: Colors.grey,),
                ],
              ),
            ),

        ],
      )

    );
  }
}
