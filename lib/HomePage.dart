import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste/bloc_imc.dart';
import 'package:teste/state_imc.dart';
import 'package:teste/teste.dart';

import 'Aluno.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
      ),
      body: BlocProvider(
        create: (_) => imcBloc(),
        child: Builder(
          builder: (context) {
            return MinhaWidget();
          }
        )
      ),
    );
  }
}

class MinhaWidget extends StatelessWidget {
  const MinhaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<imcBloc>();

    bloc.calcularImc(70.0, 1.70);

    if(bloc.state.status == imcStatus.falha){
      return Center(child: Text("FALHA"),);
    }
    else if(bloc.state.status == imcStatus.sucesso){
      return Center(child: Text("O IMC É: ${bloc.state.imc}"),);
    }
    return Column(
      children: [
        Center(child: Text("CALCULANDO IMC"),),
      ],
    );
  }
}
