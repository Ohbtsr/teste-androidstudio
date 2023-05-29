import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste/bloc_imc.dart';
import 'package:teste/state_imc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial - 2teste Lindomar"),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Peso (kg)',
            ),
            onChanged: (value) {
              final peso = double.tryParse(value);
          if (peso != null) {
    bloc.calcularImc(peso, bloc.state.altura);
    }


            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Altura (metros)',
            ),
            onChanged: (value) {
              // Atualizar a altura no BLoC quando o valor do TextField mudar
              final altura = double.tryParse(value);
              if (altura != null) {
                print(bloc.state.peso);
                bloc.calcularImc(bloc.state.peso, altura);
              }
            },
          ),
        ),

        ElevatedButton(
          onPressed: () {
            // Calcular o IMC quando o botão for pressionado
            print("Peso" + bloc.state.peso.toString());
            print("Altura" + bloc.state.altura.toString());
            bloc.calcularImc(bloc.state.peso!, bloc.state.altura!);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // Definindo a cor vermelha
          ),
          child: Text(
            'Informações deste IMC',
            style: TextStyle(color: Colors.white),
          ),
        ),


        SizedBox(height: 16.0),
        if (bloc.state.status == imcStatus.falha)
          Text(
            'IMC incorreto',
            style: TextStyle(color: Colors.red),
          ),
        if (bloc.state.status == imcStatus.sucesso)

          Text(
            'O IMC é: ${bloc.state.imc.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
