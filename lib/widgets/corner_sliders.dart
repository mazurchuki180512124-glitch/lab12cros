
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/corner_provider.dart';

class CornerSliders extends StatelessWidget {
  const CornerSliders({super.key});

  String getTitle(Corner corner) {
    switch (corner) {
      case Corner.topLeft:
        return 'Верхній лівий';
      case Corner.topRight:
        return 'Верхній правий';
      case Corner.bottomLeft:
        return 'Нижній лівий';
      case Corner.bottomRight:
        return 'Нижній правий';
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CornerProvider>();

    return Column(
      children: Corner.values.map((corner) {
        final value = provider.getRadius(corner);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${getTitle(corner)}: ${value.toInt()}',
              style: const TextStyle(fontSize: 15),
            ),
            Slider(
              value: value,
              min: 0,
              max: 75,
              divisions: 75,
              activeColor: Colors.blue,
              label: value.toInt().toString(),
              onChanged: (newValue) {
                context.read<CornerProvider>()
                    .setRadius(corner, newValue);
              },
            ),
            const SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }
}
