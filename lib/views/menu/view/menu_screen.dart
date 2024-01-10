import 'package:flutter/material.dart';

import '../../../util/app_routes.dart';
import '../../app/widget/action_button.dart';
import '../../app/widget/navigation_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State createState() => _MenuScreenState();
}

class _MenuScreenState extends State {
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
          Center(
            child: Column(
              children: [
                ActionButton(
                  buttonWidth: size.width * 0.2,
                  buttonHeight: size.height * 0.3,
                  assetName: 'assets/images/play.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.progress,
                    );
                  },
                ),
                ActionButton(
                  buttonWidth: size.width * 0.2,
                  buttonHeight: size.height * 0.3,
                  assetName: 'assets/images/settings.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.progress,
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.1,
            left: size.width * 0.025,
            child: Row(
              children: [
                ActionButton(
                  buttonWidth: size.width * 0.2,
                  buttonHeight: size.height * 0.3,
                  assetName: 'assets/images/score.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.progress,
                    );
                  },
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
        ]),
      ),
    );
  }
}
