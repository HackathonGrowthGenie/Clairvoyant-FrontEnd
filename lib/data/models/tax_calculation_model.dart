class TaxAssesmentModel {
  int? customerId;
  String? name;
  TaxTypeReturn? taxTypeReturn;
  double? totalTax;

  TaxAssesmentModel(
      {this.customerId, this.name, this.taxTypeReturn, this.totalTax});

  TaxAssesmentModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    name = json['name'];
    taxTypeReturn = json['taxTypeReturn'] != null
        ? new TaxTypeReturn.fromJson(json['taxTypeReturn'])
        : null;
    totalTax = json['totalTax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['name'] = this.name;
    if (this.taxTypeReturn != null) {
      data['taxTypeReturn'] = this.taxTypeReturn!.toJson();
    }
    data['totalTax'] = this.totalTax;
    return data;
  }
}

class TaxTypeReturn {
  double? mutualFunds;
  double? stocks;
  double? fixDeposits;

  TaxTypeReturn({this.mutualFunds, this.stocks, this.fixDeposits});

  TaxTypeReturn.fromJson(Map<String, dynamic> json) {
    mutualFunds = json['Mutual Funds'];
    stocks = json['Stocks'];
    fixDeposits = json['Fix Deposits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mutual Funds'] = this.mutualFunds;
    data['Stocks'] = this.stocks;
    data['Fix Deposits'] = this.fixDeposits;
    return data;
  }
}