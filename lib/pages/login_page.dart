import 'package:flutter/material.dart';
import 'package:flutter_aula_1/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
      super.initState();
      setFormAction(true);
  }

  setFormAction(bool acao)
  {
    setState(() {
      isLogin = acao;
      if (isLogin){
        titulo = 'Bem-vindo';//S.of(context).BemVindo;
        actionButton = 'Login';//S.of(context).Login;
        toggleButton = 'Ainda não possui conta? Cadastre-se!';//S.of(context).Cadastrese;
      }
      else {
        titulo = 'Crie uma conta';//S.of(context).CrieConta;
        actionButton = 'Cadastrar';//S.of(context).Cadastrar;
        toggleButton = 'Voltar à tela de login';//S.of(context).VoltarAoLogin;
      }
    });
  }

  login() async{
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    }
    on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async{
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    }
    on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo-pi.png'),
              Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: S.of(context).Login,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).InformeCorretamente;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: TextFormField(
                      controller: senha,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: S.of(context).Senha,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).InformeSenha;
                        } else if (value.length < 6) {
                          return S.of(context).Caracteres;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          } else {
                            registrar();
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (loading)
                        ? [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(color: Colors.white)
                              ),
                            ),
                          ]
                        : [
                          Icon(Icons.check),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              actionButton,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(toggleButton),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
