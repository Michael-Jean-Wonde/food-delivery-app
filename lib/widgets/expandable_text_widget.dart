// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 3.89;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              color: Colors.black38, size: Dimensions.font16, text: firstHalf)
          : Column(
              children: [
                SmallText(
                    height: 1.6,
                    color: Colors.black38,
                    size: Dimensions.font16,
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      hiddenText
                          ? SmallText(
                              size: 14,
                              text: 'Show more',
                              color: Colors.blueAccent,
                            )
                          : SmallText(
                              size: 14,
                              text: 'Show less',
                              color: Colors.blueAccent,
                            ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
    // return ExpandableText(
    //         widget.text,
    //         expandText: 'show more',
    //         collapseText: 'show less',
    //         maxLines: 5,
    //         linkColor: Colors.blue,

    // );
  }
}
