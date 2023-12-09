
import 'package:clairvoyant/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants.dart';
import '../../cubits/top_investor/top_investor_cubit.dart';
import '../../cubits/top_investor/top_investor_state.dart';
import '../inner_grid.dart';
import 'my_investments.dart';

class TopInvestorsGrid extends StatelessWidget {
  const TopInvestorsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: TopInvestorsView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: TopInvestorsView(),
          desktop: TopInvestorsView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class TopInvestorsView extends StatelessWidget {
  const TopInvestorsView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopInvestCubit, TopInvestorState>(
      builder: (context, state) {
        if(state is PostLoadedState){
          var investor = state.customer;
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: investor.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) =>
                InvestorsCard(info: investor[index]),
          );
        }
        else if(state is PostLoadingState){
          return CircularProgressIndicator();
        }
        else{
          return Container();
        }
      },
    );
  }
}
