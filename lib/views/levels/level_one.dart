import 'package:flutter/material.dart';

// Define the MahjongTile class
class MahjongTile {
  final String image;
  bool isMatched;
  bool isSelectable;
  int id; // Unique identifier for matching logic

  MahjongTile(this.image, this.id,
      {this.isMatched = false, this.isSelectable = true});
}

class LevelOneScreen extends StatefulWidget {
  @override
  _LevelOneScreenState createState() => _LevelOneScreenState();
}

class _LevelOneScreenState extends State<LevelOneScreen> {
  List<MahjongTile> levelTiles;
  MahjongTile selectedTile1;
  MahjongTile selectedTile2;

  @override
  void initState() {
    super.initState();
    levelTiles = generateLevel();
  }

  // Tile selection logic
  void selectTile(MahjongTile tile) {
    setState(() {
      if (selectedTile1 == null) {
        selectedTile1 = tile;
      } else if (selectedTile2 == null && selectedTile1 != tile) {
        selectedTile2 = tile;
        checkForMatch();
      }
    });
  }

  // Matching logic
  void checkForMatch() {
    if (selectedTile1 != null && selectedTile2 != null) {
      if (selectedTile1.id == selectedTile2.id) {
        // It's a match
        setState(() {
          selectedTile1.isMatched = true;
          selectedTile2.isMatched = true;
          selectedTile1 = null;
          selectedTile2 = null;
        });
      } else {
        // It's not a match, reset after a short delay
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            selectedTile1 = null;
            selectedTile2 = null;
          });
        });
      }
    }
  }

  // Generate the level with pairs of tiles
  List<MahjongTile> generateLevel() {
    final List<MahjongTile> tiles = [];

    for (int i = 1; i <= 3; i++) {
      for (int j = 0; j < 8; j++) {
        int id = i; // Assign a unique ID based on the image number
        tiles.add(MahjongTile("assets/mahjong--$i.png", id));
        tiles.add(MahjongTile("assets/mahjong--$i.png", id));
      }
    }

    tiles.shuffle();
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level One'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: levelTiles.length,
        itemBuilder: (context, index) {
          final tile = levelTiles[index];
          return buildMahjongTile(tile);
        },
      ),
    );
  }

  Widget buildMahjongTile(MahjongTile tile) {
    return Opacity(
      opacity: tile.isSelectable && !tile.isMatched ? 1.0 : 0.5,
      child: GestureDetector(
        onTap: () => selectTile(tile),
        child: Container(
          decoration: BoxDecoration(
            border: selectedTile1 == tile || selectedTile2 == tile
                ? Border.all(color: Colors.red, width: 2)
                : null,
            image: DecorationImage(
              image: AssetImage(tile.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
