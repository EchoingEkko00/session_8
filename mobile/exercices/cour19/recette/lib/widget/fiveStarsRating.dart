import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:recette/provider/recetteProvider.dart';

class fiveStarsRating extends StatefulWidget {
  final double widthConstraint;
  const fiveStarsRating(this.widthConstraint, {super.key});

  @override
  State<fiveStarsRating> createState() => _fiveStarsRatingState();
}

class _fiveStarsRatingState extends State<fiveStarsRating> {
  final defaultColor = Colors.grey;
  final lightColor = Colors.yellow;
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;
  @override
  Widget build(BuildContext context) {
    return fiveStarsRating(widget.widthConstraint);
  }

  Widget fiveStarsRating(double width) {
    return Container(
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              padding: EdgeInsets.all(1),
              icon: Icon(
                Icons.star,
                color: star1 ? lightColor : defaultColor,
              ),
              onPressed: () {
                changeStar(1);
              }),
          IconButton(
              padding: EdgeInsets.all(1),
              icon: Icon(
                Icons.star,
                color: star2 ? lightColor : defaultColor,
              ),
              onPressed: () {
                changeStar(2);
              }),
          IconButton(
              padding: EdgeInsets.all(1),
              icon: Icon(
                Icons.star,
                color: star3 ? lightColor : defaultColor,
              ),
              onPressed: () {
                changeStar(3);
              }),
          IconButton(
              padding: EdgeInsets.all(1),
              icon: Icon(
                Icons.star,
                color: star4 ? lightColor : defaultColor,
              ),
              onPressed: () {
                changeStar(4);
              }),
          IconButton(
              padding: EdgeInsets.all(1),
              icon: Icon(
                Icons.star,
                color: star5 ? lightColor : defaultColor,
              ),
              onPressed: () {
                changeStar(5);
              }),
        ],
      ),
    );
  }

  changeStar(int star) {
    switch (star) {
      case 1:
        setState(() {
          star1 = true;
          star2 = false;
          star3 = false;
          star4 = false;
          star5 = false;
        });
        break;
      case 2:
        setState(() {
          star1 = true;
          star2 = true;
          star3 = false;
          star4 = false;
          star5 = false;
        });
        break;
      case 3:
        setState(() {
          star1 = true;
          star2 = true;
          star3 = true;
          star4 = false;
          star5 = false;
        });
        break;
      case 4:
        setState(() {
          star1 = true;
          star2 = true;
          star3 = true;
          star4 = true;
          star5 = false;
        });
        break;
      case 5:
        setState(() {
          star1 = true;
          star2 = true;
          star3 = true;
          star4 = true;
          star5 = true;
        });
        break;
    }
  }
}
