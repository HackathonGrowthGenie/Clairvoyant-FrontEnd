import 'package:clairvoyant/utils/constants.dart';
import 'package:flutter/material.dart';

class MyInvestment {
  final String? title, balanceAmount;
  final percentage;
  final Color? color;

  MyInvestment({
    this.title,
    this.percentage,
    this.color,
    this.balanceAmount
  });
}

List MyInvestments = [
  MyInvestment(
    title: "MUTUAL FUND",
    color: primaryColor.withOpacity(0.5),
    percentage: 35,
      balanceAmount: "₹ 500000"
  ),
  MyInvestment(
    title: "STOCKS",
    color: Color(0xFFFFA113).withOpacity(0.5),
    percentage: 35,
      balanceAmount: "₹ 325000"
  ),
  MyInvestment(
    title: "FIX DEPOSITS",
    color: Color(0xFFA4CDFF).withOpacity(0.5),
    percentage: 10,
      balanceAmount: "₹ 590000"
  ),
  MyInvestment(
    title: "LOANS",
    color: Color(0xFF007EE5).withOpacity(0.5),
    percentage: 78,
      balanceAmount: "₹ 856000"
  ),
];
