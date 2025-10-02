import 'package:flutter/material.dart';
import 'package:green/data.dart/models.dart/material_model.dart';
import 'package:green/core.dart/const.dart';

class MaterialsPage extends StatefulWidget {
  final List<MaterialItem> materials;
  const MaterialsPage({super.key, required this.materials});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  String? selectedMaterial;
  final quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: "Select Material"),
          items: materialCarbonFactors.keys
              .map((m) => DropdownMenuItem(value: m, child: Text(m)))
              .toList(),
          value: selectedMaterial,
          onChanged: (val) => setState(() => selectedMaterial = val),
        ),
        TextFormField(
          controller: quantityController,
          decoration: const InputDecoration(labelText: "Quantity (kg)"),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedMaterial != null &&
                quantityController.text.isNotEmpty) {
              double quantity = double.parse(quantityController.text);
              widget.materials.add(
                MaterialItem(
                  name: selectedMaterial!,
                  quantity: quantity,
                  carbonFactor: materialCarbonFactors[selectedMaterial!]!,
                ),
              );
              quantityController.clear();
              setState(() => selectedMaterial = null);
            }
          },
          child: const Text("Add Material"),
        ),
        const SizedBox(height: 10),
        ...widget.materials
            .map(
              (m) => ListTile(
                title: Text(m.name),
                trailing: Text("${m.quantity} kg"),
              ),
            )
            .toList(),
      ],
    );
  }
}
