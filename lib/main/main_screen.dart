import 'package:bmi_calculator/result/result_screen.dart';
import 'package:flutter/material.dart';

// 메인 화면 나누기
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  // dispose
  @override
  void dispose() {
    super.dispose();
    _heightController.dispose();
    _weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비만도 게산기'),
      ),
      // 텍스트 폼 필드를 사용하기위해서 는 폼으로 감싸야한다.
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 잘못된 정보를 입력 했을때 에러를 처리
            TextFormField(
              controller: _heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '키를 입력하세요',
              ),
              keyboardType: TextInputType.number,

              //잘못된 값이 들어가면 validator를 사용한다.
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return '키를 입력하세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '몸무게 를 입력하세요',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return '몸무게를 입력하세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        height: double.parse(_heightController.text),
                        weight: double.parse(_weightController.text),
                      ),
                    ),
                  );
                },
                child: const Text('결과')),
          ],
        ),
      ),
    );
  }
}
