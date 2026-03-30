import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../adopt_pet.dart';
import '../cubit/home_cubit.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Dog', 'Cat'];

    final selectedCategory = context.select(
            (HomeCubit cubit) => cubit.state is HomeReady
            ? (cubit.state as HomeReady).selectedCategory
            : 'All'
    );

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = selectedCategory == cat;

          return ChoiceChip(
            label: Text(cat),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                context.read<HomeCubit>().fetchPets(cat);
              }
            },
            selectedColor: Colors.indigo,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final PetEntity pet;
  final VoidCallback onTap;

  const PetCard({
    super.key,
    required this.pet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            pet.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.pets, size: 40),
          ),
        ),
        title: Text(
          pet.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text("${pet.breed} • ${pet.age} Years"),
        trailing: IconButton(
          icon: Icon(
            pet.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: pet.isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            context.read<HomeCubit>().toggleFavorite(pet.id, !pet.isFavorite);
          },
        ),
        onTap: onTap,
      ),
    );
  }
}