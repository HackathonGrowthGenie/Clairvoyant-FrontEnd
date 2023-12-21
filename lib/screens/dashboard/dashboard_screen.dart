import 'package:clairvoyant/screens/dashboard/cubits/available_balance_cubit/availablebal_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/roi_cubit/roi_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/transaction_cubit/transaction_cubit.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_bloc.dart';
import 'package:clairvoyant/utils/responsive.dart';
import 'package:clairvoyant/screens/dashboard/components/inner_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';
import '../onboarding/bloc/clientBloc/clientSelection_state.dart';
import 'components/header.dart';

import 'components/transactions.dart';
import 'components/roi_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientSelectionBloc, ClientSelectionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ClientIdLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DataLoadedState) {
          return SafeArea(
            child: SingleChildScrollView(
              primary: false,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Header(state.customer),
                  SizedBox(height: defaultPadding),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            BlocProvider(
                              create: (context) => AvailableBalCubit(),
                              child: MyInvestmentGrid(),
                            ),
                            SizedBox(height: defaultPadding),
                            BlocProvider(
                              create: (context) => TransactionCubit(),
                              child: RecentTran(),
                            ),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context)) BlocProvider(
                              create: (context) => ROICubit(),
                              child: RoiDetails(),
                            ),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        SizedBox(width: defaultPadding),
                      // On Mobile means if the screen is less than 850 we don't want to show it
                      if (!Responsive.isMobile(context))
                        BlocProvider(
                          create: (context) => ROICubit(),
                          child: Expanded(
                            flex: 2,
                            child: RoiDetails(),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
              child: Text("Something Went Wrong", style: TextStyle(),));
        }
      },
    );
  }
}
