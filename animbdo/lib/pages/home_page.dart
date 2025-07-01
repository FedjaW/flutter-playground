import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomepPageState();
  }
}

class _HomepPageState extends State<HomePage> {
  double radius = 100;

  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [_pageBackground(), _circulatAnimationButton()],
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      duration: Duration(seconds: 2),
      builder: (context, double scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(color: Colors.blue),
    );
  }

  Widget _circulatAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            radius = 200;
          });
        },
        child: AnimatedContainer(
          curve: Curves.bounceInOut,
          duration: Duration(seconds: 2),
          height: radius,
          width: radius,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
