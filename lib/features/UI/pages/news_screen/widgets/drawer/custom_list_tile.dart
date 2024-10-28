import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        onTap: () {},
        splashColor: Colors.grey.shade800,
        leading: Icon(
          Icons.my_library_books_outlined,
          color: Colors.grey.shade500,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
