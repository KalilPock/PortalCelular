import 'package:firebase_auth/firebase_auth.dart';

class Autenticacao {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
    required String email,
    required String senha,
  }) {
    _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }
}
