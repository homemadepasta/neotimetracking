import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';
import 'components/calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time tracking',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: const Color.fromARGB(255, 221, 239, 255),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 221, 239, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Time tracking Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        // appBar: AppBar(
        //   // TRY THIS: Try changing the color here to a specific color (to
        //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        //   // change color while the other colors stay the same.
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Text(widget.title),
        // ),
        body: Column(children: [
      const SizedBox(height: 50),
      Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 20),
              child: Text('Hi Simone',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800)))),
      const Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 20),
              child: Text(
                'Software Developer',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(145, 145, 145, 1)),
              ))),
      const SizedBox(height: 20),
      // ----- weekdays section -----
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              // child: Text('11',
              //     textAlign: TextAlign.center,
              //     overflow: TextOverflow.ellipsis,
              //     style: TextStyle(
              //       color: Colors.grey.shade600,
              //       fontSize: 19,
              //       fontWeight: FontWeight.w400,
              //     ))),
              child: HorizontalWeekCalendar(
            weekStartFrom: WeekStartFrom.Monday,
            activeBackgroundColor: Color.fromARGB(255, 221, 239, 255),
            activeTextColor: Colors.grey.shade600,
            inactiveBackgroundColor: Color.fromARGB(255, 221, 239, 255),
            inactiveTextColor: Colors.grey.shade600,
            disabledTextColor: Colors.grey,
            disabledBackgroundColor: Color.fromARGB(255, 221, 239, 255),
            activeNavigatorColor: Colors.grey.shade800,
            inactiveNavigatorColor: Colors.grey,
            monthColor: Colors.grey.shade800,
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          )),
        ],
      ),
      // ----- end of weekdays section -----
      const SizedBox(height: 80),

      Row(children: <Widget>[
        Container(
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 221, 239, 255),
                shape: BoxShape.circle,
                boxShadow: [
                  // Bottom right
                  BoxShadow(
                      color: Color.fromARGB(47, 0, 0, 0),
                      blurRadius: 24,
                      offset: Offset(5, 5),
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 1),
                  // Top left
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 14,
                      offset: Offset(-5, -5),
                      blurStyle: BlurStyle.normal,
                      spreadRadius: -1)
                ]),
            child: CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 22.0,
              animation: true,
              percent: 0.7,
              center: const Text(
                "70.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: const Color.fromARGB(255, 225, 136, 136),
            )),
      ]),
      // ----- end of weekdays section -----

      const SizedBox(height: 20),
      Row(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Projects",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ))),
          const Spacer(),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2, right: 20, bottom: 0, left: 0),
                  child: Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
                  ))),
        ],
      ),
      // ---- Projects slider ----
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 135,
              height: 180,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromARGB(255, 221, 239, 255),
                  boxShadow: [
                    // Bottom right
                    BoxShadow(
                        color: Color.fromARGB(47, 0, 0, 0),
                        blurRadius: 24,
                        offset: Offset(5, 5),
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 1),
                    // Top left
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 14,
                        offset: Offset(-5, -5),
                        blurStyle: BlurStyle.normal,
                        spreadRadius: -1)
                  ]),
              child: Column(
                children: [
                  Text(
                    'Lorem ipsum dolor',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Curabitur semper turpis eget tempor tempus. Nulla nec ligula eleifend, fermentum risus eget, luctus libero.',
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      // ---- end of Projects slider ----
    ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
