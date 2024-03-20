import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final ValueChanged<String> onDateSelected;

  const DatePickerWidget({required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(_selectedDate.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Selected Date: ${_selectedDate.toString().substring(0, 10)}'),
      trailing: IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () => _selectDate(context),
      ),
    );
  }
}
