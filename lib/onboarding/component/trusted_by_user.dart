import 'package:flutter/material.dart';

class TrustedByCard extends StatelessWidget {
  const TrustedByCard({super.key});

  @override
  Widget build(BuildContext context) {
    // A list of user image URLs for the avatars
    final List<String> userImages = [
      'assets/images/healthier.jpg',
      'assets/images/male.png',
      'assets/images/female.png',
      'assets/images/female.png',
      'assets/images/male_lose.png',
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Trusted by",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          const Text(
            "20,321,334 users",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Laurel
              const Icon(Icons.spa_outlined, color: Colors.blue, size: 40),
              const SizedBox(width: 16),
              // Center Content (Rating and Stars)
              Column(
                children: [
                  const Text("4.8",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(Icons.star, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Right Laurel (flipped)
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159), // Flip horizontally
                child: const Icon(Icons.spa_outlined, color: Colors.blue, size: 40),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Overlapping User Avatars using a Stack
          SizedBox(
            height: 40,
            width: 150,
            child: Stack(
              children: List.generate(userImages.length, (index) {
                return Positioned(
                  left: (index * 25.0), // Overlap each avatar by 25 pixels
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(userImages[index]),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
