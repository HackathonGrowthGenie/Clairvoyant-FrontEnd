class RecentTransactions {
  final String? icon, title, date, size;

  RecentTransactions({this.icon, this.title, this.date, this.size});
}

List recentFiles = [
  RecentTransactions(
    icon: "assets/icons/media_file.svg",
    title: "Mutual Fund",
    date: "23-12-2023",
    size: "₹ 250000",
  ),
  RecentTransactions(
    icon: "assets/icons/media_file.svg",
    title: "Stock",
    date: "23-11-2023",
    size: "₹ 200000",
  ),
  RecentTransactions(
    icon: "assets/icons/media_file.svg",
    title: "Fix Deposit",
    date: "23-10-2023",
    size: "₹ 500000",
  ),
];
