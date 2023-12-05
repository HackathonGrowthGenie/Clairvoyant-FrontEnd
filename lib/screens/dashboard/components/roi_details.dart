import 'package:clairvoyant/data/models/historical_returns_model.dart';
import 'package:clairvoyant/data/models/popularInvestment_model.dart';
import 'package:clairvoyant/logic/cubits/performing_investment/performing_inv_cubit.dart';
import 'package:clairvoyant/logic/cubits/performing_investment/performing_inv_state.dart';
import 'package:clairvoyant/logic/cubits/popular_investment/popularInv_cubit.dart';
import 'package:clairvoyant/logic/cubits/popular_investment/popularInv_state.dart';
import 'package:clairvoyant/screens/dashboard/cubits/historical_returns/historical_returns_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/historical_returns/historical_returns_state.dart';
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
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return popularItem(index, width, state.customer);
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
  Widget popularItem(int index, double width, List<PopularInvestmentModel> list) {
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
      child: Column(
        children: [
          Text("Fix Deposits and Investor Count", style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width:0.5, color: Colors.white,),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Monthly FD Customer Numbers",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].fixedDeposits?.monthly.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Quarterly FD Customer Numbers",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].fixedDeposits?.quarterly.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yearly FD Customer Numbers",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].fixedDeposits?.yearly.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40,),
          Text("Mutual Funds and Investor Count", style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width:0.5, color: Colors.white,),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Aditya Birla SunLife MutualFund",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].mutualFunds?.adityaBirlaSunLifeMutualFund.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Axis Mutual Fund",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].mutualFunds?.axisMutualFund.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Canara Robeco MutualFund",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].mutualFunds?.canaraRobecoMutualFund.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width:0.5, color: Colors.white,),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "iCICI Prudential Mutual Fund",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].mutualFunds?.iCICIPrudentialMutualFund.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SBI Mutual Fund",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].mutualFunds?.sBIMutualFund.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kotak Mahindra Mutual Fund",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].mutualFunds?.kotakMahindraMutualFund.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40,),
          Text("Stocks and Customer Count", style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width:0.5, color: Colors.white,),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bajaj Finance",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].stocks?.bajajFinservLimited.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Adani Ports And Special Economic Zone Limited",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].stocks?.adaniPortsAndSpecialEconomicZoneLimited.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HDFC Bank Limited",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].stocks?.hDFCBankLimited}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width:0.5, color: Colors.white,),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hero Moto Corp",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].stocks?.heroMotoCorpLimited.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cipla Limited",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].stocks?.ciplaLimited.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Wipro Limited",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${list[index].stocks?.wiproLimited}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
          MyInvestmentLegends(
            title: "Tax Assessment",
            numOfTransactions: 2,
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
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
        Card(
          elevation: 5,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${list.first.mutualFunds![index].fundName.toString()} - Net Asset Value: ${list.first.mutualFunds![index].nav.toString()}'),
                Text('${list.first.fixedDeposits![index].fundName.toString()} - Net Asset Value: ${list.first.fixedDeposits![index].nav.toString()}'),
                Text('${list.first.stocks![index].stockName.toString()} - Returns: ${list.first.stocks![index].returns.toString()}'),
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
}
