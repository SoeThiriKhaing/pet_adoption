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
    final auth = context.read<AuthenticationCubit>();

    return BlocProvider(
      create: (context) => inject<AddPetCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.clrWhite,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 140,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: auth.logOut,
              icon: const Icon(Icons.logout_rounded, color: Colors.white),
            ),
          ],
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/images/appbar/appb.png",
                fit: BoxFit
                    .cover, // 6. Forces the image to fill the entire header area without warping
              ),
            ],
          ),
        ),
        body: BlocConsumer<AddPetCubit, AddPetState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("✨ Pet added successfully!"),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
                context.pop();
              },
              error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.clrPrimary),
              ),
              orElse: () => AddPetForm(bloc: context.read<AddPetCubit>()),
            );
          },
        ),
      ),
    );
  }
}
