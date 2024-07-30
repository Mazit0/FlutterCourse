// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/pantalla2.dart';
import 'package:flutter_application_1/views/widgets/login_widgets/checkbox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, top: 100),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Text(
                "Ayuda",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Color.fromARGB(255, 23, 57, 25),
                    decoration: TextDecoration.underline),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70, right: 70, bottom: 20),
              child: const Column(
                children: [
                  Text(
                    "Regístrate",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text("Pon el marcapáginas, solo nos llevará unos segundos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 23, 57, 25),
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
            _fieldForm("nombre"),
            _fieldForm("email"),
            _fieldForm("contraseña"),
            _minLenhgtPass(),
            _fieldForm("contraseña", "Confirma tu "),
            _minLenhgtPass(),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckboxExample(),
                    Text("Acepto los términos y condiciones de uso",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                    Text("*",style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),)
                  ]),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            _comenzarButton(_formKey, context),
            Container(
              margin: const EdgeInsets.only(left: 60, right: 60),
              child: const Row(
                children: [
                  Text(
                    "¿Ya tienes cuenta?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 23, 57, 25),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Inicia sesión", //Por qué no pilla el paddingleft??
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 23, 57, 25),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Funcion que devuelve widget etiqueta de texto con el nombre del campo
Widget _textLabel(String tipo) {
  return Row(children: [
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(tipo[0].toUpperCase() + tipo.substring(1),
          style: const TextStyle(
              color: Color.fromARGB(255, 23, 57, 25),
              fontWeight: FontWeight.bold)),
    ),
    const Text(
      "*",
      style: TextStyle(
          color: Color.fromARGB(255, 255, 0, 0), fontWeight: FontWeight.bold),
    )
  ]);
}

// Funcion que devuelve widget campo de formulario
Widget _textForm(String tipo, String pLabelText) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      shadowColor: const Color.fromARGB(255, 91, 118, 92),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 247, 255, 247),
            filled: true,
            contentPadding: const EdgeInsets.all(10.0),
            prefixIcon: _getIcon(tipo),
            labelText: "$pLabelText $tipo",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$pLabelText $tipo';
          }
          return null;
        },
      ),
    ),
  );
}

// Función para obtener prefixIcon de _textForm
Icon _getIcon(String tipo) {
  switch (tipo) {
    case 'nombre':
      return const Icon(Icons.account_circle_outlined,
          color: Color.fromARGB(255, 91, 118, 92));
    case 'email':
      return const Icon(Icons.email_outlined,
          color: Color.fromARGB(255, 91, 118, 92));
    case 'contraseña':
      return const Icon(Icons.key, color: Color.fromARGB(255, 91, 118, 92));
    default:
      return const Icon(null);
  }
}

// Funcion que devuelve Column con _textLabel y _textForm
Widget _fieldForm(String tipo, [String pLabelText = "Introduce tu "]) {
  return Column(
    children: [_textLabel(tipo), _textForm(tipo, pLabelText)],
  );
}

// Funcion que devuelve botón de confirmar
Widget _comenzarButton(GlobalKey<FormState> key, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: ElevatedButton(
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        //if (key.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          /*ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );*/
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Pantalla2()));
        //}
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 113, 144, 125),
          padding: const EdgeInsets.symmetric(
              horizontal: 60, vertical: 10)), // set the background color
      child: const Text('Comenzar',
          style:
              TextStyle(color: Color.fromARGB(255, 23, 57, 25), fontSize: 20)),
    ),
  );
}

// Funcion que devuelve longitud contraseña
Widget _minLenhgtPass() {
  return const Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: EdgeInsets.only(right: 8),
      child: Text(
        "8 caracteres mínimo",
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 10,
          color: Color.fromARGB(255, 255, 0, 0),
        ),
      ),
    ),
  );
}

enum Formulario { name, email, pass }
