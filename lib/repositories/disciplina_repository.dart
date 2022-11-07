import 'package:flutter/material.dart';
import 'package:flutter_aula_1/models/disciplina.dart';

class DisciplinaRepository {
  static List<Disciplina> tabela = [
    Disciplina(
      cod: 0,
      cor: Colors.primaries[0], 
      nome: 'Segurança da Informação', 
      professor: 'André Luiz', 
      descricao: ''
    ),
    Disciplina(
      cod: 1,
      cor: Colors.primaries[3], 
      nome: 'Programação para Dispositivos Móveis', 
      professor: 'José William', 
      descricao: ''
    ),
    Disciplina(
      cod: 2,
      cor: Colors.primaries[5], 
      nome: 'Programação Linear', 
      professor: 'Carlos Fragoso', 
      descricao: ''
    ),
    Disciplina(
      cod: 3,
      cor: Colors.primaries[1], 
      nome: 'Engenharia de Software III', 
      professor: 'Simone', 
      descricao: ''
    ),
    Disciplina(
      cod: 4,
      cor: Colors.primaries[8], 
      nome: 'Inglês V', 
      professor: 'Elenir', 
      descricao: ''
    ),
    Disciplina(
      cod: 5,
      cor: Colors.primaries[17], 
      nome: 'Laboratório de Banco de Dados', 
      professor: 'Marcio', 
      descricao: ''
    ),
    Disciplina(
      cod: 6,
      cor: Colors.primaries[12], 
      nome: 'Sistemas Operacionais II', 
      professor: 'Helder', 
      descricao: ''
    ),
  ];
}