import 'dart:ffi';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {

  SecondScreen({ super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();

}

class _SecondScreenState extends State<SecondScreen> {

  DateTime? _selectedDate;
  late String _userName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userName = ModalRoute.of(context)?.settings.arguments as String;
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _clearDate() {
    setState(() {
      _selectedDate = null;
    });
  }

  void _navigateToThirdScreen(BuildContext context) {
    Navigator.pushNamed(context, '/third', arguments: {'userName': _userName, 'selectedDate': _selectedDate});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_userName добро пожаловать!', style: TextStyle(fontSize: 20),),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text('Укажите вашу дату рождения:', style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(_selectedDate == null ? 'Выберите дату' : _selectedDate.toString()),
                  ),
                  if (_selectedDate != null)
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: _clearDate,
                    ),
                ],
              )
            ),
            ElevatedButton(
              onPressed: () {
                if (_selectedDate != null) {
                  print(_selectedDate);
                  print(_userName);
                  _navigateToThirdScreen(context);
                } else {
                  // Показать сообщение об ошибке или запросить выбор даты
                }
              },
              child: Text('Рассчитать возраст'),
            )

          ],
        ),
      ),
    );
  }
}