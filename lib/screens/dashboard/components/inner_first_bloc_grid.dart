import 'dart:math';

import 'package:clairvoyant/data/models/investments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final MyInvestment info;

  @override
  State<InfoCard> createState() => _FileInfoCardState();
}

class _FileInfoCardState extends State<InfoCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(startAnim ? 0 : screenWidth, 0, 0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.add_chart_outlined,color: widget.info.color,size: 40,),
          ProgressLine(
            color: widget.info.color,
            percentage: 100,//widget.info.percentage,
          ),
          Center(
            child: Text(
              widget.info.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Text(
            widget.info.balanceAmount!,
            style: TextStyle(fontSize: 14, color: Colors.white)
          ),

        ],
      ),
    );
  }
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
            height: 5,
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
