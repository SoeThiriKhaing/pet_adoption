// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../adopt_pet.dart'; // သင့် project imports
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String selectedCategory = 'Dog'; // Default category
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Find Your Best Friend'),
//         actions: [
//           IconButton(
//             onPressed: () => context.read<AuthenticationCubit>().logOut(),
//             icon: const Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           // Category Selection
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 _buildCategoryChip('Dog', Icons.pets),
//                 const SizedBox(width: 12),
//                 _buildCategoryChip('Cat', Icons.catching_pokemon),
//               ],
//             ),
//           ),
//
//           // Pet List Area
//           Expanded(
//             child: BlocBuilder<PetListCubit, PetListState>(
//               builder: (context, state) {
//                 return state.maybeWhen(
//                   loading: () => const Center(child: CircularProgressIndicator()),
//                   success: (allPets) {
//                     final filteredPets = allPets
//                         .where((pet) => pet.category == selectedCategory)
//                         .toList();
//
//                     if (filteredPets.isEmpty) {
//                       return Center(child: Text('No $selectedCategory found!'));
//                     }
//
//                     return ListView.builder(
//                       itemCount: filteredPets.length,
//                       itemBuilder: (context, index) {
//                         final pet = filteredPets[index];
//                         return _buildPetCard(pet);
//                       },
//                     );
//                   },
//                   error: (msg) => Center(child: Text(msg)),
//                   orElse: () => const SizedBox(),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryChip(String label, IconData icon) {
//     final isSelected = selectedCategory == label;
//     return GestureDetector(
//       onTap: () => setState(() => selectedCategory = label),
//       child: Chip(
//         avatar: Icon(icon, color: isSelected ? Colors.white : Colors.grey),
//         label: Text(label),
//         backgroundColor: isSelected ? Colors.orange : Colors.grey[200],
//         labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
//       ),
//     );
//   }
//
//   Widget _buildPetCard(PetModel pet) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(pet.imageUrl),
//         ),
//         title: Text(pet.name),
//         subtitle: Text('${pet.breed} • ${pet.age} years old'),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: () {
//           // Pet Detail သို့သွားရန်
//         },
//       ),
//     );
//   }
// }