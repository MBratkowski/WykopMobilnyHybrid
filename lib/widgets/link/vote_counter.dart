import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';

class VoteCounterWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final String voteState;
  final num count;
  final bool isHot;
  final double size;
  final EdgeInsets padding;

  VoteCounterWidget({
    @required this.onClicked,
    @required this.voteState,
    @required this.count,
    @required this.isHot,
    this.size: 50.0,
    this.padding: const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onClicked,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Icon(
              OwmGlyphs.ic_frame_votes,
              size: size,
              color: _frameColor,
            ),
            _hotIcon(context),
            Padding(
              padding: EdgeInsets.only(
                left: (size / 33.33),
                top: (size / 25.00),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  letterSpacing: -(size / 100.00),
                  fontSize: (size / 3.57),
                  fontWeight: FontWeight.w700,
                  color: Color(0xffff5917),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hotIcon(BuildContext context) {
    if (isHot) {
      return Positioned(
        top: (size / 25),
        right: 0,
        child: Container(
          padding: EdgeInsets.only(
            bottom: (size / 33.33),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Icon(
            OwmGlyphs.ic_hot,
            size: (size / 3.33),
            color: Colors.red,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Color get _frameColor {
    if (voteState == "dig") {
      return Color(0xff3b915f);
    } else if (voteState == "bury") {
      return Color(0xffc0392b);
    } else {
      return Color(0xff4383af);
    }
  }
}