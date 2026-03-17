import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../adopt_pet.dart';

class AddPetHome extends StatelessWidget {
  const AddPetHome({super.key});

  static const String routeName = "admin-add-pet";
  static const String routePath = "/$routeName";

  @override
  Widget build(BuildContext context) {
    final auth=context.read<AuthenticationCubit>();
    return BlocProvider(
      create: (context) => inject<AddPetCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add New Pet"),
          actions: [
            IconButton(onPressed:auth.logOut, icon: Icon(Icons.logout))
          ],
        ),
        body: BlocConsumer<AddPetCubit, AddPetState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pet added successfully!")),
                );
                context.pop();
              },
              error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              ),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => AddPetForm(
                bloc: context.read<AddPetCubit>(),
              ),
            );
          },
        ),
      ),
    );
  }
}