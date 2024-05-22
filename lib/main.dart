import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluuter_portal_celular/components/telaRelatorios.dart';
import 'components/telaDetalhesCelular.dart';
import 'components/cadastro_laboratorio.dart';
import 'components/cadastro_vitrine.dart';
import 'components/pag_inicial.dart';
import 'components/relatoriosLaboratorio.dart';
import 'components/telaCadastro.dart';
import 'components/telaLogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBdKhY53GJikHzD2dOt6-IhKbRXx5NWOCI",
        authDomain: "portalcelular-c1601.firebaseapp.com",
        databaseURL: "https://portalcelular-c1601-default-rtdb.firebaseio.com",
        projectId: "portalcelular-c1601",
        storageBucket: "portalcelular-c1601.appspot.com",
        messagingSenderId: "494622699243",
        appId: "1:494622699243:web:0e3dc4feb11291f2d358ae",
        measurementId: "G-XHQ8NMTL76",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PortalCell',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(4, 171, 238, 1)),
        useMaterial3: true,
      ),
      initialRoute: '/telaLogin',
      routes: {
        '/telaCadastro': (context) => const TelaCadastro(),
        '/telaLogin': (context) => const TelaLogin(),
        '/home': (context) => const PagInicial(),
        '/cadastro_laboratorio': (context) => const CadastroLaboratorio(),
        '/cadastro_vitrine': (context) => const CadastroVitrine(),
        '/relatorio_laboratorio': (context) => const RelatoriosLaboratorio(),
        '/telaRelatorios': (context) => const TelaRelatorios(),  // Adiciona a rota TelaRelatorios
        '/telaDetalhesCelular': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;
          return TelaDetalhesCelular(celular: args);
        },
      },
    );
  }
}
