import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

    // Router ကနေ လှမ်းခေါ်လို့ရအောင် callback ပြန်ပေးတာပါ
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

class PetHomePage extends StatelessWidget {
  const PetHomePage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text("Home Page"));
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Favorite Page"));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          // Sign Out ခလုတ်ကို AppBar မှာ ထည့်ထားခြင်း
          IconButton(
            onPressed: () => _showSignOutDialog(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 100, color: Colors.grey),
            const SizedBox(height: 16),
            const Text("User Profile Info"),
            const SizedBox(height: 32),

            // သို့မဟုတ် Body ထဲမှာ Button အနေနဲ့ ထည့်ခြင်း
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red[50]),
              onPressed: () => _showSignOutDialog(context),
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text("Sign Out", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  // Confirm Dialog လေးပြတာ ပိုကောင်းပါတယ်
  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are you sure you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Dialog ကို ပိတ်မယ်

              // AuthenticationCubit ထဲက signOut() ကို လှမ်းခေါ်မယ်
              context.read<AuthenticationCubit>().logOut();

              // Login Page ကို ပြန်သွားမယ်
              context.go(LoginPage.routePath);
            },
            child: const Text("Sign Out", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
