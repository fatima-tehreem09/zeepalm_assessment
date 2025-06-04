// import 'dart:io';
// import 'dart:math';
//
// import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../const/colors.dart';
//
// class ErrorDialog extends StatelessWidget {
//   const ErrorDialog({
//     super.key,
//     required this.error,
//   });
//
//   final dynamic error;
//
//   @override
//   Widget build(BuildContext context) {
//     String t = '';
//     String d = '';
//     if (error is SocketException) {
//       t = error.title;
//       d = error.description;
//     } else {
//       t = 'Error';
//       d = error.toString();
//     }
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () => context.pop(),
//       child: Material(
//         color: Colors.transparent,
//         child: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//             ),
//             width: min(280, MediaQuery.of(context).size.width),
//             padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 8.9, 0, 9.37),
//                   child: Text(
//                     t,
//                     style: GoogleFonts.inter(
//                       color: const Color(0xff686666),
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   d,
//                   style: Theme.of(context).primaryTextTheme.titleMedium,
//                   textAlign: TextAlign.center,
//                 ),
//                 35.heightBox,
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       alignment: Alignment.center,
//                       foregroundColor: AppColors.primaryBlue,
//                       visualDensity: VisualDensity.compact,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     onPressed: () {
//                       context.pop();
//                     },
//                     child: Text(
//                       t == 'Attention' ? 'Try Again' : 'OK',
//                       style: Theme.of(context)
//                           .primaryTextTheme
//                           .bodyMedium
//                           ?.copyWith(
//                             fontSize: 17,
//                           ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void show(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => this,
//     );
//   }
// }
