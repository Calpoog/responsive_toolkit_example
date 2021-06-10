import 'package:flutter/material.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final red = Container(
      color: Colors.red,
      height: 100,
      width: double.infinity,
      child: Center(
        // Control which widget is displayed based on contraints
        child: ResponsiveConstraintLayout(
          Breakpoints(xs: Text('Red is >=0'), custom: {
            500: Text('Red is >=500'),
          }),
        ),
      ),
    );
    final blue = Container(color: Colors.blue, height: 100);
    final green = Container(color: Colors.green, height: 100);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Responsive'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 20,
                  // Control a single value responsively
                  backgroundColor: ResponsiveLayout.value(
                    context,
                    Breakpoints(
                        xs: Colors.red,
                        sm: Colors.blue,
                        md: Colors.green,
                        lg: Colors.purple,
                        xl: Colors.orange,
                        xxl: Colors.white,
                        custom: {
                          675: Colors.lime,
                          720: Colors.brown,
                          1050: Colors.grey,
                        }),
                  ),
                ),
                // Control which Widget is displayed responsively
                child: ResponsiveLayout(
                  Breakpoints(
                      xs: Text('xs'),
                      sm: Text('sm'),
                      md: Text('md'),
                      lg: Text('lg'),
                      xl: Text('xl'),
                      xxl: Text('xxl'),
                      custom: {
                        675: Text('>=675'),
                        720: Text('>=720'),
                        1050: Text('>=1050'),
                      }),
                ),
              ),
            ),
            // Control layouts responsively (using WidgetBuilders)
            ResponsiveLayout.builder(
              Breakpoints(
                xs: (_) => Column(
                  children: [red, blue, green],
                ),
                md: (_) => Column(
                  children: [
                    Row(children: [
                      Expanded(child: red),
                      Expanded(child: blue),
                    ]),
                    green,
                  ],
                ),
                xl: (_) => Row(children: [
                  Expanded(child: red),
                  Expanded(child: blue),
                  Expanded(child: green),
                ]),
              ),
            ),
            Spacer(),
            // Control which widget is displayed based on screen height
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ResponsiveLayout(
                Breakpoints(
                  xs: Text('Height is xs'),
                  sm: Text('Height is sm'),
                  md: Text('Height is md'),
                  lg: Text('Height is lg'),
                  xl: Text('Height is xl'),
                  xxl: Text('Height is xxl'),
                  custom: {
                    675: Text('Height is >=675'),
                    720: Text('Height is >=720'),
                    1050: Text('Height is >=1050'),
                  },
                ),
                axis: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
