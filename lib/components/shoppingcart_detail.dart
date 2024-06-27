import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingCartDetail extends StatelessWidget {
  final int selectedId;
  ShoppingCartDetail({
    Key? key,
    required this.selectedId,
  }) : super(key: key);

  List<String> bookName = [
    "데미안",
    "셜록홈즈 전집 1권",
    "페인트",
    "혼자 공부하는 파이썬",
  ];

  List<String> price = [
    "10,800원",
    "8,700원",
    "11,700원",
    "19,800원",
  ];

  List<String> show = [
    "20세기 센세이션을 일으킨 성장 소설의 고전\n시인이 아니면 아무것도 되고 싶지 않다\n- 헤르만 헤세",
    "로버트 다우니 주니어,주드 로 등 호화캐스팅의 할리우드 대작 셜록 홈즈의 원작!",
    "부모 면접을 시작하겠습니다.\n부모를 선택하는 시대,\n내 손으로 색칠하는 미래",
    "파이썬 입문 베스트셀러 『혼자 공부하는 파이썬』 개정판\n혼공을 독려하는 ‘혼공 계획표’와 생각의 수준을 높이는 ‘누적 예제’와 ‘도전 문제’ 수록!"
  ];

  List<int> star = [
    4,
    3,
    4,
    5,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailRatingAndReviewCount(),
            _buildDetailColorOptions(),
            _buildDetailButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bookName[selectedId],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            price[selectedId],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(Icons.star,
              color: star[selectedId] >= 1 ? Colors.yellow : Colors.grey),
          Icon(Icons.star,
              color: star[selectedId] >= 2 ? Colors.yellow : Colors.grey),
          Icon(Icons.star,
              color: star[selectedId] >= 3 ? Colors.yellow : Colors.grey),
          Icon(Icons.star,
              color: star[selectedId] >= 4 ? Colors.yellow : Colors.grey),
          Icon(Icons.star,
              color: star[selectedId] >= 5 ? Colors.yellow : Colors.grey),
          Spacer(),
          Text("리뷰 "),
          Text("(26)", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildDetailColorOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("소개"),
          SizedBox(height: 10),
          Text(show[selectedId]),
        ],
      ),
    );
  }

  Widget _buildDetailIcon(Color mColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: ClipOval(
              child: Container(
                color: mColor,
                width: 40,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("장바구니에 담으시겠습니까?"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          "장바구니에 담기",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
