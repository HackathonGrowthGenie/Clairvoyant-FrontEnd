  class RecentTransactionsModel {
    final int transactionID;
    final String accountID;
    final String transactionType;
    final double amount;
    final DateTime transactionDate;
    final String transactionStatus;
    final String? remarks;

    RecentTransactionsModel({
      required this.transactionID,
      required this.accountID,
      required this.transactionType,
      required this.amount,
      required this.transactionDate,
      required this.transactionStatus,
      this.remarks,
    });

    factory RecentTransactionsModel.fromJson(Map<String, dynamic> json) {
      return RecentTransactionsModel(
        transactionID: json['transactionID'] as int,
        accountID: json['accountID'] as String,
        transactionType: json['transactionType'] as String,
        amount: json['amount'] as double,
        transactionDate: DateTime.parse(json['transactionDate']),
        transactionStatus: json['transactionStatus'] as String,
        remarks: json['remarks'] as String?,
      );
    }
  }