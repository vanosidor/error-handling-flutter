import 'package:error_handling_tutorial/state_managment/post_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the plyon mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => PostChangeNotifier(),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postChangeNotifier = context.watch<PostChangeNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Error handling'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<PostChangeNotifier>(
                builder: (_, postChangeNotifier, __) {
                  // TODO make
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return CircularProgressIndicator();
                  // } else if (snapshot.hasError) {
                  //   return StyledText(snapshot.error.toString());
                  // } else if (snapshot.hasData) {
                  //   return StyledText(snapshot.data.toString());
                  // } else
                  //   return StyledText('Click here 👇');
                },
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                onPressed: () => context.read<PostChangeNotifier>().getPost(),
                child: Text('GetData'),
              )
            ]),
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40),
    );
  }
}
