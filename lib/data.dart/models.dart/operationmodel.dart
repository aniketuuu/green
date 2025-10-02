class OperationItem {
  String type;
  double energy;
  double carbonFactor;

  OperationItem({
    required this.type,
    required this.energy,
    required this.carbonFactor,
  });

  Map<String, dynamic> toMap() => {
    "type": type,
    "energy": energy,
    "carbonFactor": carbonFactor,
  };
}
