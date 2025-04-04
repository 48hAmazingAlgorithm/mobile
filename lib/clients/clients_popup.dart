import 'package:flutter/material.dart';

class Individu extends StatefulWidget {
  final List<Map<String, Object>> individus;
  final String nomClient;

  Individu({super.key, required this.individus, required this.nomClient});

  @override
  _IndividuState createState() => _IndividuState();
}

class _IndividuState extends State<Individu> {
  Map<int, bool> isHovered = {}; 
  bool isButtonHovered = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30, 
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(10), 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.business, color: Colors.teal, size: 40),
                      SizedBox(width: 10),
                      Text(
                        widget.nomClient,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 500, 
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.individus.length,
                      itemBuilder: (context, index) {
                        final individu = widget.individus[index];

                        return MouseRegion(
                          onEnter: (_) => setState(() => isHovered[index] = true),
                          onExit: (_) => setState(() => isHovered[index] = false),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            transform: isHovered[index] == true
                                ? Matrix4.translationValues(0, -5, 0)
                                : Matrix4.identity(),
                            margin: EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: isHovered[index] == true
                                  ? Colors.blueGrey.withOpacity(0.1)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                if (isHovered[index] == true)
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(0.3),
                                    spreadRadius: 2,
                                  )
                              ],
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.blueGrey.withOpacity(0.3),
                              hoverColor: Colors.blueGrey.withOpacity(0.1),
                              onTap: () {
                                Navigator.pushNamed(context, '/photos');
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                child: Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.blueGrey, size: 45),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Text(
                                          "${individu['Nom']} ${individu['Prénom']}",
                                          style: TextStyle(
                                              fontSize: 22, fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Né(e) le : ${individu['date_de_naissance']}",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: MediaQuery.of(context).size.width / 2 - 250 / 2, 
            child: MouseRegion(
              onEnter: (_) => setState(() => isButtonHovered = true),
              onExit: (_) => setState(() => isButtonHovered = false),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                transform: isButtonHovered
                    ? Matrix4.translationValues(0, -5, 0)
                    : Matrix4.identity(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 60),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Retour',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
