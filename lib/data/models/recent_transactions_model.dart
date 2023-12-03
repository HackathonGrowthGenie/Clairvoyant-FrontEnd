class RecentTransactionsModel {
  int? transactionID;
  String? accountID;
  String? transactionType;
  int? amount;
  String? transactionDate;
  String? transactionStatus;
  Null? remarks;

  RecentTransactionsModel(
      {this.transactionID,
        this.accountID,
        this.transactionType,
        this.amount,
        this.transactionDate,
        this.transactionStatus,
        this.remarks});

  RecentTransactionsModel.fromJson(Map<String, dynamic> json) {
    transactionID = json['transactionID'];
    accountID = json['accountID'];
    transactionType = json['transactionType'];
    amount = json['amount'];
    transactionDate = json['transactionDate'];
    transactionStatus = json['transactionStatus'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionID'] = this.transactionID;
    data['accountID'] = this.accountID;
    data['transactionType'] = this.transactionType;
    data['amount'] = this.amount;
    data['transactionDate'] = this.transactionDate;
    data['transactionStatus'] = this.transactionStatus;
    data['remarks'] = this.remarks;
    return data;
  }
}