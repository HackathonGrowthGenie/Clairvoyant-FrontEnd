class HistoricalReturnsModel {
  int? customerId;
  String? customerName;
  String? currentDate;
  double? returnValue;

  HistoricalReturnsModel(
      {this.customerId, this.customerName, this.currentDate, this.returnValue});

  HistoricalReturnsModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    currentDate = json['currentDate'];
    returnValue = json['returnValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['currentDate'] = this.currentDate;
    data['returnValue'] = this.returnValue;
    return data;
  }
}