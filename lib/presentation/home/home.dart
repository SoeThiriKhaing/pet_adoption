import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet/adopt_pet.dart';

class PetHomePage extends StatelessWidget {
  const PetHomePage({super.key});

  static const String routeName = "pet-home";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<HomeCubit>()..fetchPets('All'),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clrWhite,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 140,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("assets/images/appbar/appb.png", fit: BoxFit.cover),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
        child: Column(
          children: [
            CustomSearchBox(),
            $styles.insets.sm.toHeightSizedBox,
            PetBannerCarousel(
              banners: [
                CustomBanner(
                  title: "Adopt Max Today!",
                  subtitle: "He has been at the shelter the longest.",
                  buttonText: "Meet Max",
                  backgroundImageUrl:
                      "https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=500",
                  onTap: () => print("Navigating to Max's profile"),
                ),
                CustomBanner(
                  title: "Donation Drive",
                  subtitle:
                      "100% of proceeds fund emergency pet medical bills.",
                  buttonText: "Donate Now",
                  gradientColors: const [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                  onTap: () => print("Opening Stripe checkout screen"),
                ),
                CustomBanner(
                  title: "Volunteer Sunday",
                  subtitle:
                      "Join us this weekend for our puppy socialization walk!",
                  buttonText: "Sign Up",
                  gradientColors: const [Color(0xFF2196F3), Color(0xFF1565C0)],
                  onTap: () => print("Opening volunteer registration form"),
                ),
              ],
            ),
            $styles.insets.md.toHeightSizedBox,

            const CategoryBar(),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (message) => Center(child: Text("Error")),
                    ready: (pets, selectedCategory) {
                      if (pets.isEmpty) {
                        return const Center(child: Text("No pets available."));
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: pets.length,
                        itemBuilder: (context, index) {
                          final pet = pets[index];
                          return PetCard(
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
            ),
          ],
        ),
      ),
    );
  }
}
