import 'package:clonenetflix/UI/screens/home_screen.dart';
import 'package:clonenetflix/UI/screens/login.dart';
import 'package:clonenetflix/repositories/data_repository.dart';
import 'package:clonenetflix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    initData();
  }

  Future<void> initData() async{
    final dataProvider = Provider.of<DataRepository>(context,listen: false);
    await dataProvider.initData();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context){
      return const Login();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bbwBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/Logo2.png"),
          const SpinKitRing(
            color: bbwPrimaryColor,
            size: 50,
            duration: Duration(seconds: 3),
          )
      ],),
    );
  }
}
