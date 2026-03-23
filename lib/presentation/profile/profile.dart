import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // JSON key: "profile"
        title: Text(context.tr('profile')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            _buildProfileHeader(),

            const SizedBox(height: 25),

            _buildLanguageSwitcher(context),

            const SizedBox(height: 20),

            _buildSettingsMenu(context),

            const SizedBox(height: 30),

            _buildLogoutButton(context),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Profile Header
  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user_placeholder.png'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: Icon(Icons.edit, size: 18, color: Colors.blue[800]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "Flutter Developer",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildLanguageSwitcher(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('change_language'),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLanguageItem(context, "English", const Locale('en', 'US'), "🇺🇸"),
                _buildLanguageItem(context, "မြန်မာ", const Locale('my', 'MM'), "🇲🇲"),
                _buildLanguageItem(context, "日本語", const Locale('ja', 'JP'), "🇯🇵"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(BuildContext context, String title, Locale locale, String flag) {
    bool isSelected = context.locale == locale;
    return GestureDetector(
      onTap: () async {
        // အဓိက UI ပြောင်းလဲစေသော code
        await context.setLocale(locale);
        setState(() {}); // UI ကို ချက်ချင်း update ဖြစ်စေရန်
      },
      child: Column(
        children: [
          Text(flag, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black54,
            ),
          ),
          if (isSelected)
            Container(
              margin:  EdgeInsets.only(top: 4),
              height: 4,
              width: 20,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(2)),
            )
        ],
      ),
    );
  }

  // Settings Menu
  Widget _buildSettingsMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            _menuTile(context, Icons.info_outline, 'about_me'),
            const Divider(height: 1),
            _menuTile(context, Icons.location_on_outlined, 'location'),
            const Divider(height: 1),
            _menuTile(context, Icons.category_outlined, 'categories'),
          ],
        ),
      ),
    );
  }

  Widget _menuTile(BuildContext context, IconData icon, String key) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(context.tr(key)), // JSON keys: about_me, location, categories
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {},
    );
  }

  // Logout Button with Dialog
  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Colors.red)),
          elevation: 0,
        ),
        onPressed: () => _showLogoutDialog(context),
        icon: const Icon(Icons.logout),
        label: Text(context.tr('logout'), style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.tr('logout')),
        content: Text(context.tr('confirm-exit')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(context.tr('cancel'))),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.tr('confirm'), style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}