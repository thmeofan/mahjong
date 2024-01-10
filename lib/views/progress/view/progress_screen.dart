import 'package:flutter/material.dart';

import '../../../util/app_routes.dart';
import '../../app/widget/navigation_button.dart';
import '../widget/level_button.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final int numberOfLevels = 5;
  int selectedLevelIndex = 0;

  void _onPrevious() {
    setState(() {
      selectedLevelIndex =
          (selectedLevelIndex - 1 + numberOfLevels) % numberOfLevels;
    });
  }

  void _onNext() {
    setState(() {
      selectedLevelIndex = (selectedLevelIndex + 1) % numberOfLevels;
    });
  }

  void _onStartLevel() {
    switch (selectedLevelIndex) {
      // case 0:
      //   if (life >= 1) {
      //     Navigator.of(context).pushNamed(AppRoutes.lvl1);
      //     score -= 50;
      //     life -= 1;
      //   } else {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text(
      //           'Sorry, you\'re out of lives',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         backgroundColor: Color(0xFFEAAD82),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(10)),
      //         ),
      //         margin: EdgeInsets.symmetric(horizontal: 150),
      //         behavior: SnackBarBehavior.floating,
      //         duration: Duration(seconds: 2),
      //       ),
      //     );
      //   }
      //   break;
      //
      // case 1:
      //   if (life >= 1) {
      //     Navigator.of(context).pushNamed(AppRoutes.lvl2);
      //     score -= 50;
      //     life -= 1;
      //   } else {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text(
      //           'Sorry, you\'re out of lives',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         backgroundColor: Color(0xFFEAAD82),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(10)),
      //         ),
      //         margin: EdgeInsets.symmetric(horizontal: 200),
      //         behavior: SnackBarBehavior.floating,
      //         duration: Duration(seconds: 2),
      //       ),
      //     );
      //   }
      //   break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This level isn\'t unlocked yet',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEAAD82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 200),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        break;
      case 3:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This level isn\'t unlocked yet',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEAAD82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 200),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        break;
      case 4:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This level isn\'t unlocked yet',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEAAD82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 200),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        break;
      default:
        Navigator.of(context).pushNamed(AppRoutes.lvl1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      )),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenHeight * 0.2,
                  ),
                  child: Row(
                    children: [
                      LevelButton(
                        assetName: 'assets/images/levels/lvl1.svg',
                        isSelected: selectedLevelIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedLevelIndex = 1;
                          });
                          _onStartLevel();
                        },
                      ),
                      LevelButton(
                        assetName: 'assets/images/levels/lvl2.svg',
                        isSelected: selectedLevelIndex == 3,
                        onTap: () {
                          setState(() {
                            selectedLevelIndex = 3;
                          });
                          _onStartLevel();
                        },
                      ),
                      LevelButton(
                        assetName: 'assets/images/levels/lvl3.svg',
                        isSelected: selectedLevelIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedLevelIndex = 1;
                          });
                          _onStartLevel();
                        },
                      ),
                      LevelButton(
                        assetName: 'assets/images/levels/lvl4.svg',
                        isSelected: selectedLevelIndex == 3,
                        onTap: () {
                          setState(() {
                            selectedLevelIndex = 3;
                          });
                          _onStartLevel();
                        },
                      ),
                      LevelButton(
                        assetName: 'assets/images/levels/lvl5.svg',
                        isSelected: selectedLevelIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedLevelIndex = 1;
                          });
                          _onStartLevel();
                        },
                      ),
                      LevelButton(
                        assetName: 'assets/images/levels/lvl6.svg',
                        isSelected: selectedLevelIndex == 3,
                        onTap: () {
                          setState(() {
                            selectedLevelIndex = 3;
                          });
                          _onStartLevel();
                        },
                      ),
                      LevelButton(
                        assetName: 'assets/images/levels/lvl7.svg',
                        isSelected: selectedLevelIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedLevelIndex = 1;
                          });
                          _onStartLevel();
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LevelButton(
                      assetName: 'assets/images/levels/lvl8.svg',
                      isSelected: selectedLevelIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 1;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl9.svg',
                      isSelected: selectedLevelIndex == 3,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 3;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl10.svg',
                      isSelected: selectedLevelIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 1;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl11.svg',
                      isSelected: selectedLevelIndex == 3,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 3;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl12.svg',
                      isSelected: selectedLevelIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 1;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl13.svg',
                      isSelected: selectedLevelIndex == 3,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 3;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl14.svg',
                      isSelected: selectedLevelIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 1;
                        });
                        _onStartLevel();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.025,
            child: NavigationButton(
              assetName: 'assets/images/home.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.home,
                );
              },
              buttonWidth: screenWidth * 0.08,
            ),
          ),
        ],
      ),
    ));
  }
}
