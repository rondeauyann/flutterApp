import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  TextEditingController tecIdentifier = new TextEditingController();
  TextEditingController tecPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("Identification")),
        body: _buildColumnFields()
    );
  }
  Widget _buildColumnFields() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
            children: [
            Spacer(),
        TextField(
          controller: tecIdentifier,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              label: Text('Nom Utilisateur ou e-mail'),
              prefixIcon: Icon(Icons.person)
          ),
        ),
        TextField(
          controller: tecPassword,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: InputDecoration(
              label: Text('Mot de passe'),
              prefixIcon: Icon(Icons.password)
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _onLogin,
            child: Text('S\'IDENTIFIER'),
          ),
        ),
        Padding(
        padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
    onPressed: _onRegisterPage,
    child: Text('PAS DE COMPTE? S\'ENREGISTRER'),
    ),
        ),
              Spacer()
            ],
        ),
    );
  }
  void _onLogin() async {
    print('identifiant : $tecIdentifier');
    print('pwd : $tecPassword');
    String identifiant = tecIdentifier.text;
    String password = tecPassword.text;

    try{
      var responseRegister = await http.post(
          Uri.parse("http://127.0.0.1:8000/auth"),
          body: {
            "identifier": identifiant,
            "password": password,
          }
      );
      if(responseRegister.statusCode == 200){
        SnackBar snackBarSuccess  = new SnackBar(content: Text("Connexion réussie"));
        ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
        tecIdentifier.clear();
        tecPassword.clear();

        _onLoginSuccess(jsonDecode(responseRegister.body)["jwts"]);
      } else  if (responseRegister.statusCode >0){
        SnackBar snackBarFailure  = new SnackBar(content: Text("erreur : " + responseRegister.statusCode.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
      }
    } on SocketException catch (socketException){
      SnackBar snackBarFailure = new SnackBar(content: Text("Nous avons des difficultés à joindre le serveur"));
      ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
    }
  }
  void _onRegisterPage() {
    Navigator.pushNamed(context,'/register');
  }
  void _onLoginSuccess(String jwt) {
    var storage = new FlutterSecureStorage();
    storage.write(key: "jwt", value: "");
    Navigator.pushNamed(context,'/home');
  }
}


