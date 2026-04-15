import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeSelector extends StatefulWidget {
  final Function(String hour, String minute)? onTimeChanged;

  const TimeSelector({super.key, this.onTimeChanged});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  late TextEditingController _hourController;
  late TextEditingController _minController;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();

    _hourController = TextEditingController(
      text: now.hour.toString().padLeft(2, '0'),
    );
    _minController = TextEditingController(
      text: now.minute.toString().padLeft(2, '0'),
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minController.dispose();
    super.dispose();
  }

  void _notifyParent() {
    widget.onTimeChanged?.call(_hourController.text, _minController.text);
  }

  void _adjustValue(TextEditingController controller, int delta, int max) {
    int current = int.tryParse(controller.text) ?? 0;
    int newValue = (current + delta) % (max + 1);
    if (newValue < 0) newValue = max;

    setState(() {
      controller.text = newValue.toString().padLeft(2, '0');
    });
    _notifyParent();
  }

  void _validateInput(TextEditingController controller, int max) {
    String val = controller.text;
    if (val.isEmpty) return;
    int? parsed = int.tryParse(val);

    // Se o usuário apagar ou digitar algo inválido, corrigimos
    if (parsed == null || parsed > max) {
      setState(() {
        controller.text = max.toString().padLeft(2, '0');
      });
    } else {
      // Formata com zero à esquerda se necessário (ex: "5" vira "05")
      setState(() {
        controller.text = parsed.toString().padLeft(2, '0');
      });
    }
    _notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TimeFieldUnit(
            controller: _hourController,
            onIncrement: () => _adjustValue(_hourController, 1, 23),
            onDecrement: () => _adjustValue(_hourController, -1, 23),
            onChanged: (value) => _validateInput(_hourController, 23),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              ":",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
          ),
          TimeFieldUnit(
            controller: _minController,
            onIncrement: () => _adjustValue(_minController, 1, 59),
            onDecrement: () => _adjustValue(_minController, -1, 59),
            onChanged: (value) => _validateInput(_minController, 59),
          ),
        ],
      ),
    );
  }
}

class TimeFieldUnit extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final ValueChanged<String> onChanged;

  const TimeFieldUnit({
    super.key,
    required this.controller,
    required this.onIncrement,
    required this.onDecrement,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final labelStyle = Theme.of(context).textTheme.labelSmall;
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onIncrement,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('^',
                style: bodyStyle?.copyWith(
                    fontSize: 24,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          width: 70,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            style: labelStyle?.copyWith(
              fontSize: 42,
              fontWeight: FontWeight.w900,
              color: colorScheme.primary,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        GestureDetector(
          onTap: onDecrement,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('v',
                style: bodyStyle?.copyWith(
                    fontSize: 18,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
