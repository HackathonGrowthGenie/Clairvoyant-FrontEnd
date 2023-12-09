import 'package:clairvoyant/screens/dashboard/cubits/available_balance_cubit/availablebal_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/available_balance_cubit/availablebal_state.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_state.dart';
import 'package:clairvoyant/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import 'topInvestors_components/my_investments.dart';

class MyInvestmentGrid extends StatelessWidget {
  const MyInvestmentGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Overview",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: InvestmentCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: InvestmentCardGridView(),
          desktop: InvestmentCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InvestmentCardGridView extends StatefulWidget {

  const InvestmentCardGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<InvestmentCardGridView> createState() => _InvestmentCardGridViewState();
}

class _InvestmentCardGridViewState extends State<InvestmentCardGridView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600), () {
        startAnim = true;
        setState(() {});
    });
    super.initState();
  }

  bool startAnim = false;

  var screenHeignt = 0.0;

  var screenWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    screenHeignt = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<AvailableBalCubit, AvailableBalState>(
      builder: (context, state) {
        if (state is AvailableBalLoadedState) {
          return Container(
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                childAspectRatio: widget.childAspectRatio,
              ),
              children: [
                Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(
                          startAnim ? 0 : screenWidth, 0, 0),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add_chart_outlined,
                            color: Colors.deepPurple.withOpacity(0.5),
                            size: 40,
                          ),
                          SizedBox(height: 10,),
                          ProgressLine(
                            color: Colors.deepPurple.withOpacity(0.5),
                            percentage: 100, //widget.info.percentage,
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: Text(
                              'STOCKS',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text('₹ ${state.customer.first.stocks.toString()}',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(
                          startAnim ? 0 : screenWidth, 0, 0),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add_chart_outlined,
                            color: primaryColor.withOpacity(0.5),
                            size: 40,
                          ),
                          SizedBox(height: 10,),
                          ProgressLine(
                            color: primaryColor.withOpacity(0.5),
                            percentage: 100, //widget.info.percentage,
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: Text(
                              'MUTUAL FUNDS',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text('₹ ${state.customer.first.mutualFunds.toString()}',
                              style:
                              TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(
                          startAnim ? 0 : screenWidth, 0, 0),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add_chart_outlined,
                            color: Colors.redAccent.withOpacity(0.5),
                            size: 40,
                          ),
                          SizedBox(height: 10,),
                          ProgressLine(
                            color: Colors.redAccent.withOpacity(0.5),
                            percentage: 100, //widget.info.percentage,
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: Text(
                              'FIX DEPOSITS',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text('₹ ${state.customer.first.fixedDeposits.toString()}',
                              style:
                              TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class InvType {
  final String? type;
  final int? amount;

  InvType(this.type, this.amount);
}
class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 3,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}