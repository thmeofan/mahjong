import 'package:flutter/material.dart';
import 'package:mahjong/views/app/widget/action_button.dart';

import '../../../util/app_routes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.8,
                  width: size.width * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/papyrus.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('LEVEL DONE'),
                      Text('Congratulations on passing the level'),
                      Text('Score'),
                      Row(
                        children: [
                          ActionButton(
                            onTap: () {},
                            assetName: 'assets/images/settings_icon.png',
                            buttonWidth: size.width * 0.2,
                            buttonHeight: size.height * 0.3,
                          ),
                          ActionButton(
                            onTap: () {},
                            assetName: 'assets/images/next.png',
                            buttonWidth: size.width * 0.2,
                            buttonHeight: size.height * 0.3,
                          ),
                          ActionButton(
                            onTap: () {},
                            assetName: 'assets/images/replay.png',
                            buttonWidth: size.width * 0.2,
                            buttonHeight: size.height * 0.3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.035,
            left: -size.width * 0.025,
            child: Image.asset('assets/images/chest.png'),
          ),
          Positioned(
            bottom: size.height * 0.035,
            right: -size.width * 0.025,
            child: Image.asset('assets/images/bison.png'),
          ),
        ],
      ),
    );
  }
}
