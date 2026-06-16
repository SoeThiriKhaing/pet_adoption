import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../adopt_pet.dart';

class PetCard extends StatelessWidget {
  final PetEntity pet;
  final VoidCallback onTap;

  const PetCard({super.key, required this.pet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Softer, more modern rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04), // Ultra-subtle depth shadow
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    pet.imageUrl,
                    width: 150, // Increased size for a clearer visual presence
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      width: 85,
                      height: 85,
                      color: Colors.grey.shade100,
                      child: Icon(Icons.pets_rounded, size: 36, color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // 2. Clean Text Content and Metadata Hierarchy
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pet.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800, // Stronger weight for a bold header
                        fontSize: 18,
                        color: AppColors.clrGrey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pet.breed,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey.shade500, // Subtle muted color for breed
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Modern chip tag for age instead of plain inline text
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.clrPurple, // Soft background container tint
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${pet.age} ${pet.age == 1 ? 'Year' : 'Years'} Old",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.clrWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 3. Floating Favorite Action Button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    context.read<HomeCubit>().toggleFavorite(pet.id, !pet.isFavorite);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      pet.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: pet.isFavorite ? Colors.redAccent : Colors.grey.shade400,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}