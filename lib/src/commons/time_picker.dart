import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final ValueChanged<String> onTimeSelected;

  const TimePickerWidget({required this.onTimeSelected});

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      widget.onTimeSelected(_selectedTime.format(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Selected Time: ${_selectedTime.format(context)}'),
      trailing: IconButton(
        icon: Icon(Icons.access_time),
        onPressed: () => _selectTime(context),
      ),
    );
  }
}
