// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import '../Constraints/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import 'AttendanceDetails.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // DateTime selectedDate = DateTime.now();
  // DateTime initialDate = DateTime.now();

  CalendarFormat format = CalendarFormat.month;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  DateTime selectedDay1 = DateTime.now();
  DateTime focusedDay1 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: kPrimaryPurpleColor,
              size: 25.0,
            ),
            onPressed: () {},
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            // ignore: deprecated_member_use
            overscroll.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Attendance",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryPurpleColor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TableCalendar(
                        focusedDay: selectedDay,
                        firstDay: DateTime(1990),
                        lastDay: DateTime(2030),
                        calendarFormat: format,
                        // onFormatChanged: (CalendarFormat _format) {
                        //   setState(() {
                        //     format = _format;
                        //   });
                        // },
                        daysOfWeekVisible: true,
                        onDaySelected: (DateTime selectDay, DateTime focusDay) {
                          setState(() {
                            selectedDay = selectDay;
                            focusedDay = focusDay;
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AttendanceDetails()));
                        },
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(selectedDay, date);
                        },
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 140, 221, 171),
                              shape: BoxShape.circle),
                          selectedTextStyle: TextStyle(
                              color: Color.fromARGB(255, 33, 158, 38)),
                          todayDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 112, 155, 228),
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle: TextStyle(
                              color: Color.fromARGB(255, 49, 65, 212)),
                          holidayTextStyle: TextStyle(
                              color: Color.fromARGB(255, 108, 19, 143)),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          formatButtonShowsNext: true,
                        ),
                      )),

                  // Calendar 2

                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TableCalendar(
                        focusedDay: selectedDay,
                        firstDay: DateTime(1990),
                        lastDay: DateTime(2030),
                        calendarFormat: format,
                        daysOfWeekVisible: true,
                        onDaySelected: (DateTime selectDay, DateTime focusDay) {
                          setState(() {
                            selectedDay1 = selectDay;
                            focusedDay1 = focusDay;
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AttendanceDetails()));
                        },
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(selectedDay1, date);
                        },
                        calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 246, 136),
                                shape: BoxShape.circle),
                            selectedTextStyle: TextStyle(
                                color: Color.fromARGB(255, 245, 230, 24)),
                            todayDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 235, 148, 113),
                              shape: BoxShape.circle,
                            ),
                            todayTextStyle: TextStyle(
                                color: Color.fromARGB(255, 235, 76, 76)),
                            holidayTextStyle: TextStyle(
                                color: Color.fromARGB(255, 108, 19, 143))),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          formatButtonShowsNext: true,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
