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
      child: _PetDetailView(pet: pet),
    );
  }
}

class _PetDetailView extends StatelessWidget {
  final PetEntity pet;
  const _PetDetailView({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: pet.id,
                child: Image.network(pet.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pet.name, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("${pet.breed} • ${pet.age} Years", style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  const Divider(height: 40),
                  const Text("Description", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("Looking for a sweet family to join! Friendly and ready for adoption."),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomBtn(context),
    );
  }

  Widget _buildBottomBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () => _showDialog(context),
        child: const Text("Adopt Me Now", style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.green),
            title: const Text("Call Admin"),
            onTap: () => context.read<PetDetailCubit>().makeCall(),
          ),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.red),
            title: const Text("Email Admin"),
            onTap: () => context.read<PetDetailCubit>().sendEmail(pet.name),
          ),
        ],
      ),
    );
  }
}