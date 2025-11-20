import 'package:flutter/material.dart';
import 'package:flutter_cinecito/presentation/View/movies/home_view.dart';
import 'package:flutter_cinecito/presentation/widgets/shared/custom_buttom_navigation.dart';

class HomeScreen extends StatelessWidget {
   static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeView()
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}