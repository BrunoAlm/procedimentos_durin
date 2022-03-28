// import 'package:flutter/material.dart';
// import 'package:procedimentos_durin/durosystem/durosystem.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//       const Duration(seconds: 4),
//       () {
//         Navigator.pushNamed(context, '/auth');
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: DuroSystemColors.meioBranco,
//         body: Center(
//           child: Column(
//             children: [
//               const Spacer(),
//               Image.asset(
//                 'assets/splash_screen_logo.png',
//                 height: 150,
//                 color: DuroSystemColors.vermelho,
//               ),
//               const Spacer(),
//               SizedBox(
//                 height: 40,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     SizedBox(
//                       height: 20,
//                       width: 20,
//                       child: CircularProgressIndicator(
//                           color: DuroSystemColors.vermelho, strokeWidth: 3),
//                     ),
//                     SizedBox(width: 10),
//                     Text('Carregando...'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         ));
//   }
// }
