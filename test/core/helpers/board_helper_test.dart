import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_2048/core/helpers/board_helper.dart';
import 'package:flutter_web_2048/features/game/domain/entities/board.dart';
import 'package:flutter_web_2048/features/game/domain/entities/tile.dart';

void main() {
  group('getEmptyTileIndices', () {
    test("should have a length of 16 for a blank board", () {
      // ARRANGE
      var tiles = List<Tile>.generate(16, (index) {
        return Tile(0);
      });
      var board = Board(tiles);
      // ACT
      var actual = BoardHelper.getEmptyTileIndices(board);
      // ASSERT
      expect(actual.length, 16);
    });

    test("should return indices from 0 to 15 for a blank board", () {
      // ARRANGE
      var expected = List<int>.generate(16, (index) => index);
      var tiles = List<Tile>.generate(16, (index) {
        return Tile(0);
      });
      var board = Board(tiles);
      // ACT
      var actual = BoardHelper.getEmptyTileIndices(board);
      // ASSERT
      expect(actual.toList(), expected);
    });

    test("should have a length of 14 for an initial board", () {
      // ARRANGE
      var tiles = List<Tile>.generate(14, (index) {
        return Tile(0);
      });
      tiles.add(Tile(2));
      tiles.add(Tile(2));
      var board = Board(tiles);
      // ACT
      var actual = BoardHelper.getEmptyTileIndices(board);
      // ASSERT
      expect(actual.length, 14);
    });

    test("should return indices from 0 to 13 for an initial board", () {
      // ARRANGE
      var expected = List<int>.generate(14, (index) => index);
      var tiles = List<Tile>.generate(14, (index) {
        return Tile(0);
      });
      tiles.add(Tile(2));
      tiles.add(Tile(2));
      var board = Board(tiles);
      // ACT
      var actual = BoardHelper.getEmptyTileIndices(board);
      // ASSERT
      expect(actual.toList(), expected);
    });

    test("should have a length of 0 for a full board", () {
      // ARRANGE
      var tiles = List<Tile>.generate(14, (index) {
        return Tile(2);
      });
      var board = Board(tiles);
      // ACT
      var actual = BoardHelper.getEmptyTileIndices(board);
      // ASSERT
      expect(actual.length, 0);
    });

    test("should return 0 index for a full board", () {
      // ARRANGE
      var expected = <int>[];
      var tiles = List<Tile>.generate(16, (index) {
        return Tile(2);
      });
      var board = Board(tiles);
      // ACT
      var actual = BoardHelper.getEmptyTileIndices(board);
      // ASSERT
      expect(actual.toList(), expected);
    });

    test("should return indices 0,1,2,3,6,8,9 for a given random board", () {
      // ARRANGE
      var expected = <int>[0, 1, 2, 3, 6, 8, 9];
      var tiles = <Tile>[
        Tile(0), // 0
        Tile(0), // 1
        Tile(0), // 2
        Tile(0), // 3
        Tile(2), // 4
        Tile(16), // 5
        Tile(0), // 6
        Tile(256), // 7
        Tile(0), // 8
        Tile(0), // 9
        Tile(2), // 10
        Tile(4), // 11
        Tile(8), // 12
        Tile(16), // 13
        Tile(32), // 14
        Tile(64), // 15
      ];
      var board = Board(tiles);
      // ACT
      var actual = BoardHelper.getEmptyTileIndices(board);
      // ASSERT
      expect(actual.toList(), expected);
    });
  });
}