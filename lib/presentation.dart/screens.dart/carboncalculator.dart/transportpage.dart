import 'package:flutter/material.dart';
import 'package:green/data.dart/models.dart/transportmodel.dart';
import 'package:green/core.dart/const.dart';

class TransportPage extends StatefulWidget {
  final List<TransportItem> transport;
  const TransportPage({super.key, required this.transport});

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  String? selectedVehicle;
  final distanceController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: "Select Vehicle"),
          items: vehicleCarbonFactors.keys
              .map((v) => DropdownMenuItem(value: v, child: Text(v)))
              .toList(),
          value: selectedVehicle,
          onChanged: (val) => setState(() => selectedVehicle = val),
        ),
        TextFormField(
          controller: distanceController,
          decoration: const InputDecoration(labelText: "Distance (km)"),
          keyboardType: TextInputType.number,
        ),
        TextFormField(
          controller: weightController,
          decoration: const InputDecoration(labelText: "Material Weight (ton)"),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedVehicle != null &&
                distanceController.text.isNotEmpty &&
                weightController.text.isNotEmpty) {
              double distance = double.parse(distanceController.text);
              double weight = double.parse(weightController.text);
              widget.transport.add(
                TransportItem(
                  vehicle: selectedVehicle!,
                  distance: distance,
                  weight: weight,
                  carbonFactor: vehicleCarbonFactors[selectedVehicle!]!,
                ),
              );
              distanceController.clear();
              weightController.clear();
              setState(() => selectedVehicle = null);
            }
          },
          child: const Text("Add Transport"),
        ),
        const SizedBox(height: 10),
        ...widget.transport.map(
          (t) => ListTile(
            title: Text(t.vehicle),
            subtitle: Text("${t.distance} km, ${t.weight} ton"),
          ),
        ),
      ],
    );
  }
}
