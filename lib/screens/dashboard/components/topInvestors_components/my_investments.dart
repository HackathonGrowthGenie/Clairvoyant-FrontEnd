import 'dart:math';
import 'package:clairvoyant/data/models/topInvestors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants.dart';

class InvestorsCard extends StatelessWidget {
  final TopInvesters info;
  const InvestorsCard({
    Key? key,
    required this.info
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_balance, color: Colors.brown,size: 60,),
          Text(
            info.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            '${info.investmentType!} - ${info.returns}%',
              overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.grey)
          ),
          Text(
            info.portfolio.toString()!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}


