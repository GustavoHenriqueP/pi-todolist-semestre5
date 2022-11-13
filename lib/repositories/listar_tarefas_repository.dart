import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aula_1/repositories/tarefa_respository.dart';

import '../models/tarefa.dart';

class ListarTarefasRepository extends ChangeNotifier{
  final _listaInicial = TarefaRepository.tabela;
  var _lista = TarefaRepository.tabela;
  //final List<Tarefa> _listaPendentes = [];
 // final List<Tarefa> _listaConcluidas = [];
  
  UnmodifiableListView<Tarefa> get lista => UnmodifiableListView(_lista);
  //UnmodifiableListView<Tarefa> get listaP => UnmodifiableListView(_listaPendentes);
  //UnmodifiableListView<Tarefa> get listaC => UnmodifiableListView(_listaConcluidas);
  
  List<Tarefa> get()
  {
    return _lista;
  }

  void refresh()
  {
    _lista = [];
    for (int i=0;i<_listaInicial.length;i++)
    { 
      if(!_lista.contains(_listaInicial.elementAt(i)))
      {
        _lista.add(_listaInicial.elementAt(i));
      }
    }
    notifyListeners();
  }

  void remove(Tarefa tarefa)
  {
    _lista.remove(tarefa);
    notifyListeners();
  }

  /*void listarConcluidas()
  {
    _lista.forEach((tarefa)
    { 
      if(!_listaConcluidas.contains(tarefa) && tarefa.status == 'Finalizado') {
        _listaConcluidas.add(tarefa);
      }
    });
  }*/
}