import 'package:flutter/material.dart';
import './page_indicator.dart';
import './page_body.dart';

class StepForm extends StatefulWidget {
  @override
  State<StepForm> createState() => _StepFormState();
}

class _StepFormState extends State<StepForm> {
  final _stepFormController = PageController();

  int _page = 0;

  final List _pagesList = [
    pageBody('https://miro.medium.com/max/1400/1*TFZQzyVAHLVXI_wNreokGA.png', 'Flutter', 'Flutter é um kit de desenvolvimento de interface de usuário, de código aberto, criado pela empresa Google em 2015, baseado na linguagem de programação Dart, que possibilita a criação de aplicativos compilados nativamente, para os sistemas operacionais Android, iOS, Windows, Mac, Linux e, Fuchsia e Web.'),
    pageBody('https://dart-code.gallerycdn.vsassets.io/extensions/dart-code/dart-code/3.59.20230125/1674642118476/Microsoft.VisualStudio.Services.Icons.Default', 'Dart', 'Dart é uma linguagem de script voltada à web desenvolvida pela Google. Ela foi lançada na GOTO Conference 2011, que aconteceu de 10 a 11 de outubro de 2011 em Aarhus, na Dinamarca. O objetivo da linguagem Dart foi inicialmente a de substituir a JavaScript como a linguagem principal embutida nos navegadores.'),
    pageBody('https://i.dlpng.com/static/png/6771635_preview.png', 'Multi Plataforma', 'Mantenha uma base de código e implemente em várias plataformas, acelerando e simplificando os fluxos de trabalho.')
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });
      _stepFormController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });
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
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _pagesList[index];
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => _changeStep(false), child: Text('Anterior')),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          TextButton(onPressed: () => _changeStep(true), child: Text('Próximo'))
        ],
      ),
    );
  }
}
