import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyCurveNavBar extends StatefulWidget {
  const MyCurveNavBar({super.key});

  @override
  State<MyCurveNavBar> createState() => _MyCurveNavBarState();
}

class _MyCurveNavBarState extends State<MyCurveNavBar> {
  int _currentIndex = 0;

  final List<String> _titles = [
    'Home',
    'Notification',
    'Profile'
  ];

  final List<Color> _containerColors =[
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.purple.shade100,
  ];

  final List<Widget> _screen = [
    const HomePageScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: _screen[_currentIndex], 
      bottomNavigationBar: CurvedNavigationBar(items: <Widget>
      [
      const Icon(Icons.dashboard, size: 30, color: Colors.white,),
      const Icon(Icons.notifications, size: 30, color: Colors.white,),
      const Icon(Icons.person, size: 30, color: Colors.white,)
      ],
      color: Colors.teal.shade400,
      buttonBackgroundColor: Colors.blueGrey,
      backgroundColor: _containerColors[_currentIndex],
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      onTap: (index){
        setState(() {
        _currentIndex = index;
        });
      },
      )
    );
  }
}

//Screen widgets
class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Text("Homepage"),
    );
  }
}

//Notification widgets
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Text("Notification"),
    );
  }
}

//Profile widgets
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Text("Profile"),
    );
  }
}
