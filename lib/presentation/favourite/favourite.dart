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
      appBar:  AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),

        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/appbar/app.png",
              fit: BoxFit
                  .cover, // 6. Forces the image to fill the entire header area without warping
            ),
          ],
        ),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text("Error: $message")),
            ready: (favoritePets) {
              if (favoritePets.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite_border_rounded, size: 70, color: Colors.grey.shade300),
                      const SizedBox(height: 16),
                      Text(
                        "No favorites added yet",
                        style: TextStyle(fontSize: 18, color: Colors.grey.shade500, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }

              // Perfect 2-Column Responsive Matrix Grid
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: favoritePets.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,       // Forces exactly 2 structural columns
                  mainAxisSpacing: 14,     // Vertical gap distance between cards
                  crossAxisSpacing: 14,    // Horizontal gap distance between cards
                  childAspectRatio: 0.78,  // card height proportion tuning wrapper index
                ),
                itemBuilder: (context, index) {
                  final pet = favoritePets[index];
                  return GridPetCard(
                    pet: pet,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetDetailPage(pet: pet),
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
    );
  }
}