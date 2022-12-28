import 'package:flutter/material.dart';
import 'package:motoshop_reborn/provider/auth_services.dart';
import 'package:motoshop_reborn/provider/dummy_provider.dart';
import 'package:motoshop_reborn/provider/feed_provider.dart';
import 'package:motoshop_reborn/provider/firebase_provider.dart';
import 'package:motoshop_reborn/widget/navigationbar/navigationbar.dart';
import 'package:motoshop_reborn/wrapper.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FoodNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MotorsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => FeedProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapperr(),
        ),
      );
}

class Dummy extends StatefulWidget {
  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: Text("hai")),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              foodNotifier.foodList[index].gambar != null
                  ? foodNotifier.foodList[index].gambar
                  : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
              width: 120,
              fit: BoxFit.fitWidth,
            ),
            title: Text(foodNotifier.foodList[index].kode_makanan),
            subtitle: Text(foodNotifier.foodList[index].nama_makanan),
            onTap: () {},
          );
        },
        itemCount: foodNotifier.foodList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}
