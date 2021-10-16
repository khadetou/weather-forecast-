import "package:flutter/material.dart";

class TextFieldView extends StatelessWidget {
  const TextFieldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Entrez le nom d'une region",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }
}
