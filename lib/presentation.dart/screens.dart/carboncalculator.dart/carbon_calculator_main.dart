import 'package:flutter/material.dart';
import 'package:green/presentation.dart/screens.dart/carboncalculator.dart/material_page.dart';
import 'package:green/presentation.dart/screens.dart/carboncalculator.dart/energypage.dart';
import 'package:green/presentation.dart/screens.dart/carboncalculator.dart/transportpage.dart';
import 'package:green/presentation.dart/screens.dart/carboncalculator.dart/operationpage.dart';
import 'package:green/presentation.dart/screens.dart/carboncalculator.dart/summary.dart';
import 'package:green/data.dart/models.dart/energymodel.dart';
import 'package:green/data.dart/models.dart/material_model.dart';
import 'package:green/data.dart/models.dart/transportmodel.dart';
import 'package:green/data.dart/models.dart/operationmodel.dart';

class CarbonCalculatorMain extends StatefulWidget {
  const CarbonCalculatorMain({super.key});

  @override
  State<CarbonCalculatorMain> createState() => _CarbonCalculatorMainState();
}

class _CarbonCalculatorMainState extends State<CarbonCalculatorMain> {
  int _currentStep = 0;

  List<MaterialItem> materials = [];
  List<EnergyItem> energy = [];
  List<TransportItem> transport = [];
  List<OperationItem> operations = [];

  // Calculate total carbon footprint
  double calculateTotalCarbon() {
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
    List<Step> steps = [
      Step(
        title: const Text("Materials"),
        content: MaterialsPage(materials: materials),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text("Energy"),
        content: EnergyPage(energy: energy),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: const Text("Transport"),
        content: TransportPage(transport: transport),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: const Text("Operations"),
        content: OperationsPage(operations: operations),
        isActive: _currentStep >= 3,
      ),
      Step(
        title: const Text("Summary"),
        content: SummaryPage(
          materials: materials,
          energy: energy,
          transport: transport,
          operations: operations,
        ),
        isActive: _currentStep >= 4,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Carbon Calculator")),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        steps: steps,
        onStepContinue: () {
          if (_currentStep < steps.length - 1) {
            setState(() {
              _currentStep++;
            });
          } else {
            // Finish button clicked
            // Optionally save data to Firebase here
            double totalCarbon = calculateTotalCarbon();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Total Carbon Footprint: ${totalCarbon.toStringAsFixed(2)} kg CO₂",
                ),
              ),
            );

            // Navigate back to Dashboard/Home page
            Navigator.pop(context);
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        controlsBuilder: (context, details) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(
                  _currentStep == steps.length - 1 ? "Finish" : "Next",
                ),
              ),
              if (_currentStep > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text("Back"),
                ),
            ],
          );
        },
      ),
    );
  }
}
