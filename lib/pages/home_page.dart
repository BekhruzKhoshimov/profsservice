import 'package:flutter/material.dart';
import 'package:profsservice/service/prefs_servis.dart';
import 'package:profsservice/service/secure_service.dart';

import '../model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    secureDataService();
    dateService();
    userService();
    removeStirng();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

  void dateService(){
    PrefsService.storeName("Bekhruz");
    PrefsService.loadName().then((value) => {
      print(value),
    });
  }

  void userService(){
    User user = User("12345", "hoshimovbehruz66@gmail.com", "11223344");
    PrefsService.storeUser(user);
    PrefsService.loadUser().then((value) => {
      print(value?.toJson()),
    });
  }
  void removeStirng(){
    PrefsService.removeUser().then((value) => {
      print(value),
    });
    PrefsService.loadName().then((value) => {
      print("String $value"),
    });
  }

  void secureDataService(){
    SecureServise.stireApiKey("api_key");
    SecureServise.loadApiKey().then((value) => {
      print(value)
    });
  }
}