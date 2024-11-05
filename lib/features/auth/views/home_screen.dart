import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDay = DateTime(2025, 1, 1);
    final lastDay = DateTime(2025, 12, 31);
    final focusedDay = DateTime(2025, now.month, now.day);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.purple[700]!, Colors.purple[500]!],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          '',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      TableCalendar(
                        firstDay: firstDay,
                        lastDay: lastDay,
                        focusedDay: focusedDay,
                        calendarFormat: CalendarFormat.month,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.all(16),
                          children: [
                            EventTile(
                              time: '10:00 - 13:00',
                              title: 'Design new App for Alex',
                              subtitle: 'Start from screen 16',
                              color: Colors.green,
                            ),
                            SizedBox(height: 16),
                            EventTile(
                              time: '14:00 - 16:00',
                              title: 'Brainstorm with UI Design Team',
                              subtitle: 'Define the problem',
                              color: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.purple,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          StadiumBorder(),
        ),
        notchMargin: 8,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.calendar_today), onPressed: () {}),
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final Color color;

  const EventTile({
    Key? key,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 60,
          color: color,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}