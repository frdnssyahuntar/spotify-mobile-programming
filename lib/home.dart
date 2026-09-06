import 'package:flutter/material.dart';
import 'package:spotify/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _drawerSelectedIndex = 0;
  
  List<String> get _pageTitles => [
    'Home',
    'Cari',
    'Koleksi Kamu',
    'Buat',
  ];

  List<Widget> get _pages => [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 Kolom
          crossAxisSpacing: 7.5,
          mainAxisSpacing: 7.5,
          childAspectRatio: 4, // Rasio ukuran kotak
        ),
        itemCount: _categories.length, 
        itemBuilder: (context, i) {
          final c = _categories[i];
          return Card(
            color: const Color(0xFF282828),
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(c['icon'] as IconData?, color: Colors.white, size: 28),
                  const SizedBox(width: 20),
                  Text(
                    c['name'] as String,
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    const SearchPage(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        title: Text(_pageTitles[_selectedIndex],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xff121212),
        foregroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
      drawer: NavigationDrawerTheme(
        data: const NavigationDrawerThemeData(
          indicatorColor: Colors.transparent,
        ),
      child : NavigationDrawer(
          backgroundColor: const Color(0xFF212121),
          selectedIndex: _drawerSelectedIndex,
          onDestinationSelected: (i) {
            setState(() => _drawerSelectedIndex = i);
            Navigator.pop(context); 
          },
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 16, 6),
              child: Row(
                children: [
                  const CircleAvatar(radius: 26, child: Icon(Icons.person, size: 40)),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'User',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Lihat profil',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            const NavigationDrawerDestination(
              icon: Icon(Icons.add_outlined, color: Colors.white),
              label: Text('Tambah Akun', style: TextStyle(color: Colors.white)),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.access_time, color: Colors.white),
              label: Text('Baru Diputar', style: TextStyle(color: Colors.white)),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.campaign_outlined, color: Colors.white),
              label: Text('Info Terkini', style: TextStyle(color: Colors.white)),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.settings_outlined, color: Colors.white),
              label: Text('Pengaturan dan privasi', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
        
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(

          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
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
      ),
    );
  }
}

const _categories = [
  {'name': 'Pop', 'icon': Icons.music_note},
  {'name': 'Hip Hop', 'icon': Icons.music_note},
  {'name': 'Jazz', 'icon': Icons.music_note},
  {'name': 'Rock', 'icon': Icons.music_note},
  {'name': 'K-Pop', 'icon': Icons.music_note},
  {'name': 'Dangdut', 'icon': Icons.music_note},
  {'name': 'Indie', 'icon': Icons.music_note},
  {'name': 'R&B', 'icon': Icons.music_note},
];

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