import 'package:flutter/material.dart';
import 'package:mobile/clients/clients_popup.dart';

class Clients extends StatelessWidget {
  Clients({super.key});

  final clients = [
    {
      "numero_client": 1,
      "nom_client": "Dupont SA",
      "individus": [
        {
          "id_individu": 101,
          "Nom": "Durand",
          "Prénom": "Pierre",
          "date_de_naissance": "1985-07-12",
          "date_fin_validité_CNI": "2030-07-12",
          "Numéro_CNI": "123456789"
        },
        {
          "id_individu": 102,
          "Nom": "Martin",
          "Prénom": "Sophie",
          "date_de_naissance": "1990-05-25",
          "date_fin_validité_CNI": "2032-05-25",
          "Numéro_CNI": "987654321"
        }
      ]
    },
    {
      "numero_client": 2,
      "nom_client": "Martin SARL",
      "individus": [
        {
          "id_individu": 103,
          "Nom": "Bernard",
          "Prénom": "Lucas",
          "date_de_naissance": "1978-11-03",
          "date_fin_validité_CNI": "2028-11-03",
          "Numéro_CNI": "456123789"
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cerfrance",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return ListTile(
                  title: ElevatedButton(
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (context) => Individu(
                                individus: client['individus']
                                    as List<Map<String, Object>>));
                      },
                      child: Text(client['nom_client'] as String)));
            }));
  }
}
