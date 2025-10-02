class EnergyItem {
  String type;
  double amount;
  double carbonFactor;

  EnergyItem({
    required this.type,
    required this.amount,
    required this.carbonFactor,
  });

  Map<String, dynamic> toMap() => {
    "type": type,
    "amount": amount,
    "carbonFactor": carbonFactor,
  };
}
