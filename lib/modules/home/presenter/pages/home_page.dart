import 'package:flutter/material.dart';
import 'package:pets_carentes_app/core/index.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';
import 'package:pets_carentes_app/modules/timeline/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const HomePageContent();
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageContent> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: const [
          TimelinePage(),
          PetPage(),
          PetPage(),
          PetPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        pageIndex: pageIndex,
        onChangePage: (int index) => setState(() => pageIndex = index),
      ),
    );
  }
}
