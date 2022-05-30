import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/infra/models/category_book_model.dart';
import 'package:prova/src/presentation/pages/home/home_page.dart';
import 'package:prova/src/utils/color_table.dart';

class BasePage extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  ConnectivityResult? _connectionStatus;// = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState(){
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint('Couldn\'t check connectivity status\n$e');
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(_connectionStatus == ConnectivityResult.wifi || _connectionStatus == ConnectivityResult.mobile) {
      return HomePage();
    } else {
      return Scaffold(
        body: Center(
          child: Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  if(_connectionStatus == null)
                    ...[
                      const CircularProgressIndicator(
                        backgroundColor: ColorTable.blackShadow,
                        valueColor: AlwaysStoppedAnimation(ColorTable.purple),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        'Atualizando...',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: ColorTable.blackTitle
                        ),
                      ),
                    ],

                  if(_connectionStatus == ConnectivityResult.none)
                    ...[
                      const Icon(
                        Icons.warning_amber_rounded,
                        size: 46,
                        color: Colors.deepOrangeAccent,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        'Sem conexão com a internet!',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: ColorTable.blackTitle
                        ),
                      ),
                    ]

                ],
              ),
            ),
          ),
        ),
      );
    }

  }
}
