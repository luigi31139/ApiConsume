import 'package:apiconsume/list.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usuario = TextEditingController();
  final contra = TextEditingController();

  final trazo = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.black),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 200),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/Login.jpg')
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: usuario,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                    border: trazo,
                    hintText: 'Nombre Usaurio',
                    prefixIcon: const Icon(Icons.person)
                  ),
                ),
              ),
          
              const SizedBox(height: 20),
          
              SizedBox(
                    width: 350,
                    child: TextField(
                        controller: contra,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                            hintText: 'Contraseña',
                            border: trazo,
                            prefixIcon: const Icon(Icons.lock)))
              ),

              const SizedBox(height: 30),

              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF58138D),
                      borderRadius: BorderRadius.circular(10)),
                  height: 42,
                  width: 107,
                  child: RawMaterialButton(
                    onPressed: () {
                      if (usuario.text == 'luis' &&
                          contra.text == 'angel') {
                          usuario.clear();
                          contra.clear();
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => const RecipeList())));
                      } else {
                        usuario.clear();
                        contra.clear();
                        QuickAlert.show(
                          context: context,
                          title: 'Error',
                          text: "Usuario o contraseña incorrecta",
                          type: QuickAlertType.error,
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}