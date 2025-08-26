import 'package:flutter/material.dart';

class SelectionBox extends StatelessWidget {
  final String title;
  final String? imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final double height;

  const SelectionBox({
    super.key,
    required this.title,
    this.imagePath,
    required this.isSelected,
    required this.onTap,
    this.height=120
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                  width: 2,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                if (imagePath != null)
                  Image.asset(
                    imagePath!, // Use Image.asset with the path
                    height: 120,// Adjust the size as needed
                  )
              ],
            ),
          ),
          if(isSelected)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.blueAccent,
                  size: 33,
                ),
              ),
            )
        ],
      ),
    );
  }
}