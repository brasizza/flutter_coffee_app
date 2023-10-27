// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FidelidadeModel {
  final int codFidel;
  final int? codCli;
  final int? codEvent;
  final int? cartaoFidel;
  final DateTime dataFidel;
  final int codFunc;
  final String tipoCartao;
  final double limiteComanda;
  final int? cartaoConfFidel;
  final int? cartaoTotemFidel;
  final int? cartaoEntradaFidel;
  final DateTime? dataConfFidel;
  final int? codPCreFidel;
  final double? valorPcreFidel;
  final int? codMesa;
  final int? lugaresMesa;
  final int? travaConsumo;
  final String? hostTrava;
  final int? codCategoria;
  final String? ultMesa;
  final String? chaveNota;
  final int? envioNota;
  final DateTime? dataEnvioNota;
  // final int? cod_sat;
  final int? codMotivo;
  final String obsMotivo;
  final String? metodoDesconto;
  final double? valorDesconto;
  final double valorCredito;
  FidelidadeModel({
    required this.codFidel,
    this.codCli,
    this.codEvent,
    this.cartaoFidel,
    required this.dataFidel,
    required this.codFunc,
    required this.tipoCartao,
    required this.limiteComanda,
    this.cartaoConfFidel,
    this.cartaoTotemFidel,
    this.cartaoEntradaFidel,
    this.dataConfFidel,
    this.codPCreFidel,
    this.valorPcreFidel,
    this.codMesa,
    this.lugaresMesa,
    this.travaConsumo,
    this.hostTrava,
    this.codCategoria,
    this.ultMesa,
    this.chaveNota,
    this.envioNota,
    this.dataEnvioNota,
    this.codMotivo,
    required this.obsMotivo,
    this.metodoDesconto,
    this.valorDesconto,
    required this.valorCredito,
  });

  FidelidadeModel copyWith({
    int? codFidel,
    int? codCli,
    int? codEvent,
    int? cartaoFidel,
    DateTime? dataFidel,
    int? codFunc,
    String? tipoCartao,
    double? limiteComanda,
    int? cartaoConfFidel,
    int? cartaoTotemFidel,
    int? cartaoEntradaFidel,
    DateTime? dataConfFidel,
    int? codPCreFidel,
    double? valorPcreFidel,
    int? codMesa,
    int? lugaresMesa,
    int? travaConsumo,
    String? hostTrava,
    int? codCategoria,
    String? ultMesa,
    String? chaveNota,
    int? envioNota,
    DateTime? dataEnvioNota,
    int? codMotivo,
    String? obsMotivo,
    String? metodoDesconto,
    double? valorDesconto,
    double? valorCredito,
  }) {
    return FidelidadeModel(
      codFidel: codFidel ?? this.codFidel,
      codCli: codCli ?? this.codCli,
      codEvent: codEvent ?? this.codEvent,
      cartaoFidel: cartaoFidel ?? this.cartaoFidel,
      dataFidel: dataFidel ?? this.dataFidel,
      codFunc: codFunc ?? this.codFunc,
      tipoCartao: tipoCartao ?? this.tipoCartao,
      limiteComanda: limiteComanda ?? this.limiteComanda,
      cartaoConfFidel: cartaoConfFidel ?? this.cartaoConfFidel,
      cartaoTotemFidel: cartaoTotemFidel ?? this.cartaoTotemFidel,
      cartaoEntradaFidel: cartaoEntradaFidel ?? this.cartaoEntradaFidel,
      dataConfFidel: dataConfFidel ?? this.dataConfFidel,
      codPCreFidel: codPCreFidel ?? this.codPCreFidel,
      valorPcreFidel: valorPcreFidel ?? this.valorPcreFidel,
      codMesa: codMesa ?? this.codMesa,
      lugaresMesa: lugaresMesa ?? this.lugaresMesa,
      travaConsumo: travaConsumo ?? this.travaConsumo,
      hostTrava: hostTrava ?? this.hostTrava,
      codCategoria: codCategoria ?? this.codCategoria,
      ultMesa: ultMesa ?? this.ultMesa,
      chaveNota: chaveNota ?? this.chaveNota,
      envioNota: envioNota ?? this.envioNota,
      dataEnvioNota: dataEnvioNota ?? this.dataEnvioNota,
      codMotivo: codMotivo ?? this.codMotivo,
      obsMotivo: obsMotivo ?? this.obsMotivo,
      metodoDesconto: metodoDesconto ?? this.metodoDesconto,
      valorDesconto: valorDesconto ?? this.valorDesconto,
      valorCredito: valorCredito ?? this.valorCredito,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codFidel': codFidel,
      'codCli': codCli,
      'codEvent': codEvent,
      'cartaoFidel': cartaoFidel,
      'dataFidel': dataFidel.millisecondsSinceEpoch,
      'codFunc': codFunc,
      'tipoCartao': tipoCartao,
      'limiteComanda': limiteComanda,
      'cartaoConfFidel': cartaoConfFidel,
      'cartaoTotemFidel': cartaoTotemFidel,
      'cartaoEntradaFidel': cartaoEntradaFidel,
      'dataConfFidel': dataConfFidel?.millisecondsSinceEpoch,
      'codPCreFidel': codPCreFidel,
      'valorPcreFidel': valorPcreFidel,
      'codMesa': codMesa,
      'lugaresMesa': lugaresMesa,
      'travaConsumo': travaConsumo,
      'hostTrava': hostTrava,
      'codCategoria': codCategoria,
      'ultMesa': ultMesa,
      'chaveNota': chaveNota,
      'envioNota': envioNota,
      'dataEnvioNota': dataEnvioNota?.millisecondsSinceEpoch,
      'codMotivo': codMotivo,
      'obsMotivo': obsMotivo,
      'metodoDesconto': metodoDesconto,
      'valorDesconto': valorDesconto,
      'valorCredito': valorCredito,
    };
  }

  factory FidelidadeModel.fromMap(Map<String, dynamic> map) {
    return FidelidadeModel(
      codFidel: int.parse(map['cod_fidel'].toString()),
      codCli: map['cod_cli'] != null ? int.parse(map['cod_cli'].toString()) : null,
      codEvent: map['cod_event'] != null ? int.parse(map['cod_event'].toString()) : null,
      cartaoFidel: map['cartaoFidel'] != null ? map['cartaoFidel'] as int : null,
      dataFidel: DateTime.fromMillisecondsSinceEpoch(map['dataFidel'] as int),
      codFunc: map['codFunc'] as int,
      tipoCartao: map['tipoCartao'] as String,
      limiteComanda: map['limiteComanda'] as double,
      cartaoConfFidel: map['cartaoConfFidel'] != null ? map['cartaoConfFidel'] as int : null,
      cartaoTotemFidel: map['cartaoTotemFidel'] != null ? map['cartaoTotemFidel'] as int : null,
      cartaoEntradaFidel: map['cartaoEntradaFidel'] != null ? map['cartaoEntradaFidel'] as int : null,
      dataConfFidel: map['dataConfFidel'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dataConfFidel'] as int) : null,
      codPCreFidel: map['codPCreFidel'] != null ? map['codPCreFidel'] as int : null,
      valorPcreFidel: map['valorPcreFidel'] != null ? map['valorPcreFidel'] as double : null,
      codMesa: map['codMesa'] != null ? map['codMesa'] as int : null,
      lugaresMesa: map['lugaresMesa'] != null ? map['lugaresMesa'] as int : null,
      travaConsumo: map['travaConsumo'] != null ? map['travaConsumo'] as int : null,
      hostTrava: map['hostTrava'] != null ? map['hostTrava'] as String : null,
      codCategoria: map['codCategoria'] != null ? map['codCategoria'] as int : null,
      ultMesa: map['ultMesa'] != null ? map['ultMesa'] as String : null,
      chaveNota: map['chaveNota'] != null ? map['chaveNota'] as String : null,
      envioNota: map['envioNota'] != null ? map['envioNota'] as int : null,
      dataEnvioNota: map['dataEnvioNota'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dataEnvioNota'] as int) : null,
      codMotivo: map['codMotivo'] != null ? map['codMotivo'] as int : null,
      obsMotivo: map['obsMotivo'] as String,
      metodoDesconto: map['metodoDesconto'] != null ? map['metodoDesconto'] as String : null,
      valorDesconto: map['valorDesconto'] != null ? map['valorDesconto'] as double : null,
      valorCredito: map['valorCredito'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory FidelidadeModel.fromJson(String source) => FidelidadeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FidelidadeModel(codFidel: $codFidel, codCli: $codCli, codEvent: $codEvent, cartaoFidel: $cartaoFidel, dataFidel: $dataFidel, codFunc: $codFunc, tipoCartao: $tipoCartao, limiteComanda: $limiteComanda, cartaoConfFidel: $cartaoConfFidel, cartaoTotemFidel: $cartaoTotemFidel, cartaoEntradaFidel: $cartaoEntradaFidel, dataConfFidel: $dataConfFidel, codPCreFidel: $codPCreFidel, valorPcreFidel: $valorPcreFidel, codMesa: $codMesa, lugaresMesa: $lugaresMesa, travaConsumo: $travaConsumo, hostTrava: $hostTrava, codCategoria: $codCategoria, ultMesa: $ultMesa, chaveNota: $chaveNota, envioNota: $envioNota, dataEnvioNota: $dataEnvioNota, codMotivo: $codMotivo, obsMotivo: $obsMotivo, metodoDesconto: $metodoDesconto, valorDesconto: $valorDesconto, valorCredito: $valorCredito)';
  }

  @override
  bool operator ==(covariant FidelidadeModel other) {
    if (identical(this, other)) return true;

    return other.codFidel == codFidel && other.codCli == codCli && other.codEvent == codEvent && other.cartaoFidel == cartaoFidel && other.dataFidel == dataFidel && other.codFunc == codFunc && other.tipoCartao == tipoCartao && other.limiteComanda == limiteComanda && other.cartaoConfFidel == cartaoConfFidel && other.cartaoTotemFidel == cartaoTotemFidel && other.cartaoEntradaFidel == cartaoEntradaFidel && other.dataConfFidel == dataConfFidel && other.codPCreFidel == codPCreFidel && other.valorPcreFidel == valorPcreFidel && other.codMesa == codMesa && other.lugaresMesa == lugaresMesa && other.travaConsumo == travaConsumo && other.hostTrava == hostTrava && other.codCategoria == codCategoria && other.ultMesa == ultMesa && other.chaveNota == chaveNota && other.envioNota == envioNota && other.dataEnvioNota == dataEnvioNota && other.codMotivo == codMotivo && other.obsMotivo == obsMotivo && other.metodoDesconto == metodoDesconto && other.valorDesconto == valorDesconto && other.valorCredito == valorCredito;
  }

  @override
  int get hashCode {
    return codFidel.hashCode ^ codCli.hashCode ^ codEvent.hashCode ^ cartaoFidel.hashCode ^ dataFidel.hashCode ^ codFunc.hashCode ^ tipoCartao.hashCode ^ limiteComanda.hashCode ^ cartaoConfFidel.hashCode ^ cartaoTotemFidel.hashCode ^ cartaoEntradaFidel.hashCode ^ dataConfFidel.hashCode ^ codPCreFidel.hashCode ^ valorPcreFidel.hashCode ^ codMesa.hashCode ^ lugaresMesa.hashCode ^ travaConsumo.hashCode ^ hostTrava.hashCode ^ codCategoria.hashCode ^ ultMesa.hashCode ^ chaveNota.hashCode ^ envioNota.hashCode ^ dataEnvioNota.hashCode ^ codMotivo.hashCode ^ obsMotivo.hashCode ^ metodoDesconto.hashCode ^ valorDesconto.hashCode ^ valorCredito.hashCode;
  }
}
