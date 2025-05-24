import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String serviceName;

  const DetailScreen({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service Detail")),
      body: Center(child: Text("You tapped on : $serviceName")),
    );
  }
}
