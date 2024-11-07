import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              // Acción para marcar todas como leídas
            },
            child: Text(
              'Mark all Read',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationTile(
            title: 'Design new App for Alex',
            subtitle: 'Start from screen 16',
            time: '10:00 AM',
            color: Colors.green,
          ),
          NotificationTile(
            title: 'Brainstorm with the Design Team',
            subtitle: 'Define the problem or questions',
            time: '02:00 PM',
            color: Colors.purple,
          ),
          NotificationTile(
            title: 'Workout with John',
            subtitle: 'We will do the legs and back workout',
            time: '06:00 PM',
            color: Colors.blue,
          ),
          NotificationTile(
            title: 'Create Landing Page',
            subtitle: 'Start from 8th section',
            time: '09:00 AM',
            color: Colors.orange,
          ),
          NotificationTile(
            title: 'Coffee with Alex',
            subtitle: 'Discuss app project with him',
            time: '08:00 PM',
            color: Colors.red,
          ),
          NotificationTile(
            title: 'Schedule Meeting',
            subtitle: 'Schedule meeting with Alex',
            time: '10:00 AM',
            color: Colors.teal,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.calendar_today), onPressed: () {
                Navigator.pop(context); // Regresar a HomeScreen
              }),
              IconButton(icon: Icon(Icons.notifications, color: Colors.purple), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const NotificationTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 4),
              Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
