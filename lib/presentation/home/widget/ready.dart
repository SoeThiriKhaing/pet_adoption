import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../adopt_pet.dart';

class CategoryItem {
  final String name;
  final IconData icon;

  CategoryItem({required this.name, required this.icon});
}

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {

    final List<CategoryItem> categories = [
      CategoryItem(name: 'All', icon: Icons.pets_rounded),
      CategoryItem(name: 'Dog', icon: Icons.pets_rounded),
      CategoryItem(name: 'Cat', icon: Icons.pets_outlined),
    ];

    final selectedCategory = context.select(
            (HomeCubit cubit) => cubit.state is HomeReady
            ? (cubit.state as HomeReady).selectedCategory
            : 'All'
    );

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 20), // Added separation space
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category.name;

          return GestureDetector(
            onTap: () {
              context.read<HomeCubit>().fetchPets(category.name);
            },
            child: Column(
              children: [
                // 3. The Circular Avatar Box Configuration
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.clrPurple : Colors.grey.shade100,
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: Colors.indigo.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ]
                        : null,
                  ),
                  child: Center(
                    child: Icon(
                      category.icon,
                      size: 28,
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                    ),

                  ),
                ),
                const SizedBox(height: 6),

                // 4. Category Title Label Text
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.indigo : Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}