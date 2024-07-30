import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class AmenitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amenities'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: amenities.length,
        itemBuilder: (context, index) {
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            front: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    amenities[index].icon,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 10),
                  Text(
                    amenities[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            back: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    amenities[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Amenity {
  final String title;
  final String description;
  final IconData icon;

  Amenity({required this.title, required this.description, required this.icon});
}

List<Amenity> amenities = [
  Amenity(title: 'Gym', description: 'State of the art gym', icon: Icons.fitness_center),
  Amenity(title: 'Pool', description: 'Indoor heated pool', icon: Icons.pool),
  Amenity(title: 'Parking', description: 'Spacious parking area', icon: Icons.local_parking),
  Amenity(title: 'Wifi', description: 'High-speed internet', icon: Icons.wifi),
  Amenity(title: 'Laundry', description: '24/7 laundry service', icon: Icons.local_laundry_service),
];
