import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../adopt_pet.dart';

class HomeReadyView extends StatefulWidget {
  const HomeReadyView({super.key});

  @override
  State<HomeReadyView> createState() => _HomeReadyViewState();
}

class _HomeReadyViewState extends State<HomeReadyView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                  onTap: () {},
                ),
                CustomBanner(
                  title: "Donation Drive",
                  subtitle:
                      "100% of proceeds fund emergency pet medical bills.",
                  buttonText: "Donate Now",
                  gradientColors: const [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                  onTap: () {},
                ),
                CustomBanner(
                  title: "Volunteer Sunday",
                  subtitle:
                      "Join us this weekend for our puppy socialization walk!",
                  buttonText: "Sign Up",
                  gradientColors: const [Color(0xFF2196F3), Color(0xFF1565C0)],
                  onTap: () {},
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
                    error: (message) => const Center(child: Text("Error")),
                    ready: (pets, selectedCategory) {
                      if (pets.isEmpty) {
                        return const Center(child: Text("No pets available."));
                      }
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          return PageView.builder(
                            controller: _pageController,
                            itemCount: pets.length,
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              double scale = 1.0;
                              if (_pageController.position.haveDimensions) {
                                double value = _pageController.page! - index;
                                scale = (1 - (value.abs() * 0.15)).clamp(
                                  0.85,
                                  1.0,
                                );
                              } else {
                                scale = index == 0 ? 1.0 : 0.85;
                              }

                              final pet = pets[index];
                              return PetCard(
                                pet: pet,
                                scale: scale,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PetDetailPage(pet: pet),
                                    ),
                                  );
                                },
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
