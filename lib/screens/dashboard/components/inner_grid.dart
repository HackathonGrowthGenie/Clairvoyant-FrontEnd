import 'package:clairvoyant/data/models/detailed_inv_model.dart';
import 'package:clairvoyant/screens/dashboard/cubits/detailed_investments/detailed_inv_cubit.dart';
import 'package:clairvoyant/screens/dashboard/cubits/detailed_investments/detailed_inv_state.dart';
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
    this.crossAxisCount = 4,
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

  _stocksInvDetailedModal(BuildContext context, width) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Center(child: Text("STOCK INVESTMENTS DETAILS",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24),)),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("STOCKS", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("PRICE", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("QTY", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("DATE", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),)
                        ],),
                      BlocProvider(
                      create: (context) => DetailedInvCubit(),
                      child: BlocConsumer<DetailedInvCubit, DetailedInvState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is DetailedInvLoadedState){
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return detailedStocks(index, width, state.customer);
                              },
                            );
                          }else if(state is DetailedInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }

                        },
                      ),
),
                    ],
                  ),

                )
            ),
          ),
        ));
  }
  Widget detailedStocks(int index, double width, List<DetailedInvModel> list) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width / 100,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: list.first.stocksDetails?.length,
          itemBuilder: (context, index) {
            return _stocksItem(index, width, list);
          },
        )
    );
  }
  _stocksItem(index, width, List<DetailedInvModel>list){
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
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${list.first.stocksDetails![index].stockSymbol.toString()}', overflow: TextOverflow.ellipsis,),
                Text('₹ ${list.first.stocksDetails![index].purchasePrice.toString()}', overflow: TextOverflow.ellipsis,),
                Text('${list.first.stocksDetails![index].quantity.toString()}'),
                Text('${list.first.stocksDetails![index].purchaseDate.toString().split('T')[0]}', overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _mfInvDetailedModal(BuildContext context, width) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Center(child: Text("MF INVESTMENTS DETAILS",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24),)),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("FUNDS", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("NAV %", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("AMOUNT", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("DATE", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),)
                        ],),
                      BlocProvider(
                      create: (context) => DetailedInvCubit(),
                      child: BlocConsumer<DetailedInvCubit, DetailedInvState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is DetailedInvLoadedState){
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return detailedMf(index, width, state.customer);
                              },
                            );
                          }else if(state is DetailedInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }

                        },
                      ),
),
                    ],
                  ),

                )
            ),
          ),
        ));
  }
  Widget detailedMf(int index, double width, List<DetailedInvModel> list) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width / 100,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: list.first.mutualFundDetails?.length,
          itemBuilder: (context, index) {
            return _mfItem(index, width, list);
          },
        )
    );
  }
  _mfItem(index, width, List<DetailedInvModel>list){
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
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('${list.first.mutualFundDetails![index].fundName.toString()}', overflow: TextOverflow.ellipsis,)),
                Expanded(child: Text('${list.first.mutualFundDetails![index].nav.toString()} %' , overflow: TextOverflow.ellipsis,)),
                Expanded(child: Text('₹ ${list.first.mutualFundDetails![index].investmentAmount.toString()}', overflow: TextOverflow.ellipsis,)),
                Expanded(child: Text('${list.first.mutualFundDetails![index].investmentDate.toString().split('T')[0]}', overflow: TextOverflow.ellipsis,)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _fdInvDetailedModal(BuildContext context, width) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Center(child: Text("FD INVESTMENTS DETAILS",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24),)),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("INV ID", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("INT RATE", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("MATURITY AMT", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),),
                          Text("FREQ", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),)
                        ],),
                      BlocProvider(
                      create: (context) => DetailedInvCubit(),
                      child: BlocConsumer<DetailedInvCubit, DetailedInvState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is DetailedInvLoadedState){
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return detailedFd(index, width, state.customer);
                              },
                            );
                          }else if(state is DetailedInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }

                        },
                      ),
),
                    ],
                  ),

                )
            ),
          ),
        ));
  }
  Widget detailedFd(int index, double width, List<DetailedInvModel> list) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width / 100,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: list.first.fixedDepositsDetails?.length,
          itemBuilder: (context, index) {
            return _fdItem(index, width, list);
          },
        )
    );
  }
  _fdItem(index, width, List<DetailedInvModel>list){
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
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${list.first.fixedDepositsDetails![index].fixedDepositId.toString()}' , overflow: TextOverflow.ellipsis,),
                Text('${list.first.fixedDepositsDetails![index].interestRate.toString()} %', overflow: TextOverflow.ellipsis,),
                Text('₹ ${list.first.fixedDepositsDetails![index].maturityAmount.toString()}', overflow: TextOverflow.ellipsis,),
                Text('${list.first.fixedDepositsDetails![index].interestPaymentFrequency.toString().split('T')[0]}', overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
                    InkWell(
                      onTap: (){
                        _stocksInvDetailedModal(context, screenWidth);
                      },
                      child: AnimatedContainer(
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
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        _mfInvDetailedModal(context, screenWidth);
                      },
                      child: AnimatedContainer(
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
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        _fdInvDetailedModal(context, screenWidth);
                      },
                      child: AnimatedContainer(
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
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        _loanDetailedModal(context, screenWidth);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
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
                              color: Colors.greenAccent.withOpacity(0.5),
                              size: 40,
                            ),
                            SizedBox(height: 10,),
                            ProgressLine(
                              color: Colors.greenAccent.withOpacity(0.5),
                              percentage: 100, //widget.info.percentage,
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Text(
                                'Loans',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('₹ ${state.customer.first.loans.toString()}',
                                style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                          ],
                        ),
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
  _loanDetailedModal(BuildContext context, width) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Center(child: Text("LOAN DETAILS",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24),)),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("LOAN", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,),)),
                          Expanded(child: Text("INTEREST RATE", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,),)),
                          Expanded(child: Text("MATURITY AMOUNT", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,),)),
                          Expanded(child: Text("STATUS", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,),))
                        ],),
                      BlocProvider(
                      create: (context) => DetailedInvCubit(),
                      child: BlocConsumer<DetailedInvCubit, DetailedInvState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is DetailedInvLoadedState){
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.customer.length,
                              itemBuilder: (context, index) {
                                return detailedLoan(index, width, state.customer);
                              },
                            );
                          }else if(state is DetailedInvLoadingState){
                            return CircularProgressIndicator();
                          }else{
                            return Container();
                          }

                        },
                      ),
),
                    ],
                  ),

                )
            ),
          ),
        ));
  }
  Widget detailedLoan(int index, double width, List<DetailedInvModel> list) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width / 100,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child:
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: list.first.loansDetails?.length,
          itemBuilder: (context, index) {
            return _loanItem(index, width, list);
          },
        )
    );
  }
  _loanItem(index, width, List<DetailedInvModel>list){
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
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${list.first.loansDetails![index].loanType.toString()}', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,)),
                Text('${list.first.loansDetails![index].interestRate.toString()} %', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,)),
                Text('₹ ${list.first.loansDetails![index].loanAmount.toString()}', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,)),
                Text('${list.first.loansDetails![index].loanStatus.toString().split('T')[0]}', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis,)),
              ],
            ),
          ),
        ),
      ],
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