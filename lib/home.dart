import 'package:flutter/material.dart';
import 'package:spotify/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  List<String> get _pageTitles => [
    'Home',
    'Cari',
    'Koleksi Kamu',
    'Buat',
  ];

  List<Widget> get _pages => [
    const SizedBox(),
    const SearchPage(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        title: Text(_pageTitles[_selectedIndex]),
        backgroundColor: const Color(0xff121212),
        foregroundColor: const Color(0xffffffff),
        elevation: 0
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
        backgroundColor: const Color(0xff121212),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffffffff),
        unselectedItemColor: const Color(0xff757575),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _navBarItems,
      ),
      )
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    activeIcon: Icon(Icons.search),
    label: 'Cari',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.library_music_outlined),
    activeIcon: Icon(Icons.library_music),
    label: 'Koleksi Kamu',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add_outlined),
    activeIcon: Icon(Icons.add),
    label: 'Buat',
  ),
];