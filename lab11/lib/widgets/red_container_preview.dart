import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/container_config_provider.dart';

class RedContainerPreview extends StatelessWidget {
  const RedContainerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    // Відстежуємо стан конфігуратора через Provider
    final config = context.watch<ContainerConfigProvider>();

    return SizedBox(
      height: 260,
      child: Center(
        child: Container(
          width: config.width,
          height: config.height,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(config.topRightRadius),
            ),
          ),
        ),
      ),
    );
  }
}
