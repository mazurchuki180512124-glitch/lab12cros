
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/corner_provider.dart';

class BlueContainerPreview extends StatelessWidget {
  const BlueContainerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CornerProvider>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: provider.borderRadius,
      ),
    );
  }
}
