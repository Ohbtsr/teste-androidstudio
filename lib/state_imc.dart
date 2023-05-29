enum imcStatus{sucesso,falha,inicial}
class imcState {
final double? peso;
final double? altura;
final double imc;
final imcStatus status;

imcState({
  this.altura,
  this.peso,
  this.status = imcStatus.inicial,
  this.imc = 0,
});

imcState copy({
  double? peso,
  double? altura,
  double? imc,
  imcStatus? status,
}) {
  return imcState(
    peso: peso ?? this.peso,
    altura: altura ?? this.altura,
    imc: imc ?? this.imc,
    status: status ?? this.status,
  );
}
}
