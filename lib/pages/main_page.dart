import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_aula_1/repositories/disciplina_repository.dart';
import 'package:flutter_aula_1/repositories/locale_provider.dart';
import 'package:flutter_aula_1/repositories/tarefa_respository.dart';
import 'package:flutter_aula_1/widgets/icon_disciplina.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../generated/l10n.dart';
import '../models/tarefa.dart';
import '../services/auth_service.dart';
import '../widgets/tarefas_detalhes_dialog.dart';
import 'adicionar_tarefa_page.dart';


class MainPage extends StatefulWidget {
  final PageController pc;

  const MainPage({Key? key, required this.pc}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late LocaleProvider provider;
  late DisciplinaRepository drepository;
  late TarefaRepository trepository;
  late List<Tarefa> listaTarefasP;
  
  adicionarTarefa() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AdiconarTarefaPage(),
      ),
    );
  }

  List<Appointment> getTarefas() {
    List<Appointment> tarefas = <Appointment>[];

    listaTarefasP.forEach((tarefa) { 
      DateTime startTime = DateTime(tarefa.data.year, tarefa.data.month, tarefa.data.day);
      DateTime endTime = startTime.add(Duration());

      tarefas.add(
        Appointment(
          startTime: startTime,
          endTime: endTime,
          subject: tarefa.nome,
          notes: tarefa.tipo,
          location: '${tarefa.codDisciplina},${tarefa.cod}',
          color: Colors.green,
          isAllDay: true,
          )
        );
    });
    return tarefas;
}

  @override
  Widget build(BuildContext context) {
    provider = context.watch<LocaleProvider>();
    drepository = context.watch<DisciplinaRepository>();
    trepository = context.watch<TarefaRepository>();
    listaTarefasP = trepository.listaPendentes;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Titulo),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                }
              );
            }
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/clock-icon-removebg-preview.png'),
                  alignment: Alignment.center
                ),
                color: Colors.grey.withOpacity(0.2)
              ),
              child: Text(
                S.of(context).Config,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange[800]
                ),
              ),
            ),
              PopupMenuButton(
                icon: Icon(Icons.more_horiz),
                itemBuilder: (context) => 
                AppLocalizationDelegate().supportedLocales.map((op) => 
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.flag, color: Colors.green),
                      title: Text(op.toString()),
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      onTap: () {
                        Provider.of<LocaleProvider>(context, listen: false).setLocale(op);
                        AppLocalizationDelegate().load(provider.locale);
                        Navigator.of(context).pop();
                      },
                    ),  
                  )).toList(),
              ),
            OutlinedButton(
              onPressed: () => context.read<AuthService>().logout(),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.keyboard_return),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      S.of(context).Sair,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: 
      Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: SfCalendar(
              onTap: (CalendarTapDetails details) {
                if (details.appointments!.isNotEmpty) {
                  List<Appointment> info = [];
                  details.appointments!.forEach((appointment) { 
                    info.add(appointment);
                  });
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          widget.pc.animateToPage(
                            2, 
                            duration: Duration(milliseconds: 200), 
                            curve: Curves.ease,
                          );
                          showDialog(
                              context: context,
                              builder: (_) => TarefasDetalhesDialog(tarefa: trepository.listaPendentes.firstWhere((element) => element.cod == info[index].location!.substring(21,41)))
                            );
                        },
                        leading: IconDisciplina(disciplina: drepository.lista.firstWhere((element) => element.cod == info[index].location!.substring(0,20))),
                        title: Text(info[index].subject, style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(info[index].notes!)
                      );
                    },
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (_, __) => Divider(thickness: 1),
                    itemCount: details.appointments!.length),
                );
                }
              },
              todayHighlightColor: Colors.purple[800],
              view: CalendarView.month,
              dataSource: TarefasACumprir(getTarefas()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: (() => adicionarTarefa()),
            elevation: 5,
            backgroundColor: Colors.deepOrange[400],
            child: Icon(Icons.add, size: 30,)
            ),
    );
  }
}

class TarefasACumprir extends CalendarDataSource{
  TarefasACumprir(List<Appointment> source){
    appointments = source;
  }
}