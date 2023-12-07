import 'package:clairvoyant/data/models/historical_returns_model.dart';
import 'package:clairvoyant/data/models/popularInvestment_model.dart';
import 'package:clairvoyant/data/models/tax_calculation_model.dart';
import 'package:clairvoyant/logic/cubits/performing_investment/performing_inv_cubit.dart';
import 'package:clairvoyant/logic/cubits/performing_investment/performing_inv_state.dart';
import 'package:clairvoyant/logic/cubits/popular_investment/popularInv_cubit.dart';
import 'package:clairvoyant/logic/cubits/popular_investment/popularInv_state.dart';
import 'package:clairvoyant/screens/dashboard/cubits/historical_returns/historical_returns_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/historical_returns/historical_returns_state.dart';
import 'package:clairvoyant/screens/dashboard/cubits/tax_assessment/tax_assessment_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/tax_assessment/tax_assessment_state.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_bloc.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/topPerformingInvestment_model.dart';
import '../../../utils/constants.dart';
import '../../onboarding/bloc/clientBloc/clientSelection_event.dart';
import 'chart.dart';
import 'investment_legends.dart';

class StorageDetails extends StatefulWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<StorageDetails> createState() => _StorageDetailsState();
}

class _StorageDetailsState extends State<StorageDetails> {
  var width = 0.0;
  _popularInvModal(BuildContext context, width) {
    showDialog(
        context: context,
        builder: (_) =>
        new Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: new Container(
                alignment: FractionalOffset.center,
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: Color(0xFF22AB92),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      new Image.asset(
                        'assets/images/clair-logo.png',
                        fit: BoxFit.cover,
                      ),
                      Text("POPULAR INVESTMENTS LISTS", style: TextStyle(fontSize: 24),),
                      SizedBox(height: 20,),
                      BlocConsumer<PopularInvCubit, PopularInvestState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is PopularInvLoadedState){
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemCount: state.customer.length,
                                itemBuilder: (context, index) {
                                  final detail = state.customer[index];
                                  return Column(
                                    children: [
                                      SizedBox(height: 20,),
                                      Text('MUTUAL FUNDS',style: TextStyle(fontSize: 20),),
                                      SizedBox(height: 20,),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: detail.mutualFunds.length,
                                        itemBuilder: (context, index) {
                                          final fundName = detail.mutualFunds.keys.elementAt(index);
                                          final fundAmount = detail.mutualFunds.values.elementAt(index);
                                          return SizedBox(
                                            height: 60,
                                            child: Card(
                                              elevation: 5,
                                              child: Card(
                                                elevation: 10,
                                                child: Center(
                                                    child: Text('$fundName: $fundAmount')),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 20,),
                                      Text('Stocks',style: TextStyle(fontSize: 20),),
                                      SizedBox(height: 20,),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: detail.stocks.length,
                                        itemBuilder: (context, index) {
                                          final stockName = detail.stocks.keys.elementAt(index);
                                          final stockAmount = detail.stocks.values.elementAt(index);
                                          return SizedBox(
                                            height: 60,
                                            child: Card(
                                              elevation: 5,
                                              child: Card(
                                                elevation: 10,
                                                child: Center(
                                                    child: Text('$stockName: $stockAmount')),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 20,),
                                      Text('Fixed Deposits',style: TextStyle(fontSize: 20),),
                                      SizedBox(height: 20,),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: detail.fixedDeposits.length,
                                        itemBuilder: (context, index) {
                                          final depositOption = detail.fixedDeposits.keys.elementAt(index);
                                          final depositRate = detail.fixedDeposits.values.elementAt(index);
                                          return SizedBox(
                                            height: 60,
                                            child: Card(
                                              elevation: 5,
                                              child: Card(
                                                elevation: 10,
                                                child: Center(
                                                    child: Text('$depositOption: $depositRate')),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }else if(state is PopularInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),

                )
            ),
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ROI Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          InkWell(
            onTap: () {
              _popularInvModal(context, width);
            },
            child: MyInvestmentLegends(
              title: "Popular Investments",
              numOfTransactions: 15,
            ),
          ),
          InkWell(
            onTap: (){
              _performingInvModal(context, width);
            },
            child: MyInvestmentLegends(
              title: "Top Performing Investments",
              numOfTransactions: 10,
            ),
          ),
          InkWell(
            onTap: (){
              _historicalReturnsModel(context, width);
            },
            child: MyInvestmentLegends(
              title: "Historical Returns",
              numOfTransactions: 6,
            ),
          ),
          InkWell(
            onTap: (){
              _taxAssessmentModel(context, width);
            },
            child: MyInvestmentLegends(
              title: "Tax Assessment",
              numOfTransactions: 2,
            ),
          ),
        ],
      ),
    );
  }
  _performingInvModal(BuildContext context, width) {
    showDialog(
        context: context,
        builder: (_) =>
        new Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: new Container(
                alignment: FractionalOffset.center,
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: Color(0xFF22AB92),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      new Image.asset(
                        'assets/images/clair-logo.png',
                        fit: BoxFit.cover,
                      ),
                      Text("TOP PERFORMING INVESTMENTS", style: TextStyle(fontSize: 24),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Text("MUTUAL FUNDS",style: TextStyle(fontSize: 16),),
                        Text("FIX DEPOSITS",style: TextStyle(fontSize: 16),),
                        Text("STOCKS",style: TextStyle(fontSize: 16),)
                      ],),
                      BlocConsumer<PerformingInvCubit, PerfermingInvestState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is PerformingInvLoadedState){
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return performingItem(index, width, state.customer);
                              },
                            );
                          }else if(state is PopularInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }

                        },
                      ),
                    ],
                  ),

                )
            ),
          ),
        ));
  }

  _historicalReturnsModel(BuildContext context, width) {
    showDialog(
        context: context,
        builder: (_) =>
        new Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: new Container(
                alignment: FractionalOffset.center,
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: Color(0xFF22AB92),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      new Image.asset(
                        'assets/images/clair-logo.png',
                        fit: BoxFit.cover,
                      ),
                      Text("HISTORICAL RETURNS", style: TextStyle(fontSize: 24),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("ID",style: TextStyle(fontSize: 16),),
                          Text("NAME",style: TextStyle(fontSize: 16),),
                          Text("DATE - TIME",style: TextStyle(fontSize: 16),),
                          Text("RETURN VALUE",style: TextStyle(fontSize: 16),)
                        ],),
                      BlocConsumer<HistoricalReturnsCubit, HistoricalReturnState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is HistoricalReturnLoadedState){
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return historicalReturnItem(index, width, state.customer);
                              },
                            );
                          }else if(state is PopularInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }

                        },
                      ),
                    ],
                  ),

                )
            ),
          ),
        ));
  }

  Widget performingItem(int index, double width, List<TopPerformingInvestment> list) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: list.first.mutualFunds?.length,
      itemBuilder: (context, index) {
        return formingItem(index, width, list);
      },
    )
    );
  }
  formingItem(index, width, List<TopPerformingInvestment>list){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 0.5,
            width: width,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 90,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('${list.first.mutualFunds![index].fundName.toString()} - Net Asset Value: ${list.first.mutualFunds![index].nav.toString()}')),
                Expanded(child: Text('${list.first.fixedDeposits![index].fundName.toString()} - Net Asset Value: ${list.first.fixedDeposits![index].nav.toString()}')),
                Expanded(child: Text('${list.first.stocks![index].stockName.toString()} - Returns: ${list.first.stocks![index].returns.toString().split('.')[0]} %')),
              ],
            ),
          ),
        ),
      ],
    );
  }
  historicalReturnItem(index, width, List<HistoricalReturnsModel>list){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 0.5,
            width: width,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 60,
          child: Card(
            elevation: 5,
            child: Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${list[index].customerId.toString()}'),
                  Text('${list[index].customerName.toString()}'),
                  Text('${list[index].currentDate?.split('T')[0]} ${list[index].currentDate?.split('T')[1].split('.')[0]}'),
                  Text('${list[index].returnValue.toString()}'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  _taxAssessmentModel(BuildContext context, width) {
    showDialog(
        context: context,
        builder: (_) =>
        new Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: new Container(
                alignment: FractionalOffset.center,
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: Color(0xFF22AB92),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      new Image.asset(
                        'assets/images/clair-logo.png',
                        fit: BoxFit.cover,
                      ),
                      Text("TAX ASSESSMENT", style: TextStyle(fontSize: 24),),
                      SizedBox(height: 20,),
                      BlocConsumer<TaxAssessmentCubit, TaxAssessmentState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is TaxAssessmentLoadedState){
                            var list = state.customer;
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text("NAME",style: TextStyle(fontSize: 16),),
                                    Text('${list.first.name.toString()}'),
                                    SizedBox(height: 20,),
                                    Text("TOTAL TAX RETURNS",style: TextStyle(fontSize: 16)),
                                    Text('${list.first.totalTax ?? 0.0}'),
                                    SizedBox(height: 20,),
                                    Text("STOCKS RETURNS",style: TextStyle(fontSize: 16),),
                                    Text('${list[index].taxTypeReturn?.stocks ?? 0.0}'),
                                    SizedBox(height: 20,),
                                    Text("MUTUAL FUNDS RETURNS",style: TextStyle(fontSize: 16),),
                                    Text('${list[index].taxTypeReturn?.mutualFunds ?? 0.0}'),
                                    SizedBox(height: 20,),
                                    Text("FD RETURNS",style: TextStyle(fontSize: 16),),
                                    Text('${list[index].taxTypeReturn?.fixDeposits ?? 0.0}')
                                  ],
                                );
                              },
                            );
                          }else if(state is PopularInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }

                        },
                      ),
                    ],
                  ),

                )
            ),
          ),
        ));
  }
}


