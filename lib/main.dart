import 'package:clairvoyant/logic/cubits/performing_investment/performing_inv_cubit.dart';
import 'package:clairvoyant/logic/cubits/popular_investment/popularInv_cubit.dart';
import 'package:clairvoyant/logic/cubits/top_investor/top_investor_cubit.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_bloc.dart';
import 'package:clairvoyant/utils/constants.dart';
import 'package:clairvoyant/screens/onboarding/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopInvestCubit(),
        ),
        BlocProvider(
          create: (context) => ClientSelectionBloc(),
        ),
        BlocProvider(
          create: (context) => PopularInvCubit(),
        ),
        BlocProvider(
          create: (context) => PerformingInvCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clairvoyant Dashboard',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme
                .of(context)
                .textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
          home: Splash()
      ),
    );
  }
}
