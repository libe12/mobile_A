import 'package:delivery_app/features/domain/usecases/get_burgers.dart';
import 'package:delivery_app/features/presentation/bloc/burger_bloc.dart';
import 'package:delivery_app/features/presentation/bloc/burger_event.dart';
import 'package:delivery_app/features/presentation/bloc/burger_state.dart';
import 'package:delivery_app/features/presentation/pages/burger_card.dart';
import 'package:delivery_app/features/presentation/pages/burger_details_page.dart';
import 'package:delivery_app/features/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BurgerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BurgerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage:
                AssetImage('images/ImageBurger.png'), // Your profile image
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.fastfood, color: Colors.orange),
            SizedBox(width: 20),
            Text(
              'Burger',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.filter_alt_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.tune, color: Colors.grey),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2 / 2.5,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return BurgerCard(
                    imagePath:
                        //${index + 1}
                        'images/ImageBurger.png', // Update with your image paths
                    name: 'Burger Name $index',
                    oldPrice: 12.00,
                    newPrice: 10.00,
                    rating: 4.9,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class BurgerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => BurgerBloc(getAllBurgers: context.read<GetBurgers>())
//         ..add(LoadBurgers()),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundImage:
//                   AssetImage('images/ImageBurger.png'), // Your profile image
//             ),
//           ),
//           title: Row(
//             children: [
//               Icon(Icons.fastfood, color: Colors.orange),
//               SizedBox(width: 20),
//               Text(
//                 'Burger',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ],
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(Icons.filter_alt_outlined, color: Colors.black),
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: BlocBuilder<BurgerBloc, BurgerState>(
//             builder: (context, state) {
//               if (state is BurgerLoading) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (state is BurgerLoaded) {
//                 return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                     childAspectRatio: 2 / 2.5,
//                   ),
//                   itemCount: state.burgers.length,
//                   itemBuilder: (context, index) {
//                     final burger = state.burgers[index];
//                     return BurgerCard(
//                       imagePath: burger.imageUrl,
//                       name: burger.title,
//                       oldPrice: burger.price,
//                       newPrice: burger.price - burger.discount,
//                       rating: burger.rating,
//                     );
//                   },
//                 );
//               } else if (state is BurgerError) {
//                 return Center(child: Text(state.message));
//               }
//               return Center(child: Text('Unknown State'));
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
