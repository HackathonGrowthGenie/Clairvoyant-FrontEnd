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
  double? stocks;

  TaxTypeReturn({this.stocks});

  TaxTypeReturn.fromJson(Map<String, dynamic> json) {
    stocks = json['Stocks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Stocks'] = this.stocks;
    return data;
  }
}