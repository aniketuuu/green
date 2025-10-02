import 'package:flutter/material.dart';
import 'package:green/data.dart/models.dart/operationmodel.dart';
import 'package:green/core.dart/const.dart';

class OperationsPage extends StatefulWidget {
  final List<OperationItem> operations;
  const OperationsPage({super.key, required this.operations});

  @override
  State<OperationsPage> createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  String? selectedOperation;
  final energyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: "Operation Type"),
          items: [
            "HVAC",
            "Lighting",
            "Appliances",
          ].map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
          value: selectedOperation,
          onChanged: (val) => setState(() => selectedOperation = val),
        ),
        TextFormField(
          controller: energyController,
          decoration: const InputDecoration(labelText: "Energy Used (kWh)"),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedOperation != null && energyController.text.isNotEmpty) {
              double energy = double.parse(energyController.text);
              widget.operations.add(
                OperationItem(
                  type: selectedOperation!,
                  energy: energy,
                  carbonFactor: 0.45, // default kWh factor
                ),
              );
              energyController.clear();
              setState(() => selectedOperation = null);
            }
          },
          child: const Text("Add Operation"),
        ),
        const SizedBox(height: 10),
        ...widget.operations
            .map(
              (o) => ListTile(
                title: Text(o.type),
                trailing: Text("${o.energy} kWh"),
              ),
            )
            .toList(),
      ],
    );
  }
}
