import 'package:accountingsmart/ui/login.dart';
import 'package:accountingsmart/ui/screen/home.dart';
import 'package:accountingsmart/view_model/authprovider.dart';
import 'package:accountingsmart/view_model/custom_vm.dart';
import 'package:accountingsmart/view_model/invoice_vm.dart';
import 'package:accountingsmart/view_model/level_vm.dart';
import 'package:accountingsmart/view_model/privilge_vm.dart';
import 'package:accountingsmart/view_model/productvm.dart';
import 'package:accountingsmart/view_model/regoin_vm.dart';
import 'package:accountingsmart/view_model/switch_provider.dart';
import 'package:accountingsmart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
void main() {
  runApp(

      MultiProvider(providers: [

        ChangeNotifierProvider<user_vm_provider>(
            create: (_) => user_vm_provider()),

        ChangeNotifierProxyProvider<user_vm_provider,privilge_vm>(
          create: (_)=> privilge_vm(),
          //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
          //  client_vm(value.currentUser)
        ),
        ChangeNotifierProxyProvider<user_vm_provider,product_vm>(
          create: (_)=> product_vm(),
          //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
          //  client_vm(value.currentUser)
        ),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<switch_provider>(create: (_) => switch_provider()),
        ChangeNotifierProxyProvider<user_vm_provider,regoin_vm>(
          create: (_)=> regoin_vm(),
          //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
          //  client_vm(value.currentUser)
        ),
        ChangeNotifierProxyProvider<user_vm_provider,customer_vm>(
          create: (_)=> customer_vm(),
          //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
          //  client_vm(value.currentUser)
        ),
        ChangeNotifierProxyProvider<user_vm_provider,invoice_vm>(
          create: (_)=> invoice_vm(),
          //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
          //  client_vm(value.currentUser)
        ),
        ChangeNotifierProvider<level_vm>(create: (_) => level_vm()),
      ],child:MyApp()));
}

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SharedPreferences>(
        future: Provider.of<user_vm_provider>(context,listen: false)
            .getcurrentuser() ,
        builder:(context, snapshot) {
          print('in main builder');
          if (!snapshot.hasData) {
            //Center(child: CircularProgressIndicator(),)
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Loading....'),
                ),
              ),
            );
          }
          else {
            isUserLoggedIn =
                snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;
            if(snapshot.data!.getString('id_user1')=='0')
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text('غير مصرح لك الدخول'),
                  ),
                ),
              );
            // String idcurrentuser= snapshot.data!.getString("id_user").toString();
            else {

              return
                MaterialApp(
                  // localizationsDelegates: [
                  //   GlobalWidgetsLocalizations.delegate,
                  //   GlobalMaterialLocalizations.delegate,
                  //   // MonthYearPickerLocalizations.delegate,
                  // ],
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primaryColor: kMainColor,
                    backgroundColor: Colors.white,
                    brightness: Brightness.light,
                  ),
                  home: Directionality(
                    textDirection: TextDirection.rtl,
                    child: isUserLoggedIn ? Home() : Home(),
                  ),
                );}
          }
        });
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
