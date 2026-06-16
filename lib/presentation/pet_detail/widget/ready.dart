import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../adopt_pet.dart';

class PetDetailReadyView extends StatefulWidget {
  final PetEntity pet;

  const PetDetailReadyView({super.key, required this.pet});

  @override
  State<PetDetailReadyView> createState() => _PetDetailReadyViewState();
}

class _PetDetailReadyViewState extends State<PetDetailReadyView> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.pet.isFavorite;
    debugPrint("Is fav:${widget.pet.isFavorite}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 420,
            pinned: true,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.chevron_back,
                    color: AppColors.clrPurple,
                    size: 24,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
                child: Hero(
                  tag: widget.pet.id,
                  child: Image.network(
                    widget.pet.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      color: Colors.grey.shade100,
                      child: const Icon(
                        Icons.pets_rounded,
                        size: 80,
                        color: AppColors.clrGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.pet.name,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      // --- NEW FAVORITE ACTION BUTTON ---
                      Material(
                        color: Colors.white,
                        elevation: 2,
                        shadowColor: AppColors.clrGrey,
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                            context.read<HomeCubit>().toggleFavorite(
                              widget.pet.id,
                              _isFavorite,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              _isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: _isFavorite
                                  ? Colors.redAccent
                                  : Colors.grey.shade400,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                      // ----------------------------------
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      _buildInfoTag(Icons.pets_rounded, widget.pet.breed),
                      const SizedBox(width: 12),
                      _buildInfoTag(
                        Icons.cake_rounded,
                        "${widget.pet.age} Years Old",
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Divider(color: Colors.black12, height: 1),
                  ),

                  const Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Meet ${widget.pet.name}! A wonderful companion looking \n for a sweet family to join. "
                    "Friendly, healthy, \n interactive, and fully ready for \n immediate adoption into a loving home.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomBtn(context),
    );
  }

  Widget _buildInfoTag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.clrPurple),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.clrBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBtn(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.clrPurple,
          foregroundColor: AppColors.clrWhite,
          minimumSize: const Size(double.infinity, 56),
          elevation: 4,
          shadowColor: AppColors.clrPurple.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () => _showDialog(context),
        child: const Text(
          "Adopt Me Now",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.phone_rounded, color: Colors.green),
              ),
              title: const Text(
                "Call Admin",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                context.read<PetDetailCubit>().makeCall();
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.email_rounded, color: Colors.red),
              ),
              title: const Text(
                "Email Admin",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                context.read<PetDetailCubit>().sendEmail(widget.pet.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
