class PopularInvestmentModel {
  final Map<String, int> mutualFunds;
  final Map<String, int> stocks;
  final Map<String, int> fixedDeposits;

  const PopularInvestmentModel({
  required this.mutualFunds,
  required this.stocks,
  required this.fixedDeposits,
  });

  factory PopularInvestmentModel.fromJson(Map<String, dynamic> json) {
  return PopularInvestmentModel(
  mutualFunds: Map.from(json['Mutual Funds'] as Map),
  stocks: Map.from(json['Stocks'] as Map),
  fixedDeposits: Map.from(json['Fixed Deposits'] as Map),
  );
  }
  }