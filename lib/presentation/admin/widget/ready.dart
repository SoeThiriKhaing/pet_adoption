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

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Dog', 'icon': Icons.pets},
    {'name': 'Cat', 'icon': Icons.catching_pokemon},
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration({
    required String hintText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Colors.grey[400], size: 22)
          : null,
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey[200]!, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.clrPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Selection Header
            const Text(
              "Select Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Modern Segmented Category Buttons
            Row(
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat['name'];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            cat['icon'],
                            color: isSelected ? Colors.white : Colors.grey[600],
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(cat['name']),
                        ],
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.grey[700],
                      ),
                      selected: isSelected,
                      selectedColor: AppColors.clrPrimary,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.grey[200]!,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      onSelected: (bool selected) {
                        if (selected) {
                          setState(() => _selectedCategory = cat['name']);
                        }
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),

            // Input fields card grouping
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pet Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.clrBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: _buildInputDecoration(
                      hintText: "e.g., Buddy",
                      prefixIcon: Icons.badge_outlined,
                    ),
                    validator: (val) => val == null || val.trim().isEmpty
                        ? "Name is required"
                        : null,
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Breed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.clrBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _breedController,
                    decoration: _buildInputDecoration(
                      hintText: "e.g., Golden Retriever",
                      prefixIcon: Icons.pets_outlined,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Age (Years)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.clrBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: _buildInputDecoration(
                      hintText: "e.g., 2",
                      prefixIcon: Icons.cake_outlined,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),

            // Elevated Submission Button
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.clrPrimary.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.clrPrimary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Add Pet",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
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
        imageUrl:
            "https://placedog.net/500", // Tip: Replace with dynamic image upload in future expansions!
      );
    }
  }
}
