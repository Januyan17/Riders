import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2021, 1);
  final lastDate = DateTime(2030, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "$selectedDate".split('')[0],
            style: TextStyle(fontSize: 20),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _OpenDatePicker(context);
              },
              child: Text("Date")),
          Divider(),
          SizedBox(
            height: 15,
          ),
          CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: firstDate,
            lastDate: lastDate,
            onDateChanged: (newDate) {},
          ),
        ],
      ),
    );
  }

  _OpenDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);

    print(date);
  }

  _openCalendarDatePicker(BuildContext context) async {
    final calendar = await CalendarDatePicker(
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      onDateChanged: (newDate) {},
    );
  }
}
