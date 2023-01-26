import 'package:flutter/material.dart';

class StepForm extends StatelessWidget {
  final _stepFormController = PageController();
  int _page = 0;

  final List _pagesList = [
    const Text('page 1'),
    const Text('page 2'),
    const Text('page 3'),
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      _page++;
      _stepFormController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      _page--;
      _stepFormController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Step App Page")),
      ),
      body: PageView.builder(
          controller: _stepFormController,
          itemBuilder: (BuildContext context, int index) {
            return _pagesList[index];
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => _changeStep(false), child: Text('Anterior')),
          TextButton(onPressed: () => _changeStep(true), child: Text('Próximo'))
        ],
      ),
    );
  }
}
