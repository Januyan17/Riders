import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class TableEventsExample extends StatefulWidget {
  TableEventsExample({Key? key}) : super(key: key);

  final List<DateTime> highLights = [
    DateTime(2022, DateTime.april, 14),
    DateTime(2022, DateTime.april, 4),
    DateTime(2022, DateTime.april, 23),
    DateTime(2022, DateTime.april, 30),
  ];

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TableCalendar<Event>(
            calendarBuilders:
                CalendarBuilders(defaultBuilder: (context, daypar, focusedDay) {
              for (DateTime d in widget.highLights) {
                if (daypar.day == d.day) {
                  // print('daypar-------------');
                  // print(daypar);
                  // print(daypar.day);
                  // print(d);
                  return Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: d.day == 14 ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Center(
                      child: Text(
                        '${daypar.day}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              }
            }),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              isTodayHighlighted: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
