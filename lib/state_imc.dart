enum imcStatus { sucesso, falha, inicial }

class imcState {
  final double? peso;
  final double? altura;
  final double imc;
  final imcStatus status;
  final String resultado; // Adicionado o campo 'resultado'

  imcState({
    this.altura = 0,
    this.peso = 0,
    this.status = imcStatus.inicial,
    this.imc = 0,
    this.resultado = '', // Inicializado com uma string vazia
  });

  imcState copy({
    double? peso,
    double? altura,
    double? imc,
    imcStatus? status,
    String? resultado,
  }) {
    return imcState(
      peso: peso ?? this.peso,
      altura: altura ?? this.altura,
      imc: imc ?? this.imc,
      status: status ?? this.status,
      resultado: resultado ?? this.resultado, // Corrigido para atribuir o valor do parâmetro
    );
  }
}
