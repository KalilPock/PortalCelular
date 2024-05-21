import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_portal_celular/components/TeladetalhesCelular.dart';
import 'package:fluuter_portal_celular/components/cadastro_laborat%C3%B3rio.dart';
import 'package:fluuter_portal_celular/components/cadastro_vitrine.dart';
import 'package:fluuter_portal_celular/components/pag_inicial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluuter_portal_celular/components/relatoriosLaboratorio.dart';
import 'package:fluuter_portal_celular/components/telaCadastro.dart';
import 'package:fluuter_portal_celular/components/telaLogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBdKhY53GJikHzD2dOt6-IhKbRXx5NWOCI",
              authDomain: "portalcelular-c1601.firebaseapp.com",
              databaseURL:
                  "https://portalcelular-c1601-default-rtdb.firebaseio.com",
              projectId: "portalcelular-c1601",
              storageBucket: "portalcelular-c1601.appspot.com",
              messagingSenderId: "494622699243",
              appId: "1:494622699243:web:0e3dc4feb11291f2d358ae",
              measurementId: "G-XHQ8NMTL76"));
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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(4, 171, 238, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PortalCell Home Page'),
      initialRoute: '/telaLogin',
      routes: {
        '/telaCadastro': (context) => const TelaCadastro(),
        '/telaLogin': (context) => const TelaLogin(),
        '/home': (context) => const PagInicial(),
        '/cadastro_laboratorio': (context) => const CadastroLaboratorio(),
        '/cadastro_vitrine': (context) => CadastroVitrine(),
        '/relatorio_laboratorio': (context) => RelatoriosLaboratorio(),
        '/telaDetalhesCelular': (context) => TelaDetalhesCelular(celular: ModalRoute.of(context)!.settings.arguments as DocumentSnapshot),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
