import 'package:bezfy/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:bezfy/features/UI/pages/news_screen/news_screen.dart';
import 'package:bezfy/features/UI/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const NewsScreen(),
    const SearchScreen(),
    const Center(child: Text("You")),
    const Center(child: Text("Hi"))
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsScreenCubit(),
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade800,
          iconSize: 22,
          selectedItemColor: Colors.grey.shade400,
          unselectedItemColor: Colors.grey.shade600,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Главная",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Поиск",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
              ),
              label: "Категории",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.radio,
              ),
              label: "Радио",
            ),
          ],
        ),
      ),
    );
  }
}
