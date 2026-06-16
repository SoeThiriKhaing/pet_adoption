import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../adopt_pet.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> categories = [
      CategoryItem(name: 'All', svgPath: "assets/images/categories/all.svg"),
      CategoryItem(name: 'Dog', svgPath: "assets/images/categories/dog.svg"),
      CategoryItem(name: 'Cat', svgPath: "assets/images/categories/cat.svg"),
    ];

    final selectedCategory = context.select(
      (HomeCubit cubit) => cubit.state is HomeReady
          ? (cubit.state as HomeReady).selectedCategory
          : 'All',
    );

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category.name;

          return GestureDetector(
            onTap: () {
              context.read<HomeCubit>().fetchPets(category.name);
            },
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppColors.clrPurpleAccent
                        : AppColors.clrWhite,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.indigo.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      category.svgPath,
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                        isSelected ? Colors.black54 : Colors.grey.shade600,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),

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
