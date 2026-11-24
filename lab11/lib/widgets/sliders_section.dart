import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/container_config_provider.dart';

class SlidersSection extends StatelessWidget {
  const SlidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Підписуємося на зміни значень у провайдері
    final config = context.watch<ContainerConfigProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSliderItem(
          label: 'Width',
          value: config.width,
          min: 50.0,
          max: 250.0,
          onChanged: (val) => context.read<ContainerConfigProvider>().setWidth(val),
        ),
        const SizedBox(height: 8),
        _buildSliderItem(
          label: 'Height',
          value: config.height,
          min: 50.0,
          max: 250.0,
          onChanged: (val) => context.read<ContainerConfigProvider>().setHeight(val),
        ),
        const SizedBox(height: 8),
        _buildSliderItem(
          label: 'Radius',
          value: config.topRightRadius,
          min: 0.0,
          max: 125.0,
          onChanged: (val) =>
              context.read<ContainerConfigProvider>().setTopRightRadius(val),
        ),
      ],
    );
  }

  Widget _buildSliderItem({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('$label: ', style: const TextStyle(fontSize: 15)),
            Text(
              value.toStringAsFixed(2),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
