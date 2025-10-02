import 'package:flutter/material.dart';
import 'package:green/data.dart/models.dart/energymodel.dart';
import 'package:green/core.dart/const.dart';

class EnergyPage extends StatefulWidget {
  final List<EnergyItem> energy;
  const EnergyPage({super.key, required this.energy});

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  String? selectedEnergy;
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: "Select Energy Type"),
          items: energyCarbonFactors.keys
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          value: selectedEnergy,
          onChanged: (val) => setState(() => selectedEnergy = val),
        ),
        TextFormField(
          controller: amountController,
          decoration: const InputDecoration(
            labelText: "Amount (kWh or liters)",
          ),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedEnergy != null && amountController.text.isNotEmpty) {
              double amount = double.parse(amountController.text);
              widget.energy.add(
                EnergyItem(
                  type: selectedEnergy!,
                  amount: amount,
                  carbonFactor: energyCarbonFactors[selectedEnergy!]!,
                ),
              );
              amountController.clear();
              setState(() => selectedEnergy = null);
            }
          },
          child: const Text("Add Energy"),
        ),
        const SizedBox(height: 10),
        ...widget.energy
            .map(
              (e) => ListTile(
                title: Text(e.type),
                trailing: Text("${e.amount} units"),
              ),
            )
            .toList(),
      ],
    );
  }
}
