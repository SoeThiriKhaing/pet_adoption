import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet/adopt_pet.dart';
import 'package:pet/presentation/home/widget/ready.dart';

class PetHomePage extends StatelessWidget {
  const PetHomePage({super.key});

  static const String routeName = "pet-home";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<HomeCubit>()..fetchPets('All'),
      child: const HomeReadyView(),
    );
  }
}
