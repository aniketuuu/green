class TransportItem {
  String vehicle;
  double distance;
  double weight;
  double carbonFactor;

  TransportItem({
    required this.vehicle,
    required this.distance,
    required this.weight,
    required this.carbonFactor,
  });

  Map<String, dynamic> toMap() => {
    "vehicle": vehicle,
    "distance": distance,
    "weight": weight,
    "carbonFactor": carbonFactor,
  };
}
