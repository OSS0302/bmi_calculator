import 'package:bmi_calculator/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // dispose 종료되는 시점
  //메모리 헤제
  @override
  void dispose() {
    super.dispose();
    _heightController.dispose();
    _weightController.dispose();
  }

  // 비동기: 오래걸리는 일 처리하는 것이고 async 키워드와 함꼐 쓴다.
  // 저장하기 // 디버깅 해서 오류 찾아내기딩
  Future save() async {
    final perfs = await SharedPreferences.getInstance();
    await perfs.setDouble('height', double.parse(_heightController.text));
    await perfs.setDouble('weight', double.parse(_heightController.text));
  }

  // load
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
      // 수동 테스트 하기
      print('키: $height , 몸무게: $weight');
    }
  }
  // 특정 생명주기 의 특정 동작을 개발자가 재정의한거 오버라이딩 한다.
  @override
  void initState() {
    super.initState();

    load(); // 화면이 시작될떄 로드 한다.
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
                  // 저장하기
                  save();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultScreen(
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
