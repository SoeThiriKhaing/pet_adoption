import 'package:flutter/material.dart';
import '../../adopt_pet.dart';
import '../favourite/favourite.dart';

class IndexPage extends StatefulWidget {
  final int initialTab;
  final Function(int index) onIndexChanged;
  final Function(void Function(int page) Function() useIndexPageNavigator)
  indexCallback;

  const IndexPage({
    super.key,
    required this.initialTab,
    required this.onIndexChanged,
    required this.indexCallback,
  });

  static const String routePath = '/';

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialTab;

    widget.indexCallback(
      () => (int page) {
        setState(() {
          _currentIndex = page;
        });
      },
    );
  }

  final List<Widget> _pages = [
    const PetHomePage(),
    const FavouriteHomePage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onIndexChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.clrPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Adopt'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurple.shade50,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),

        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/appbar/app.png",
              fit: BoxFit
                  .cover, // 6. Forces the image to fill the entire header area without warping
            ),
          ],
        ),
      ),
    );
  }
}
