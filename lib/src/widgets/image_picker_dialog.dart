// import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
// import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
// import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../const/assets.dart';
// import '../const/colors.dart';
//
// class ImagePickerSheet extends ConsumerStatefulWidget {
//   const ImagePickerSheet({
//     super.key,
//     required this.name,
//     required this.onCameraBTNPressed,
//     required this.onGalleryBTNPressed,
//   });
//   final Function onCameraBTNPressed, onGalleryBTNPressed;
//
//   final String name;
//
//   @override
//   ConsumerState createState() => _ImagePickerSheetState();
// }
//
// class _ImagePickerSheetState extends ConsumerState<ImagePickerSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: AppColors.primaryScaffoldBg,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Image.asset(
//               AppAssets.logo,
//               width: 50,
//             ),
//             20.heightBox,
//             OnestText(
//               fontWeight: FontWeight.w500,
//               size: 20,
//               'Please select any option',
//               textAlign: TextAlign.center,
//             ),
//             25.heightBox,
//             Transform.scale(
//               scale: 0.8,
//               child: AppButton(
//                 isLoading: false,
//                 text: 'Camera',
//                 onPressed: () {
//                   Navigator.pop(context);
//                   widget.onCameraBTNPressed();
//                 },
//               ),
//             ),
//             20.heightBox,
//             Transform.scale(
//               scale: 0.8,
//               child: AppButton(
//                 isLoading: false,
//                 text: 'Gallery',
//                 onPressed: () {
//                   Navigator.pop(context);
//                   widget.onGalleryBTNPressed();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
