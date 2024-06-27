import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingCartHeader extends StatefulWidget {
  final int selectedId;
  final ValueChanged<int> onItemSelected;

  ShoppingCartHeader({
    Key? key,
    required this.selectedId,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<ShoppingCartHeader> createState() => ShoppingCartHeaderState();
}

class ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  List<String> selectedPic = [
    "assets/Demian.jpeg",
    "assets/holmes.jpeg",
    "assets/paint.jpeg",
    "assets/python.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[widget.selectedId],
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Text("데미안")),
          _buildHeaderSelectorButton(1, Text("셜록홈즈")),
          _buildHeaderSelectorButton(2, Text("페인트")),
          _buildHeaderSelectorButton(3, Text("혼공파이썬")),
        ],
      ),
    );
  }

  Widget _buildHeaderSelectorButton(int id, Widget child) {
    return GestureDetector(
      onTap: () {
        widget.onItemSelected(id);
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: id == widget.selectedId ? kAccentColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
