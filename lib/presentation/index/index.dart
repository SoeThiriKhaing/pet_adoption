import 'package:flutter/material.dart';
import '../../adopt_pet.dart';

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
    const FavoritePage(),
    const FavoritePage(),
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
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Adopt'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add Pet',
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
  Widget build(BuildContext context) =>
      const Center(child: Text("Favorite Page"));
}



