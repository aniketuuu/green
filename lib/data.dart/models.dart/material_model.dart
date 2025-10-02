class MaterialItem {
  String name;
  double quantity;
  double carbonFactor;

  MaterialItem({
    required this.name,
    required this.quantity,
    required this.carbonFactor,
  });

  Map<String, dynamic> toMap() => {
    "name": name,
    "quantity": quantity,
    "carbonFactor": carbonFactor,
  };
}
