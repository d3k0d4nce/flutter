import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  void _clearText() {
    _controller.clear();
  }

  void _navigateToSecondScreen(BuildContext context) {
    String userName = _controller.text;
    Navigator.pushNamed(context, '/second', arguments: userName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Представьтесь, пожалуйста', style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Введите имя",
                  filled: true,
                  labelText: 'Ваше имя',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: _clearText,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  LengthLimitingTextInputFormatter(10)
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _navigateToSecondScreen(context);
                } else {
                  // Показать сообщение об ошибке или запросить выбор даты
                }
              },
              child: Text('Войти'),
            )
          ],
        ),
      ),
    );
  }
}
