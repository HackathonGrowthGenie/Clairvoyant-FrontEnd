class ROIModel {
  double? mutualFunds;
  double? stocks;
  double? fixedDeposits;

  ROIModel({this.mutualFunds, this.stocks, this.fixedDeposits});

  ROIModel.fromJson(Map<String, dynamic> json) {
    mutualFunds = json['Mutual Funds'];
    stocks = json['Stocks'];
    fixedDeposits = json['Fixed Deposits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mutual Funds'] = this.mutualFunds;
    data['Stocks'] = this.stocks;
    data['Fixed Deposits'] = this.fixedDeposits;
    return data;
  }
}