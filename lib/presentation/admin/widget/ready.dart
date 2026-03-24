import 'package:flutter/material.dart';
import 'package:pet/adopt_pet.dart';

class AddPetForm extends StatefulWidget {
  final AddPetCubit bloc;

  const AddPetForm({super.key, required this.bloc});

  @override
  State<AddPetForm> createState() => _AddPetFormState();
}

class _AddPetFormState extends State<AddPetForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();
  String _selectedCategory = 'Dog';

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pet Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: [
                'Dog',
                'Cat',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => _selectedCategory = val!),
            ),
            const SizedBox(height: 20),

            const Text(
              "Pet Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(

              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter pet name",
              ),
              validator: (val) => val!.isEmpty ? "Required" : null,
            ),
            const SizedBox(height: 20),

            const Text("Breed", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _breedController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter breed",
              ),
            ),
            const SizedBox(height: 20),

            const Text("Age", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter age",
              ),
            ),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text("Submit Pet Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.bloc.savePet(
        name: _nameController.text.trim(),
        category: _selectedCategory,
        breed: _breedController.text.trim(),
        age: int.tryParse(_ageController.text) ?? 0,
        imageUrl: "https://placedog.net/500",
      );
    }
  }
}
