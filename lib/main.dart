import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(primarySwatch: Colors.deepPurple, accentColor: Colors.greenAccent,),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(context) => AddPlaceScreen(),
          PlaceDetailScreen.routeName:(context) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
