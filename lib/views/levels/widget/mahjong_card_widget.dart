import 'package:flutter/material.dart';

class MahjongCard extends StatelessWidget {
  final String cardName;
  final VoidCallback onTap;
  final bool isSelected;

  const MahjongCard({
    super.key,
    required this.cardName,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.1;
    double cardHeight = MediaQuery.of(context).size.width * 0.2;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap, // Make sure we're using the onTap callback
      child: ClipRect(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border:
                isSelected ? Border.all(color: Colors.white, width: 3) : null,
            image: DecorationImage(
              image: AssetImage(cardName),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
//
// Future<List<MahjongCard>> loadCards() async {
//   final manifestContent = await rootBundle.loadString('AssetManifest.json');
//   final Map<String, dynamic> manifestMap = json.decode(manifestContent);
//
//   final iconPaths = manifestMap.keys
//       .where((String key) => key.startsWith('assets/icons/'))
//       .toList();
//
//   List<MahjongCard> cards = iconPaths
//       .map((iconPath) => MahjongCard(cardName: iconPath.split('/').last))
//       .toList();
//
//   return cards;
// }
