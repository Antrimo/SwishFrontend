import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/map_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Components/dummy.dart';
import 'package:swish/Theme/color.dart';

class FindMeDateScreen extends StatefulWidget {
  const FindMeDateScreen({super.key});

  @override
  _FindMeDateScreenState createState() => _FindMeDateScreenState();
}

class _FindMeDateScreenState extends State<FindMeDateScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Near You')),
    const Center(child: Text('Matches')),
    const Center(child: Text('Messages')),
    const Center(child: Text('Profile')),
    const Center(child: Text('Settings')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Near You',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),

            const MapBlock(blockColor: Colors.white, height: 400, width: 300),
            StackBlock(
              title: 'Find me a Date!',
              screen: const Dummy(),
              blockColor: splashScreen,
              textColor: Colors.white,
              isAuth: false,
              height: 58,
              width: 218,
              isFunction: false, isWidth: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset('assets/navbar_icons/boost.png', height: 24),
                  label: 'Boost',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/navbar_icons/spots.png', height: 24),
                  label: 'Date Spots',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/navbar_icons/swish.png', height: 24),
                  label: 'Swish',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/navbar_icons/chats.png', height: 24),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/navbar_icons/profile.png', height: 24),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              
              selectedItemColor: splashScreen,
              // selectedIconTheme: IconThemeData(color: splashScreen),
              unselectedItemColor: Colors.blueGrey,
              backgroundColor: splashScreen,
              onTap: _onItemTapped,
            ),
          ),
      
      ),
    );
  }
}
