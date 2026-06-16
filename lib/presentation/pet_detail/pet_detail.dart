import 'package:flutter/cupertino.dart'; // 💡 Imported for the native iOS arrow
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../adopt_pet.dart';

class PetDetailPage extends StatelessWidget {
  final PetEntity pet;

  const PetDetailPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<PetDetailCubit>(),
      child: PetDetailReadyView(pet: pet),
    );
  }
}

