import 'package:flutter/material.dart';
import 'package:shataranj/components/piece.dart';
import 'package:shataranj/components/square.dart';
import 'package:shataranj/helper/helper_methods.dart';
import 'package:shataranj/values/colors.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {

  // A 2-dimensional list representing the chessboard,
  // with each postion possibly containig a chess peice 
  late List<List<ChessPiece?>> board;

  @override
  void initstate(){
    //TODO: implement initstate
    super.initState();
    _initialBoard(); 
  }

  //INIIALIZE BOARD
  void _initialBoard() {
    //initialize the board with nulls, meaning no pieces in those positions
    List<List<ChessPiece?>> newBoard = List.generate(8, (index) => List.generate(8, (index) => null));


    //Place pawns
  }

  //create a piece
  ChessPiece myPawn = ChessPiece(
    type: ChessPieceType.pawn,
    isWhite: true,
    imagePath: 'lib/images/pawn.png',
  )
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GridView.builder(
          itemCount: 8 * 8,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemBuilder: (context, index) {
            return Square(isWhite: isWhite(index),
            piece: myPawn,
            );
          }),
    );
  }
}
