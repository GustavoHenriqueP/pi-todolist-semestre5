import 'package:flutter/material.dart';
import 'package:flutter_aula_1/models/disciplina.dart';
import 'package:flutter_aula_1/repositories/tarefa_respository.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../models/tarefa.dart';
import '../repositories/disciplina_repository.dart';

// ignore: must_be_immutable
class EditarTarefaPage extends StatefulWidget {
  Tarefa tarefa;

  EditarTarefaPage({super.key, required this.tarefa});

  @override
  State<EditarTarefaPage> createState() => _EditarTarefaPageState();
}

class _EditarTarefaPageState extends State<EditarTarefaPage> {
  final _form = GlobalKey<FormState>(); // Gera uma key (identificador) para o formulário
  final _nome = TextEditingController(); // Permite editar o texto valor e controlá-lo
  String? _tipo;
  String? _disciplina;
  String? disciplinaInicial;
  var _data = TextEditingController();
  final _descricao = TextEditingController();
  bool _visibilidade = false;
  late DisciplinaRepository drepository;
  late Tarefa tInicial;
  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  final maskDateFormatter = MaskTextInputFormatter(
    mask: 'xx/xx/xxxx',
    filter: {'x': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy
  );

  @override
  void initState() {
    super.initState();
    _nome.text = widget.tarefa.nome;
    _tipo = widget.tarefa.tipo;
    _disciplina = widget.tarefa.codDisciplina;
    _data.text = DateFormat('dd/MM/yyyy').format(DateTime(widget.tarefa.data.year, widget.tarefa.data.month, widget.tarefa.data.day));
    _descricao.text = widget.tarefa.descricao!;
    _visibilidade = widget.tarefa.visibilidade;

    tInicial = Tarefa(cod: widget.tarefa.cod,nome: widget.tarefa.nome, codDisciplina: widget.tarefa.codDisciplina, tipo: widget.tarefa.tipo, data: widget.tarefa.data, descricao: widget.tarefa.descricao!, visibilidade: widget.tarefa.visibilidade);
  }

  void dropdownCallbackTipo(String? value)
  {
    setState(() {
      _tipo = value;
    });
  }

  void dropdownCallbackDisciplina(String? value)
  {
    setState(() {
      _disciplina = value;
    });
  }

  void alterarVisibilidade () {
    setState(() {
      (_visibilidade) ? _visibilidade = false : _visibilidade = true;
    });
  }

  void salvar()
  {
    if (_form.currentState!.validate()) {
      widget.tarefa.nome = _nome.text;
      widget.tarefa.tipo = _tipo!;
      widget.tarefa.codDisciplina = _disciplina;
      widget.tarefa.data = DateTime(int.parse(_data.text.substring(6,10)), int.parse(_data.text.substring(3,5)), int.parse(_data.text.substring(0,2)));
      widget.tarefa.descricao = _descricao.text;
      widget.tarefa.visibilidade = _visibilidade;
      List<Tarefa> lista = [];
      lista.add(widget.tarefa);
      Provider.of<TarefaRepository>(context, listen: false).saveAll(lista, tInicial);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    drepository = context.read<DisciplinaRepository>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Editar),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            reverse: true,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: null,
                        controller: _nome,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                          labelText: S.of(context).Nome
                        ),
                        validator: (value) { // Valida o texto digitado pelo usuário de acordo com as condições abaixo
                          if (value == null || value.isEmpty) {
                            return 'Informe um nome!';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: DropdownButtonFormField(
                          items: [
                            DropdownMenuItem(value: 'Atividade', child: Text(S.of(context).Atividade)),
                            DropdownMenuItem(value: 'Trabalho', child: Text(S.of(context).Trabalho)),
                            DropdownMenuItem(value: 'Prova', child: Text(S.of(context).Prova)),
                            DropdownMenuItem(value: 'Reunião', child: Text(S.of(context).Reuniao)),
                            DropdownMenuItem(value: 'Outros', child: Text(S.of(context).Outros)),
                          ],
                          value: _tipo,
                          validator: (value) { // Valida o texto digitado pelo usuário de acordo com as condições abaixo
                            if (value == null) {
                              return S.of(context).InformeTipo;
                            }
                            return null;
                          },
                          onChanged: dropdownCallbackTipo,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            labelText: S.of(context).Tipo
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          items: drepository.lista.map((op) => DropdownMenuItem(
                            value: op.cod,
                            child: Text(op.nome, overflow: TextOverflow.ellipsis),
                          )).toList(),
                          value: _disciplina,
                          validator: (value) {
                            if (value == null) {
                              return S.of(context).InformeDisciplina;
                            }
                            return null;
                          },
                          onChanged: dropdownCallbackDisciplina,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            labelText: S.of(context).Disciplina
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [maskDateFormatter],
                                maxLines: null,
                                controller: _data,
                                style: TextStyle(fontSize: 18),
                                validator: (value) { // Valida o texto digitado pelo usuário de acordo com as condições abaixo
                                  if (value == null || value.isEmpty || value.length < 10) {
                                    return S.of(context).DataValida;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16))
                                  ),
                                  labelText: S.of(context).DataFinal,
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(DateTime.now().year),
                                        lastDate: DateTime(2030),
                                      );
                                      if (newDate != null) {
                                        setState(() {
                                          _data.text = DateFormat('dd/MM/yyyy').format(DateTime(newDate.year, newDate.month, newDate.day));
                                        });
                                      }
                                    }, 
                                    icon: Icon(Icons.calendar_month)
                                  )
                                ),
                              ),
                            ),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text(
                                  (_visibilidade) ? 'PÚBLICO' : 'PRIVADO',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: (_visibilidade) ? Colors.green : Colors.red),
                                ),
                                Switch(value: _visibilidade,onChanged: (value) => alterarVisibilidade())
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: TextFormField(
                          maxLines: 5,
                          controller: _descricao,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            labelText: S.of(context).Descricao,
                            alignLabelWithHint: true
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple[800])),
                    onPressed: () {
                      salvar();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            S.of(context).Salvar,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          )
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //),
    );
  }
}