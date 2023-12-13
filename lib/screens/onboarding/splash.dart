import 'package:clairvoyant/screens/dashboard/dashboard_screen.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_bloc.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_state.dart';
import 'package:clairvoyant/screens/onboarding/bloc/loginBloc/login_bloc.dart';
import 'package:clairvoyant/screens/onboarding/client_selection.dart';
import 'package:clairvoyant/screens/onboarding/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/clientBloc/clientSelection_event.dart';
import 'main_screen.dart';
class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    switchPush();
    super.initState();
  }

  switchPush() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(milliseconds: 7000), () {
      if(prefs.getString('clientId') == null){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: Login(),
            )
        ),
      );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => MainScreen()
          ),
        );
        BlocProvider.of<ClientSelectionBloc>(context).add(
            ClientSubmittedEvent(prefs.getString('clientId').toString())
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              "assets/images/clair-logo.png",
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ]);
  }
}