import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste/state_imc.dart';

class imcBloc extends Cubit<imcState>{
  imcBloc() : super(imcState());

  void calcularImc(double peso, double altura){
    if(peso <= 0 || altura <=0){
      emit(state.copy(status: imcStatus.falha));
    }
    else{
      double imcFinal = 10.0;
      // calcula imc
      emit(state.copy(peso: peso, altura: altura, imc: imcFinal, status: imcStatus.sucesso));
    }
  }
}