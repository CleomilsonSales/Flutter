import 'package:flutter/material.dart';
import './questonario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual minha cor favorita favorita?',
      'respostas': [
        {'texto': 'Azul petróleo', 'pontuacao': 10},
        {'texto': 'Azul escuro', 'pontuacao': 5},
        {'texto': 'Verde escuro', 'pontuacao': 3},
        {'texto': 'Preto', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual minha comida favorita?',
      'respostas': [
        {'texto': 'Feijoada', 'pontuacao': 1},
        {'texto': 'Arroz', 'pontuacao': 5},
        {'texto': 'Macarrão', 'pontuacao': 10},
        {'texto': 'Carne', 'pontuacao': 3},
      ]
    },
    {
      'texto': 'Qual a melhor série?',
      'respostas': [
        {'texto': 'Prison Break', 'pontuacao': 1},
        {'texto': 'Como conheci sua mãe', 'pontuacao': 5},
        {'texto': 'Sobrenatural', 'pontuacao': 3},
        {'texto': 'The big bang theory', 'pontuacao': 10},
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //tirando mensagem de debug
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
