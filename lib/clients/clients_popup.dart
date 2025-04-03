import 'package:flutter/material.dart';

class Individu extends StatelessWidget {
  final List<Map<String, Object>> individus;

  Individu({super.key, required this.individus});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: double.maxFinite,
        height: 600,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: individus.length,
          itemBuilder: (context, index) {
            final individu = individus[index];
            return ListTile(
              title: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(individu['Nom'] as String),
                    SizedBox(width: 4),
                    Text(individu['Prénom'] as String),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
