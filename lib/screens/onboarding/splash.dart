import 'package:clairvoyant/screens/onboarding/bloc/loginBloc/login_bloc.dart';
import 'package:clairvoyant/screens/onboarding/client_selection.dart';
import 'package:clairvoyant/screens/onboarding/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: Login(),
          )
        ),
      );
    });
    super.initState();
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