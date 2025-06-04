// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class AppErrorWidget<T> extends ConsumerStatefulWidget {
//   const AppErrorWidget({
//     super.key,
//     required this.error,
//     required this.provider,
//     this.isTile = false,
//     this.widgetKey,
//   });
//   final bool isTile;
//   final AutoDisposeFutureProvider<T> provider;
//   final String error;
//   final Key? widgetKey;
//
//   @override
//   ConsumerState<AppErrorWidget<T>> createState() => _AppErrorWidgetState<T>();
// }
//
// class _AppErrorWidgetState<T> extends ConsumerState<AppErrorWidget<T>> {
//   @override
//   Widget build(BuildContext context) {
//     final AsyncValue<T> state = ref.watch(widget.provider);
//
//     return state.when(
//       data: (data) {
//         // When data is available, you can display the actual content
//         return const Center(
//           child: Text('Data loaded successfully!'), // Customize this as needed
//         );
//       },
//       loading: () {
//         // While loading, show a loading indicator
//         return const Center(
//           child: CircularProgressIndicator.adaptive(),
//         );
//       },
//       error: (error, stackTrace) {
//         "$error".showToast(ToastType.error);
//         // When there's an error, display the error message and the retry button
//         return widget.isTile
//             ? ListTile(
//                 leading: const Icon(Icons.warning, size: 50),
//                 title: Text(
//                   widget.error,
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 trailing: Visibility(
//                   visible: !state.isRefreshing,
//                   replacement: const CircularProgressIndicator.adaptive(),
//                   child: IconButton(
//                     onPressed: () {
//                       // Refresh the provider to retry
//                       ref.refresh(widget.provider);
//                     },
//                     icon: const Icon(
//                       Icons.refresh,
//                     ),
//                   ),
//                 ),
//               )
//             : Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.warning, size: 50),
//                     10.height,
//                     Text(
//                       widget.error,
//                       style: const TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                     10.height,
//                     Visibility(
//                       visible: !state.isRefreshing,
//                       replacement: const CircularProgressIndicator.adaptive(),
//                       child: IconButton(
//                         onPressed: () {
//                           // Refresh the provider to retry
//                           ref.refresh(widget.provider);
//                         },
//                         icon: const Icon(
//                           Icons.refresh,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//       },
//     );
//   }
// }
