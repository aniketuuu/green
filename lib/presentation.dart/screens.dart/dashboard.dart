import 'package:flutter/material.dart';
import 'package:green/presentation.dart/screens.dart/carboncalculator.dart/carbon_calculator_main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  final List<Map<String, dynamic>> features = const [
    {"icon": Icons.calculate, "label": "Carbon Calculator"},
    {"icon": Icons.layers, "label": "Materials"},
    {"icon": Icons.bolt, "label": "Energy Efficiency"},
    {"icon": Icons.verified, "label": "Certifications"},
    {"icon": Icons.auto_awesome, "label": "AI Suggestions"},
    {"icon": Icons.menu_book, "label": "Knowledge Hub"},
    {"icon": Icons.bar_chart, "label": "Cost Analyzer"},
    {"icon": Icons.people, "label": "Community"},
    {"icon": Icons.policy, "label": "Policies"},
    {"icon": Icons.person, "label": "Profile"},
  ];

  void navigateToFeature(BuildContext context, String label) {
    if (label == "Carbon Calculator") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CarbonCalculatorMain()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Navigating to $label")));
    }
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFEAF8E5),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text("Dashboard"),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return FeatureCard(
              icon: features[index]["icon"],
              label: features[index]["label"],
              onTap: () => navigateToFeature(context, features[index]["label"]),
            );
          },
        ),
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade200, Colors.green.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.green.shade100.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 48, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
