import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vapt_agendamento/shared/widgets/menu_drawer.dart';
import 'package:vapt_agendamento/modules/reminder/day_selector.dart';
import 'package:vapt_agendamento/modules/reminder/time_selector.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  final TextEditingController _titleController = TextEditingController();

  // Initialize with current time to avoid validation errors if unchanged
  String _selectedHour = DateTime.now().hour.toString().padLeft(2, '0');
  String _selectedMinute = DateTime.now().minute.toString().padLeft(2, '0');
  List<bool> _selectedDays = List.generate(7, (_) => false);

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _saveReminder() {
    if (_titleController.text.trim().isEmpty) {
      _showError('Please, insert a title');
      return;
    }

    if (!_selectedDays.contains(true)) {
      _showError('Please, select at least one day');
      return;
    }

    if (_selectedHour.isEmpty || _selectedMinute.isEmpty) {
      _showError('Please, set a valid time');
      return;
    }

    // Logic for saving goes here
    debugPrint(
        "Saved: ${_titleController.text} at $_selectedHour:$_selectedMinute");

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Reminder saved successfully!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      endDrawer: const MenuDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vapt',
                    style: textTheme.displayLarge?.copyWith(
                      color: colorScheme.onPrimary,
                      height: 1.0,
                    ),
                  ),
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu,
                          color: colorScheme.onPrimary, size: 30),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content Area
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Reminder',
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title Input
                    TextFormField(
                      controller: _titleController,
                      maxLength: 60,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      style: textTheme.bodyLarge,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        filled: true,
                        fillColor: colorScheme.surface.withValues(alpha: 0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        // Optional: if you want to hide the counter, uncomment the line below:
                        // counterText: "",
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      'Select the days',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Day Selector Component
                    DaySelector(
                      onDaysChanged: (days) {
                        setState(() {
                          _selectedDays = days;
                        });
                      },
                    ),

                    const Spacer(flex: 2),

                    // Time Selector Component
                    Center(
                      child: TimeSelector(
                        onTimeChanged: (hour, minute) {
                          _selectedHour = hour;
                          _selectedMinute = minute;
                        },
                      ),
                    ),

                    const Spacer(flex: 3),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _saveReminder,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.onPrimary,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
