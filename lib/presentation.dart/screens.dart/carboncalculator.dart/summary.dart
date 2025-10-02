import 'package:flutter/material.dart';
import 'package:green/data.dart/models.dart/material_model.dart';
import 'package:green/data.dart/models.dart/energymodel.dart';
import 'package:green/data.dart/models.dart/transportmodel.dart';
import 'package:green/data.dart/models.dart/operationmodel.dart';
import 'package:green/data.dart/services.dart/firestore_service.dart';

class SummaryPage extends StatelessWidget {
  final List<MaterialItem> materials;
  final List<EnergyItem> energy;
  final List<TransportItem> transport;
  final List<OperationItem> operations;

  SummaryPage({
    super.key,
    required this.materials,
    required this.energy,
    required this.transport,
    required this.operations,
  });

  double calculateTotal() {
    double total = 0;
    total += materials.fold(0, (sum, m) => sum + m.quantity * m.carbonFactor);
    total += energy.fold(0, (sum, e) => sum + e.amount * e.carbonFactor);
    total += transport.fold(
      0,
      (sum, t) => sum + t.distance * t.weight * t.carbonFactor,
    );
    total += operations.fold(0, (sum, o) => sum + o.energy * o.carbonFactor);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalCarbon = calculateTotal();
    return Column(
      children: [
        Text(
          "Total Carbon Footprint: ${totalCarbon.toStringAsFixed(2)} kg CO₂",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await FirestoreService().saveCarbonCalculation({
              "materials": materials.map((m) => m.toMap()).toList(),
              "energy": energy.map((e) => e.toMap()).toList(),
              "transport": transport.map((t) => t.toMap()).toList(),
              "operations": operations.map((o) => o.toMap()).toList(),
              "totalCarbon": totalCarbon,
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Calculation Saved!")));
          },
          child: const Text("Save Calculation"),
        ),
      ],
    );
  }
}
