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
      appBar: AppBar(title: const Text("Adopt a Friend"), centerTitle: true),
      body: Column(
        children: [
          const CategoryBar(),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(child: Text("Error")),
                  ready: (pets, selectedCategory) {
                    if (pets.isEmpty) return const Center(child: Text("No pets available."));

                    debugPrint("Pets Length:${pets.length}");
                    return ListView.builder(
                      padding: const EdgeInsets.all(15),
                      itemCount: pets.length,

                      itemBuilder: (context, index) {
                        final pet=pets[index];
                      return  PetCard(
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
                      }
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