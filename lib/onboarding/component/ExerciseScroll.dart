import 'package:flutter/material.dart';
import 'dart:async';

class ExerciseScroll extends StatefulWidget {
  @override
  _ExerciseScrollState createState() => _ExerciseScrollState();
}

class _ExerciseScrollState extends State<ExerciseScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final ScrollController _scrollController1;
  late final ScrollController _scrollController2;

  final double _cardWidth = 250.0;
  final double _margin = 8.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();

    // THE FIX IS HERE: We wait for the first frame to be built
    // before we start the animation.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToEnd();
    });
  }

  void _scrollToEnd() async {
    // This loop ensures the animation is smooth and continuous
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 20));
      if (mounted) {
        final double maxScroll1 = _scrollController1.position.maxScrollExtent;
        final double currentScroll1 = maxScroll1 * _animationController.value;
        _scrollController1.jumpTo(currentScroll1);

        final double maxScroll2 = _scrollController2.position.maxScrollExtent;
        final double currentScroll2 = maxScroll2 * (1 - _animationController.value);
        _scrollController2.jumpTo(currentScroll2);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  Widget buildCard(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(_margin),
      width: 100,  // Use the same size for width
      height: 100, // and height to make it a square
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      // Use ClipRRect to make the image have rounded corners
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imageUrl,
          // BoxFit.cover makes the image fill the entire container
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final testimonials = [
      buildCard(
          'assets/images/male.png'),
      buildCard(
          'assets/images/female.png'),
      buildCard(
          'assets/images/female.png'),
      buildCard(
          'assets/images/male.png'),
    ];

    // We duplicate the list to ensure there's enough content to scroll infinitely
    final extendedTestimonials = [...testimonials, ...testimonials];

    return Column(
      children: [
        // Upper row: scrolls from left to right
        SizedBox(
          height: 120, // Give the ListView a fixed height
          child: ListView.builder(
            controller: _scrollController1,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: extendedTestimonials.length,
            itemBuilder: (context, index) {
              return extendedTestimonials[index];
            },
          ),
        ),
        const SizedBox(height: 16), // Add some space between the rows
        // Lower row: scrolls from right to left
        SizedBox(
          height: 120, // Give the ListView a fixed height
          child: ListView.builder(
            controller: _scrollController2,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: extendedTestimonials.length,
            itemBuilder: (context, index) {
              return extendedTestimonials[index];
            },
          ),
        ),
      ],
    );
  }
}
