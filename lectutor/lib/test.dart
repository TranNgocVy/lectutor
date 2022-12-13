import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         ExtractArgumentsScreen.routeName: (context) =>
//         const ExtractArgumentsScreen(),
//       },
//       // Provide a function to handle named routes.
//       // Use this function to identify the named
//       // route being pushed, and create the correct
//       // Screen.
//       onGenerateRoute: (settings) {
//         // If you push the PassArguments route
//         if (settings.name == PassArgumentsScreen.routeName) {
//           // Cast the arguments to the correct
//           // type: ScreenArguments.
//           final args = settings.arguments as ScreenArguments;
//
//           // Then, extract the required data from
//           // the arguments and pass the data to the
//           // correct screen.
//           return MaterialPageRoute(
//             builder: (context) {
//               return PassArgumentsScreen(
//                 title: args.title,
//                 message: args.message,
//               );
//             },
//           );
//         }
//         // The code only supports
//         // PassArgumentsScreen.routeName right now.
//         // Other values need to be implemented if we
//         // add them. The assertion here will help remind
//         // us of that higher up in the call stack, since
//         // this assertion would otherwise fire somewhere
//         // in the framework.
//         assert(false, 'Need to implement ${settings.name}');
//         return null;
//       },
//       title: 'Navigation with Arguments',
//       home: const HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // A button that navigates to a named route.
//             // The named route extracts the arguments
//             // by itself.
//             ElevatedButton(
//               onPressed: () {
//                 // When the user taps the button,
//                 // navigate to a named route and
//                 // provide the arguments as an optional
//                 // parameter.
//                 Navigator.pushNamed(
//                   context,
//                   ExtractArgumentsScreen.routeName,
//                   arguments: ScreenArguments(
//                     'Extract Arguments Screen',
//                     'This message is extracted in the build method.',
//                   ),
//                 );
//               },
//               child: const Text('Navigate to screen that extracts arguments'),
//             ),
//             // A button that navigates to a named route.
//             // For this route, extract the arguments in
//             // the onGenerateRoute function and pass them
//             // to the screen.
//             ElevatedButton(
//               onPressed: () {
//                 // When the user taps the button, navigate
//                 // to a named route and provide the arguments
//                 // as an optional parameter.
//                 Navigator.pushNamed(
//                   context,
//                   PassArgumentsScreen.routeName,
//                   arguments: ScreenArguments(
//                     'Accept Arguments Screen',
//                     'This message is extracted in the onGenerateRoute '
//                         'function.',
//                   ),
//                 );
//               },
//               child: const Text('Navigate to a named that accepts arguments'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // A Widget that extracts the necessary arguments from
// // the ModalRoute.
// class ExtractArgumentsScreen extends StatelessWidget {
//   const ExtractArgumentsScreen({super.key});
//
//   static const routeName = '/extractArguments';
//
//   @override
//   Widget build(BuildContext context) {
//     // Extract the arguments from the current ModalRoute
//     // settings and cast them as ScreenArguments.
//     final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(args.title),
//       ),
//       body: Center(
//         child: Text(args.message),
//       ),
//     );
//   }
// }
//
// // A Widget that accepts the necessary arguments via the
// // constructor.
// class PassArgumentsScreen extends StatelessWidget {
//   static const routeName = '/passArguments';
//
//   final String title;
//   final String message;
//
//   // This Widget accepts the arguments as constructor
//   // parameters. It does not extract the arguments from
//   // the ModalRoute.
//   //
//   // The arguments are extracted by the onGenerateRoute
//   // function provided to the MaterialApp widget.
//   const PassArgumentsScreen({
//     super.key,
//     required this.title,
//     required this.message,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(message),
//       ),
//     );
//   }
// }
//
// // You can pass any object to the arguments parameter.
// // In this example, create a class that contains both
// // a customizable title and message.
// class ScreenArguments {
//   final String title;
//   final String message;
//
//   ScreenArguments(this.title, this.message);
// }
int diffDay(DateTime start, DateTime end){
  DateTime tempStart = DateTime(start.year, start.month, start.day);
  DateTime tempEnd = DateTime(end.year, end.month, end.day);

  return tempEnd.difference(tempStart).inDays;
}
void main(){
  DateTime time = DateTime(1970, 1,1,0,0,0,0,0);
  Duration a = Duration(milliseconds: 1628163000000);
  // DateTime a1 = DateTime.parse("2021-08-02T14:11:23.701Z");
  // DateTime a2 = time.add(a);
  // DateTime a2 = DateTime.now();
  // for (int i =0 ; i < 10; i++){
  //   print("----------------------------------------");
  //   a2 = a2.add(Duration(days: 1));
  //   print(a2);
  //   print(a2.year);
  //   print(a2.month);
  //   print(a2.day);
  //   print(a2.hour);
  //   print(a2.minute);
  //   print(a2.second);
  //   print(a2.weekday);
  // }
  DateTime time1 = DateTime(1970, 1,1,4,0,0,0,0);
  DateTime time2 = DateTime(1970, 1,1,12,0,0,0,0);
  DateTime time3 = DateTime(1970, 1,2,0,0,0,0,0);
  DateTime time4 = DateTime(1970, 1,2,4,0,0,0,0);

  print(diffDay(time1, time2));
  print(diffDay(time1, time3));
  print(diffDay(time1, time4));


}