import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';
import '../../app/widget/navigation_button.dart';
import '../widget/mahjong_card_widget.dart';

class SecondLevelScreen extends StatefulWidget {
  const SecondLevelScreen({super.key});

  @override
  _SecondLevelScreenState createState() => _SecondLevelScreenState();
}

class _SecondLevelScreenState extends State<SecondLevelScreen> {
  final List<String> _availableIcons = [
    'assets/images/cards/mahjong--1.png',
    'assets/images/cards/mahjong--2.png',
    'assets/images/cards/mahjong--3.png',
    'assets/images/cards/mahjong--4.png',
    'assets/images/cards/mahjong--5.png',
    'assets/images/cards/mahjong--6.png',
    'assets/images/cards/mahjong--7.png',
    'assets/images/cards/mahjong--8.png',
    'assets/images/cards/mahjong--9.png',
    'assets/images/cards/mahjong--10.png',
    'assets/images/cards/mahjong--11.png',
    'assets/images/cards/mahjong--12.png',
  ];

  List<String> _gameIcons = [];
  int _previousIndex = -1;
  late List<bool> _cardMatched;
  late List<bool> _cardSelected;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    setState(() {
      List<String> halfGameIcons = List<String>.from(_availableIcons)
        ..shuffle();
      halfGameIcons = halfGameIcons.take(8).toList();

      _gameIcons = [...halfGameIcons, ...halfGameIcons];
      _gameIcons.shuffle();

      _cardMatched = List<bool>.filled(_gameIcons.length, false);
      _previousIndex = -1;
      _cardSelected = List<bool>.filled(_gameIcons.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(1),
            BlendMode.dstATop,
          ),
        )),
        // child: Stack(children: [
        //   Align(
        //     alignment: Alignment.center,
        //     child: Center(
        //       child: Padding(
        //         padding: EdgeInsets.only(
        //           top: size.height * 0.01,
        //           bottom: size.height * 0.1,
        //           left: size.width * 0.02,
        //           right: size.width * 0.02,
        //         ),
        //         child: Stack(
        //           children: [
        //             // child: GridView.builder(
        //             //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             //     crossAxisCount: 4,
        //             //     childAspectRatio: 2.5,
        //             //     crossAxisSpacing: size.width * 0.002,
        //             //     mainAxisSpacing: size.width * 0.006,
        //             //   ),
        //             //   itemCount: _gameIcons.length,
        //             //   itemBuilder: (context, index) {
        //             //     return _cardMatched[index]
        //             //         ? Container()
        //             //         : MahjongCard(
        //             //             cardName: _gameIcons[index],
        //             //             onTap: () => _onCardClick(index),
        //             //             isSelected: _cardSelected[index],
        //             //           );
        //             //   },
        //             // ),
        //             GridView.count(
        //               crossAxisCount: 5,
        //               childAspectRatio: 2.5,
        //               crossAxisSpacing: size.width * 0.002,
        //               mainAxisSpacing: size.width * 0.006,
        //               shrinkWrap: true,
        //               physics: NeverScrollableScrollPhysics(),
        //               children: List.generate(10, (index) {
        //                 return _cardMatched[index]
        //                     ? Container()
        //                     : MahjongCard(
        //                         cardName: _gameIcons[index],
        //                         onTap: () => _onCardClick(index),
        //                         isSelected: _cardSelected[index],
        //                       );
        //               }),
        //             ),
        //             SizedBox(height: 20),
        //             GridView.count(
        //               crossAxisCount: 7,
        //               childAspectRatio: 2.5,
        //               crossAxisSpacing: size.width * 0.002,
        //               mainAxisSpacing: size.width * 0.006,
        //               shrinkWrap: true,
        //               // physics:
        //               //     NeverScrollableScrollPhysics(),
        //               children: List.generate(14, (index) {
        //                 //  int bottomIndex = index + 6;
        //                 return _cardMatched[index]
        //                     ? Container()
        //                     : MahjongCard(
        //                         cardName: _gameIcons[index],
        //                         onTap: () => _onCardClick(index),
        //                         isSelected: _cardSelected[index],
        //                       );
        //               }),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   Positioned(
        //     top: size.height * 0.1,
        //     left: size.width * 0.05,
        //     child: Row(
        //       children: [
        //         NavigationButton(
        //           assetName: 'assets/images/home.png',
        //           onTap: () {
        //             Navigator.of(context).pushNamed(
        //               AppRoutes.home,
        //             );
        //           },
        //           buttonWidth: size.width * 0.08,
        //         ),
        //       ],
        //     ),
        //   ),
        // ]),
      ),
    );
  }

  void _onCardClick(int index) {
    if (_cardMatched[index]) return;

    setState(() {
      _cardSelected[index] = true;
    });

    if (_previousIndex == -1) {
      setState(() {
        _previousIndex = index;
      });
    } else {
      if (_gameIcons[index] == _gameIcons[_previousIndex]) {
        setState(() {
          _cardMatched[index] = true;
          _cardMatched[_previousIndex] = true;
          _cardSelected[index] = false;
          _cardSelected[_previousIndex] = false;
          _previousIndex = -1;
        });
        _checkForCompletion();
      } else {
        setState(() {
          _cardSelected[_previousIndex] = false;
          _previousIndex = -1;
        });
      }
    }
  }

  void _checkForCompletion() {
    if (_cardMatched.every((bool status) => status)) {
      Navigator.of(context).pushNamed(
        AppRoutes.result,
      );
      score += 100;
    }
  }
}
