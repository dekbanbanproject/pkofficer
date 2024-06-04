import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChang;
  final int currentSlide;
  const ImageSlider(
      {super.key, required this.currentSlide, required this.onChang});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChang,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  "images/technician_1.png",
                    // "images/techserevice.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "images/technician_2.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "images/truesee.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "images/group.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlide == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
