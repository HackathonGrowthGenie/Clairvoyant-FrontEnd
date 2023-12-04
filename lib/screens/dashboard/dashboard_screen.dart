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
        if(state is ClientIdLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if(state is DataLoadedState){
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
                            MyInvestmentGrid(),
                            SizedBox(height: defaultPadding),
                            RecentFiles(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context)) StorageDetails(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        SizedBox(width: defaultPadding),
                      // On Mobile means if the screen is less than 850 we don't want to show it
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 2,
                          child: StorageDetails(),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }else{
          return Center(child: Text("Something Went Wrong", style: TextStyle(),));
        }

      },
    );
  }
}
