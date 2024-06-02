import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  int _roomCount = 1;
  int _adultCount = 1;
  int _childCount = 0;

  void _increment(String field) {
    setState(() {
      if (field == 'room') {
        _roomCount++;
      } else if (field == 'adult') {
        _adultCount++;
      } else if (field == 'child') {
        _childCount++;
      }
    });
  }

  void _decrement(String field) {
    setState(() {
      if (field == 'room' && _roomCount > 0) {
        _roomCount--;
      } else if (field == 'adult' && _adultCount > 0) {
        _adultCount--;
      } else if (field == 'child' && _childCount > 0) {
        _childCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Room & Guest'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildCounterField('Room', _roomCount, 'room'),
            _buildCounterField('Adult', _adultCount, 'adult'),
            _buildCounterField('Child', _childCount, 'child'),
          ],
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            List<int> values = [_roomCount, _adultCount, _childCount];
            Navigator.of(context).pop(values);
          },
          child: const Text('Done'),
        ),
      ],
    );
  }

  Widget _buildCounterField(String label, int count, String field) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(label),
        Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => _decrement(field),
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 18.0),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _increment(field),
            ),
          ],
        ),
      ],
    );
  }
}
