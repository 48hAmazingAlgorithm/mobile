import 'package:flutter/material.dart';
import 'package:mobile/clients/clients_popup.dart';

class Clients extends StatefulWidget {
  Clients({super.key});

  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
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
          "Nom": "Leclerc",
          "Prénom": "Jean",
          "date_de_naissance": "1992-03-15",
          "date_fin_validité_CNI": "2035-03-15",
          "Numéro_CNI": "112233445"
        },
        {
          "id_individu": 103,
          "Nom": "Muller",
          "Prénom": "Claire",
          "date_de_naissance": "1988-11-21",
          "date_fin_validité_CNI": "2030-11-21",
          "Numéro_CNI": "998877665"
        },
      ]
    },
    {
      "numero_client": 2,
      "nom_client": "Martin SARL",
      "individus": [
        {
          "id_individu": 201,
          "Nom": "Bernard",
          "Prénom": "Lucas",
          "date_de_naissance": "1978-11-03",
          "date_fin_validité_CNI": "2028-11-03",
          "Numéro_CNI": "456123789"
        },
        {
          "id_individu": 202,
          "Nom": "Dupuis",
          "Prénom": "Isabelle",
          "date_de_naissance": "1995-02-18",
          "date_fin_validité_CNI": "2035-02-18",
          "Numéro_CNI": "741258963"
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Clients",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: clients.length,
          itemBuilder: (context, index) {
            final client = clients[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(Icons.business, color: Colors.teal, size: 40),
                title: Text(
                  client['nom_client'] as String,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => Individu(
                      nomClient: client['nom_client'] as String,
                      individus: client['individus']
                          as List<Map<String, Object>>,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
