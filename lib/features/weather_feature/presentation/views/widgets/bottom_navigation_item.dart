import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomizedBottomNavigationItem extends StatefulWidget {
  const CustomizedBottomNavigationItem({Key? key}) : super(key: key);

  @override
  State<CustomizedBottomNavigationItem> createState() => _CustomizedBottomNavigationItemState();
}

class _CustomizedBottomNavigationItemState extends State<CustomizedBottomNavigationItem>  with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
  late AnimationController animationController;
  late Animation<Offset> slidingHomeIconAnimation;
  late Animation<Offset> slidingNewsIconAnimation;

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: BottomNavigationBar(
        elevation: 0.08,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        //selectedFontSize: 13,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //unselectedFontSize: 13,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: AnimatedBuilder(
              animation: slidingHomeIconAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: slidingHomeIconAnimation,
                  child: const Icon(Icons.home),
                );
              },
            ),
            backgroundColor: kClearSkyScaffoldColor.withOpacity(0.4),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: AnimatedBuilder(
              animation: slidingNewsIconAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: slidingNewsIconAnimation,
                  child: const Icon(Icons.feed_sharp),
                );
              },
            ),
            backgroundColor: kClearSkyScaffoldColor.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 500));
    slidingHomeIconAnimation =
        Tween<Offset>(begin: const Offset(-5, 0), end: Offset.zero)
            .animate(animationController);
    slidingNewsIconAnimation =
        Tween<Offset>(begin: const Offset(5, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
