import 'package:flutter/material.dart';

class BurgerDetailsPage extends StatefulWidget {
  @override
  _BurgerDetailsPageState createState() => _BurgerDetailsPageState();
}

class _BurgerDetailsPageState extends State<BurgerDetailsPage> {
  bool isFavorite = false;
  bool isChecked = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'images/ImageBurger.png', width: double.infinity,
                    height: 200, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ), // Replace with your image
                  Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chicken Burger',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    Row(
                      children: [
                        Text(
                          '£10.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(width: 20),
                        Text(
                          '£6.00',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),

                        // Spacer(),

                        Text('4.9 (1,205)'),
                        SizedBox(width: 90),
                        TextButton(
                            onPressed: () {}, child: Text('See all reviews')),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'A delicious chicken burger served on a toasted bun with fresh lettuce, tomato slices, and mayonnaise. Juicy grilled chicken patty seasoned to perfection.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    TextButton(onPressed: () {}, child: Text('See more')),
                    SizedBox(height: 16),
                    Text('Additional Options:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    CheckboxListTile(
                      title: Text('Add Cheese'),
                      subtitle: Text('+ £0.50'),
                      value: false,
                      onChanged: (newValue) {},
                    ),
                    CheckboxListTile(
                      title: Row(
                        children: [
                          Text('Add Cheese'),
                          if (isChecked)
                            Icon(Icons.check,
                                color: Colors.black), // Add this checkmark icon
                        ],
                      ),
                      subtitle: Text('+ £0.50'),
                      value: isChecked, // Replace with your variable
                      onChanged: (newValue) {
                        setState(() {
                          isChecked != isChecked;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You can\'t reduce below 1.'),
                      action: SnackBarAction(
                        label: 'Go to Home',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            Text('$quantity', style: TextStyle(fontSize: 18)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.shopping_basket),
                  SizedBox(width: 8),
                  Text('Add to Basket'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
