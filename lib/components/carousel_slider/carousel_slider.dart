import 'package:flutter/material.dart';
import 'package:pet/adopt_pet.dart';

class PetBannerCarousel extends StatefulWidget {
  final List<CustomBanner> banners;

  const PetBannerCarousel({super.key, required this.banners});

  @override
  State<PetBannerCarousel> createState() => _PetBannerCarouselState();
}

class _PetBannerCarouselState extends State<PetBannerCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200,
          // Slightly taller than banner height to account for shadows
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              // Adds smooth padding padding between adjacent carousel cards
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: widget.banners[index],
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // Animated Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.banners.length, (index) {
            bool isActive = _currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 8,
              width: isActive ? 24 : 8,
              // Stretches active dot slightly
              decoration: BoxDecoration(
                color: isActive ? Colors.orangeAccent : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
