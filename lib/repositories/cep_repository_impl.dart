import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/endereco_model.dart';
import './cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  @override
  Future<EnderecoModel> getCep(String cep) async {
    try {
      final result = await Dio().get('https://viacep.com.br/ws/$cep/json');
      return EnderecoModel.fromMap(result.data);
    } on DioError catch (e) {
      log('erro ao buscar CEP');
      throw Exception('Erro ao buscar CEP');
    }
  }
}
