import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {

  ThirdScreen({ super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();

}

class _ThirdScreenState extends State<ThirdScreen> {

  late String _userName;
  late DateTime _selectedDate;
  late int _age;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _userName = args['userName'] as String;
    _selectedDate = args['selectedDate'] as DateTime;

    // Вычисляем возраст в годах
    _age = DateTime.now().year - _selectedDate.year;

    // Проверяем, нужно ли уменьшить возраст на 1 год, если день рождения еще не наступил в текущем году
    if (DateTime.now().month < _selectedDate.month ||
        (DateTime.now().month == _selectedDate.month && DateTime.now().day < _selectedDate.day)) {
      _age--;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_userName, вам $_age лет!', style: TextStyle(fontSize: 20),),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Вернуться на главную'),
            )
          ],
        ),
      ),
    );
  }
}