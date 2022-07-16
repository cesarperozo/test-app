import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/google_response.dart';
import 'package:test_app/providers/restaurants_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final queryController = TextEditingController();

String query = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF5E2D75),
            Color(0xFF750F5A),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: queryController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Buscar Restaurantes",
                  suffixIcon: Icon(
                    Icons.restaurant_menu,
                    color: Colors.white,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  query = queryController.text;
                  Navigator.of(context).pushNamed(
                    'results',
                    arguments: query,
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Buscar'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
