import 'package:flutter/material.dart';

class AddPetPage extends StatelessWidget {
  const AddPetPage({super.key});
  static const String routeName = "admin-add-pet";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final breedController = TextEditingController();
    String category = 'Dog';

    return Scaffold(
      appBar: AppBar(title: const Text('Admin: Add New Pet')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Pet Name')),
            TextField(controller: breedController, decoration: const InputDecoration(labelText: 'Breed')),
            DropdownButtonFormField<String>(
              value: category,
              items: ['Dog', 'Cat'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => category = val!,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Firebase သို့ Pet data လှမ်းပို့မည့် logic
                // context.read<AdminCubit>().addPet(...);
              },
              child: const Text('Save Pet to Database'),
            ),
          ],
        ),
      ),
    );
  }
}