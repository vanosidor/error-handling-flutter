import 'package:error_handling_tutorial/state_managment/post_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'state_managment/mobx/post_store.dart';

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
        home: Provider(
          create: (context) => PostStore(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStore = Provider.of<PostStore>(context);
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
              Observer(
                builder: (context) {
                  if (postStore.state == PostPageState.initial)
                    return StyledText('Click here 👇');
                  else if (postStore.state == PostPageState.loading)
                    return CircularProgressIndicator();
                  else {
                    return postStore.post.fold(
                        (failure) => StyledText(failure.toString()),
                        (post) => StyledText(post.toString()));
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                onPressed: () => context.read<PostStore>().getPost(),
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
