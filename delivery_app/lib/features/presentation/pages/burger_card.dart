import 'package:delivery_app/features/presentation/pages/burger_details_page.dart';
import 'package:flutter/material.dart';

class BurgerCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final double oldPrice;
  final double newPrice;
  final double rating;

  const BurgerCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.oldPrice,
    required this.newPrice,
    required this.rating,
  }) : super(key: key);

  @override
  _BurgerCardState createState() => _BurgerCardState();
}

class _BurgerCardState extends State<BurgerCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BurgerDetailsPage()), // Replace with your detail page widget
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    widget.imagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('${widget.rating}',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${widget.oldPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$${widget.newPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
