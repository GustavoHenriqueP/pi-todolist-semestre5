// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `University To-do List`
  String get Titulo {
    return Intl.message(
      'University To-do List',
      name: 'Titulo',
      desc: '',
      args: [],
    );
  }

  /// `Init`
  String get Inicio {
    return Intl.message(
      'Init',
      name: 'Inicio',
      desc: '',
      args: [],
    );
  }

  /// `Discipline`
  String get Disciplinas {
    return Intl.message(
      'Discipline',
      name: 'Disciplinas',
      desc: '',
      args: [],
    );
  }

  /// `Discipline`
  String get Disciplina {
    return Intl.message(
      'Discipline',
      name: 'Disciplina',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get Tarefas {
    return Intl.message(
      'Tasks',
      name: 'Tarefas',
      desc: '',
      args: [],
    );
  }

  /// `FlashCards`
  String get FlashCards {
    return Intl.message(
      'FlashCards',
      name: 'FlashCards',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Nome {
    return Intl.message(
      'Name',
      name: 'Nome',
      desc: '',
      args: [],
    );
  }

  /// `Teacher`
  String get Professor {
    return Intl.message(
      'Teacher',
      name: 'Professor',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get Salvar {
    return Intl.message(
      'SAVE',
      name: 'Salvar',
      desc: '',
      args: [],
    );
  }

  /// `Chose Color`
  String get EscolherCor {
    return Intl.message(
      'Chose Color',
      name: 'EscolherCor',
      desc: '',
      args: [],
    );
  }

  /// `Choose color for this discipline`
  String get EscolhaACorParaADisciplina {
    return Intl.message(
      'Choose color for this discipline',
      name: 'EscolhaACorParaADisciplina',
      desc: '',
      args: [],
    );
  }

  /// `SELECT`
  String get Selecionar {
    return Intl.message(
      'SELECT',
      name: 'Selecionar',
      desc: '',
      args: [],
    );
  }

  /// `Question`
  String get Pergunta {
    return Intl.message(
      'Question',
      name: 'Pergunta',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get Resposta {
    return Intl.message(
      'Answer',
      name: 'Resposta',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get Atividade {
    return Intl.message(
      'Activity',
      name: 'Atividade',
      desc: '',
      args: [],
    );
  }

  /// `Job`
  String get Trabalho {
    return Intl.message(
      'Job',
      name: 'Trabalho',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get Prova {
    return Intl.message(
      'Test',
      name: 'Prova',
      desc: '',
      args: [],
    );
  }

  /// `Meeting`
  String get Reuniao {
    return Intl.message(
      'Meeting',
      name: 'Reuniao',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get Outros {
    return Intl.message(
      'Others',
      name: 'Outros',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get Tipo {
    return Intl.message(
      'Type',
      name: 'Tipo',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get DataFinal {
    return Intl.message(
      'End date',
      name: 'DataFinal',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Descricao {
    return Intl.message(
      'Description',
      name: 'Descricao',
      desc: '',
      args: [],
    );
  }

  /// `Ended`
  String get Finalizado {
    return Intl.message(
      'Ended',
      name: 'Finalizado',
      desc: '',
      args: [],
    );
  }

  /// `No tasks created yet`
  String get NaoHaTarefas {
    return Intl.message(
      'No tasks created yet',
      name: 'NaoHaTarefas',
      desc: '',
      args: [],
    );
  }

  /// `No disciplines created yet`
  String get NaoHaDisciplinas {
    return Intl.message(
      'No disciplines created yet',
      name: 'NaoHaDisciplinas',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Adicionar {
    return Intl.message(
      'Add',
      name: 'Adicionar',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Editar {
    return Intl.message(
      'Edit',
      name: 'Editar',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get Remover {
    return Intl.message(
      'Remove',
      name: 'Remover',
      desc: '',
      args: [],
    );
  }

  /// `Tap to see the answer`
  String get VerResposta {
    return Intl.message(
      'Tap to see the answer',
      name: 'VerResposta',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Cadastre-se' key

  /// `Create your account!`
  String get CrieConta {
    return Intl.message(
      'Create your account!',
      name: 'CrieConta',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Cadastrar {
    return Intl.message(
      'Register',
      name: 'Cadastrar',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get VoltarAoLogin {
    return Intl.message(
      'Back to Login',
      name: 'VoltarAoLogin',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get Email {
    return Intl.message(
      'E-mail',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a valid email`
  String get InformeCorretamente {
    return Intl.message(
      'Please provide a valid email',
      name: 'InformeCorretamente',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Senha {
    return Intl.message(
      'Password',
      name: 'Senha',
      desc: '',
      args: [],
    );
  }

  /// `Inform your password`
  String get InformeSenha {
    return Intl.message(
      'Inform your password',
      name: 'InformeSenha',
      desc: '',
      args: [],
    );
  }

  /// `Your password must contain at least 6 characters`
  String get Caracteres {
    return Intl.message(
      'Your password must contain at least 6 characters',
      name: 'Caracteres',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Config {
    return Intl.message(
      'Settings',
      name: 'Config',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Idioma {
    return Intl.message(
      'Language',
      name: 'Idioma',
      desc: '',
      args: [],
    );
  }

  /// `Quit`
  String get Sair {
    return Intl.message(
      'Quit',
      name: 'Sair',
      desc: '',
      args: [],
    );
  }

  /// `Opened`
  String get Aberto {
    return Intl.message(
      'Opened',
      name: 'Aberto',
      desc: '',
      args: [],
    );
  }

  /// `PENDING`
  String get Pendentes {
    return Intl.message(
      'PENDING',
      name: 'Pendentes',
      desc: '',
      args: [],
    );
  }

  /// `COMPLETED`
  String get Consluidas {
    return Intl.message(
      'COMPLETED',
      name: 'Consluidas',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
