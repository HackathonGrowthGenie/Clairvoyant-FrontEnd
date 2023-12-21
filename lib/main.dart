import 'package:clairvoyant/screens/dashboard/cubits/detailed_investments/detailed_inv_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/available_balance_cubit/availablebal_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/historical_returns/historical_returns_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/performing_investment/performing_inv_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/popular_investment/popularInv_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/roi_cubit/roi_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/tax_assessment/tax_assessment_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/top_investor/top_investor_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/transaction_cubit/transaction_cubit.dart';
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
        // BlocProvider(
        //   create: (context) => TransactionCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => AvailableBalCubit(),
        // ),
        BlocProvider(
          create: (context) => HistoricalReturnsCubit(),
        ),
        BlocProvider(
          create: (context) => TaxAssessmentCubit(),
        ),
        // BlocProvider(
        //   create: (context) => ROICubit(),
        // ),
        BlocProvider(
          create: (context) => DetailedInvCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dashboard',
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
