import 'package:flutter/material.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';
import '../../app/widget/navigation_button.dart';
import '../widget/mahjong_card_widget.dart';

class FirstLevelScreen extends StatefulWidget {
  const FirstLevelScreen({super.key});

  @override
  _FirstLevelScreenState createState() => _FirstLevelScreenState();
}

class _FirstLevelScreenState extends State<FirstLevelScreen> {
  final List<String> _availableIcons = [
    'assets/images/cards/mahjong--1.png',
    'assets/images/cards/mahjong--2.png',
    'assets/images/cards/mahjong--3.png',
    'assets/images/cards/mahjong--4.png',
    'assets/images/cards/mahjong--5.png',
    'assets/images/cards/mahjong--6.png',
    'assets/images/cards/mahjong--7.png',
    'assets/images/cards/mahjong--8.png',
  ];

  List<String> _gameIcons = [];
  int _previousIndex = -1;
  late List<bool> _cardMatched;
  late List<bool> _cardSelected;
  bool _isChecking = false;

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
      _cardSelected = List<bool>.filled(_gameIcons.length, false);
      _cardMatched = List<bool>.filled(_gameIcons.length, false);
      _previousIndex = -1;
      print(_gameIcons);
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
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.05,
                bottom: size.height * 0.025,
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Stack(children: [
                _buildCard(0, size.height * 0.1, size.width * 0.1),
                _buildCard(1, size.height * 0.2, size.width * 0.35),
                _buildCard(2, size.height * 0.15, size.width * 0.25),
                _buildCard(3, size.height * 0.17, size.width * 0.1),
                _buildCard(4, size.height * 0.08, size.width * 0.5),
                _buildCard(5, size.height * 0.21, size.width * 0.36),
                _buildCard(6, size.height * 0.29, size.width * 0.28),
                _buildCard(7, size.height * 0.51, size.width * 0.73),
                _buildCard(8, size.height * 0.21, size.width * 0.3),
                _buildCard(9, size.height * 0.23, size.width * 0.64),
                _buildCard(10, size.height * 0.45, size.width * 0.14),
                _buildCard(11, size.height * 0.29, size.width * 0.05),
                _buildCard(12, size.height * 0.1, size.width * 0.5),
                _buildCard(13, size.height * 0.05, size.width * 0.32),
                _buildCard(14, size.height * 0.52, size.width * 0.4),
                _buildCard(15, size.height * 0.35, size.width * 0.5),
              ]),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.1,
          left: size.width * 0.05,
          child: NavigationButton(
            assetName: 'assets/images/home.png',
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.home,
              );
            },
            buttonWidth: size.width * 0.08,
          ),
        ),
      ]),
    ));
  }

  void _onCardClick(int index) {
    if (_cardMatched[index] || _isChecking) return;

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
        _isChecking = true;

        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _cardSelected[_previousIndex] = false;
            _cardSelected[index] = false;
            _previousIndex = -1;
            _isChecking = false;
          });
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

  Widget _buildCard(int index, double topOffset, double leftOffset) {
    return Positioned(
      top: topOffset,
      left: leftOffset,
      child: MahjongCard(
        cardName: _gameIcons[index],
        onTap: () => _onCardClick(index),
        isSelected: _cardSelected[index],
      ),
    );
  }
}
