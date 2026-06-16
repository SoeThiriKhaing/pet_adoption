import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet/presentation/favourite/widget/ready.dart';
import '../../../adopt_pet.dart';
import 'cubit/favorite_cubit.dart';

class FavouriteHomePage extends StatelessWidget {
  const FavouriteHomePage({super.key});

  static const String routeName = "fav-home";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/appbar/app.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const CategoryBar(),

          // Wrap the BlocBuilder in an Expanded widget so the GridView doesn't crash the layout
          Expanded(
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, favoriteState) {
                return favoriteState.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(child: Text("Error: $message")),
                  ready: (favoritePets) {
                    // --- REACTIVE CATEGORY FILTERING ---
                    // 1. Get the currently active category from HomeCubit
                    final selectedCategory = context.select(
                          (HomeCubit cubit) => cubit.state is HomeReady
                          ? (cubit.state as HomeReady).selectedCategory
                          : 'All',
                    );

                    // 2. Filter your live favorite list locally based on selection
                    final filteredPets = favoritePets.where((pet) {
                      if (selectedCategory == 'All') return true;
                      // Matches pet.category string (e.g., 'Dog' or 'Cat') ignoring case
                      return pet.category.toLowerCase() == selectedCategory.toLowerCase();
                    }).toList();

                    // 3. Show empty state if no pets match the selected category
                    if (filteredPets.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_border_rounded, size: 70, color: Colors.grey.shade300),
                            const SizedBox(height: 16),
                            Text(
                              "No favorite ${selectedCategory.toLowerCase()}s found",
                              style: TextStyle(fontSize: 18, color: Colors.grey.shade500, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      itemCount: filteredPets.length, // Uses filtered count
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 0.78,
                      ),
                      itemBuilder: (context, index) {
                        final pet = filteredPets[index]; // Displays filtered pet
                        return GridPetCard(
                          pet: pet,
                          onTap: () {
                            // Ensure HomeCubit is available down the route if needed
                            final homeCubit = context.read<HomeCubit>();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: homeCubit,
                                  child: PetDetailPage(pet: pet),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}