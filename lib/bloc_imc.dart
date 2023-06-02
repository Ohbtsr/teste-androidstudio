import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste/state_imc.dart';

class imcBloc extends Cubit<imcState> {
  imcBloc() : super(imcState());

  void calcularImc(){
    if (state.peso == null || state.altura == null) {
      emit(state.copy(status: imcStatus.falha));
      _legendImc(); // Chama o método legendImc para calcular a descrição do IMC
    }
     else if (state.peso! <= 0 || state.altura! <= 0) {
      emit(state.copy(status: imcStatus.falha));
      _legendImc(); // Chama o método legendImc para calcular a descrição do IMC
    }
     else {
      double imcFinal = state.peso! / (state.altura! * state.altura!);
      emit(state.copy(
        imc: imcFinal,
        status: imcStatus.sucesso,
      ));
      _legendImc(); // Chama o método legendImc para calcular a descrição do IMC
    }
    }


  void _legendImc(){
    String resultado = '';
    final imcFinal = state.imc;
    if (imcFinal < 10.0) {
    resultado = "Proximo a morte";
    }
    if (imcFinal < 18.5) {
    resultado = "Abaixo do peso";
    } else if (imcFinal >= 18.5 && imcFinal < 25) {
    resultado = "Peso normal";
    } else if (imcFinal >= 25 && imcFinal < 30) {
    resultado = "Sobrepeso";
    } else if (imcFinal >= 30 && imcFinal <
     35) {
      resultado = "Obesidade grau 1";
    } else if (imcFinal >= 35 && imcFinal < 40) {
      resultado = "Obesidade grau 2";
    } else if (imcFinal >= 40) {
      resultado = "Obesidade grau 3";
    }

    emit(state.copy(resultado: resultado));
  }

  void novoPeso(double? peso){
    if(peso == null) {
      print("---------------------------------");
      print(peso);
    }
    emit(state.copy(peso: peso));
  }
  void novoAltura(double? altura){
    emit(state.copy(altura: altura));
  }

}
