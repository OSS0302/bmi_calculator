import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final double height;
  final double weight;

  const ResultScreen({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  //const 위젯 안에 변수가 있으면 const 를 붙이면 안되고 변수가없으면 붙인다.
  @override
  Widget build(BuildContext context) {
    String result = '정상';
    return Scaffold(
      appBar: AppBar(
        title: Text('결과'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
           const Icon(
              Icons.sentiment_satisfied,
              color: Colors.green,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
