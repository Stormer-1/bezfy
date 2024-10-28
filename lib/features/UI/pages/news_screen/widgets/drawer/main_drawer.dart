import 'package:bezfy/features/UI/pages/news_screen/widgets/drawer/custom_list_tile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade800,
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                "The Moscow Post",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade600,
            indent: 10,
            endIndent: 10,
          ),
          CustomListTile(
            title: "Все новости",
            onTap: () {},
          ),
          CustomListTile(title: "Популярное", 
            onTap: () {},
          ),
          CustomListTile(title: "читают",
            onTap: () {},
          ),
          CustomListTile(title: "Спорт",
            onTap: () {},
          ),
          CustomListTile(title: "Политика",
            onTap: () {},
          ),
          CustomListTile(title: "В мире",
            onTap: () {},
          ),
          CustomListTile(title: "Культура",
            onTap: () {},
          ),
          CustomListTile(title: "Общество",
            onTap: () {},
          ),
          CustomListTile(title: "Экономика",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
