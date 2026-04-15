import 'package:flutter/material.dart';

class DaySelector extends StatefulWidget {
  final Function(List<bool>)? onDaysChanged;

  const DaySelector({super.key, this.onDaysChanged});

  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  final List<String> days = ['S', 'T', 'Q', 'Q', 'S', 'S', 'D'];
  final List<bool> selectedDays = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //   // decoration: BoxDecoration(
    //   //   color: theme.colorScheme.surfaceContainerHighest,
    //   //   borderRadius: BorderRadius.circular(8),
    //   // ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: List.generate(days.length, (index) {
    //       final isSelected = selectedDays[index];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(days.length, (index) {
        final isSelected = selectedDays[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDays[index] = !selectedDays[index];
            });
            widget.onDaysChanged?.call(selectedDays);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  days[index],
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 22,
                  height: 2.5,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
