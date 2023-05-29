import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste/state_imc.dart';

class imcBloc extends Cubit<imcState> {
  imcBloc() : super(imcState());

  void calcularImc(double? peso, double? altura) {
    if(peso == null || altura == null){
      if(peso != null){
        emit(state.copy(peso: peso,status: imcStatus.falha));
      }
      if(altura != null){
        emit(state.copy(altura:  altura,status: imcStatus.falha));
      }
    }
    if ((peso == null && altura == null) || peso! <= 0 || altura! <= 0) {
      emit(state.copy(status: imcStatus.falha));
    } else {
      double imcFinal = peso / (altura * altura);
      emit(state.copy(peso: peso, altura: altura, imc: imcFinal, status: imcStatus.sucesso));
    }
  }
  void legendImc(double imcFinal) {
    String resultado;

    if (imcFinal < 18.5) {
      resultado = "Abaixo do peso";
    }
    if (imcFinal >= 18.5 && imcFinal < 25) {
      resultado = "Peso normal";
    }
    if (imcFinal >= 25 && imcFinal < 30) {
      resultado = "Sobrepeso";
    }
    if (imcFinal >= 30 && imcFinal < 35) {
      resultado = "Obesidade grau 1";
    }
    if (imcFinal >= 35 && imcFinal < 40) {
      resultado = "Obesidade grau 2";
    }
    if (imcFinal >= 40){
    resultado = "Obesidade grau 3";
    }
  }
}