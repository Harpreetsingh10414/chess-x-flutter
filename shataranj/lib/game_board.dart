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

  //The currently selected piece on the chess board
  //If no piece is selected, this is null
  ChessPiece? selectedPiece;

  //The row index of the selected piece
  //Default value -1 indicated no piece is currently selected
  int selectedRow = -1;

  //The col index of the selected piece
  //Default value -1 indicated no piece is currently selected
  int selectedCol = -1;

  //A list of valid moves fot the currently selected piece

  @override
  void initstate() {
    //TODO: implement initstate
    super.initState();
    _initialBoard();
  }

  //INIIALIZE BOARD
  void _initialBoard() {
    //initialize the board with nulls, meaning no pieces in those positions
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    //Place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
        type: ChessPieceType.pawn,
        isWhite: false,
        imagePath: 'lib/images/pawn.png',
      );

      newBoard[1][i] = ChessPiece(
        type: ChessPieceType.pawn,
        isWhite: true,
        imagePath: 'lib/images/pawn.png',
      );
    }
    //Place rooks

    newBoard[0][0] = ChessPiece(
        type: ChessPieceType.rook, isWhite: false, imagePath: imagePath);
    newBoard[0][7] = ChessPiece(
        type: ChessPieceType.rook, isWhite: false, imagePath: imagePath);
    newBoard[7][0] = ChessPiece(
        type: ChessPieceType.rook, isWhite: true, imagePath: imagePath);
    newBoard[7][7] = ChessPiece(
        type: ChessPieceType.rook, isWhite: true, imagePath: imagePath);
    //Place knights

    newBoard[0][1] = ChessPiece(
        type: ChessPieceType.knight, isWhite: false, imagePath: imagePath);
    newBoard[0][6] = ChessPiece(
        type: ChessPieceType.knight, isWhite: false, imagePath: imagePath);
    newBoard[7][1] = ChessPiece(
        type: ChessPieceType.knight, isWhite: true, imagePath: imagePath);
    newBoard[7][6] = ChessPiece(
        type: ChessPieceType.knight, isWhite: true, imagePath: imagePath);
    //Place bishops

    newBoard[0][2] = ChessPiece(
        type: ChessPieceType.bishop, isWhite: false, imagePath: imagePath);
    newBoard[0][5] = ChessPiece(
        type: ChessPieceType.bishop, isWhite: false, imagePath: imagePath);
    newBoard[7][2] = ChessPiece(
        type: ChessPieceType.bishop, isWhite: true, imagePath: imagePath);
    newBoard[7][5] = ChessPiece(
        type: ChessPieceType.bishop, isWhite: true, imagePath: imagePath);

    //Place queens

    newBoard[0][3] = ChessPiece(
        type: ChessPieceType.queen, isWhite: false, imagePath: imagePath);
    newBoard[7][4] = ChessPiece(
        type: ChessPieceType.queen, isWhite: true, imagePath: imagePath);

    //Place Kings

    newBoard[0][4] = ChessPiece(
        type: ChessPieceType.king, isWhite: false, imagePath: imagePath);
    newBoard[7][3] = ChessPiece(
        type: ChessPieceType.king, isWhite: true, imagePath: imagePath);

    board = newBoard;
  }

  //USER SELECTED A PIECE
  void pieceSelected(int row, int col) {
    setState(() {
      //selected a piece if there is a piece in that position
      if (board[row][col] != null) {
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }
    });
  }

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
            //get the row and col position os this square
            int row = index ~/ 8;
            int col = index % 8;

            //check if this square is selected
            bool isSelected = selectedRow == row && selectedCol == col;
            return Square(
              isWhite: isWhite(index),
              piece: board[row][col],
              isSelected: isSelected,
              onTap: () => pieceSelected(row, col),
            );
          }),
    );
  }
}
