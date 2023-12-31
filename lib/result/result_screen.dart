import 'package:bmi_calculator/model/bmi_calculator_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final BmiCalculator bmiCalculator;

  const ResultScreen({
    super.key,
    required this.bmiCalculator,
  });

  //메서드 result bmi 결과값
  String _calBmi(double bmi) {
    String result = '저체중';
    if (bmi > 35) {
      result = '고도비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  // bmi 결과에 따라서 아이콘 변경 되는 로직
  Widget _buildIcon(double bmi) {
    Icon icon = const Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.red,
      size: 100,
    );
    if (bmi >= 23) {
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.yellow,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      icon = const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    }
    return icon;
  }

  //const 위젯 안에 변수가 있으면 const 를 붙이면 안되고 변수가없으면 붙인다.
  @override
  Widget build(BuildContext context) {
    final double bmi = bmiCalculator.weight /
        ((bmiCalculator.height / 100) * (bmiCalculator.height / 100));
    String result = '정상';

    return Scaffold(
      appBar: AppBar(
        title: Text('결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calBmi(bmi),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildIcon(bmi),

          ],
        ),
      ),
    );
  }
}
