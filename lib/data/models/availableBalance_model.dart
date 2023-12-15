class AvailableBalanceModel {
  double? mutualFunds;
  double? stocks;
  double? fixedDeposits;
  double? loans;

  AvailableBalanceModel({this.mutualFunds, this.stocks, this.fixedDeposits, this.loans});

  AvailableBalanceModel.fromJson(Map<String, dynamic> json) {
    mutualFunds = json['Mutual Funds'];
    stocks = json['Stocks'];
    fixedDeposits = json['Fixed Deposits'];
    loans = json['Loans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mutual Funds'] = this.mutualFunds;
    data['Stocks'] = this.stocks;
    data['Fixed Deposits'] = this.fixedDeposits;
    data['Loans'] = this.loans;
    return data;
  }
}