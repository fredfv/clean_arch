// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
//
// import '../controllers/home_store.dart';
//
// class PicturePage extends StatefulWidget {
//   late final DateTime? dateSelected;
//
//   PicturePage({
//     Key? key,
//     this.dateSelected,
//   }) : super(key: key);
//
//   PicturePage.fromArgs(dynamic arguments) {
//     dateSelected = arguments['dateSelected'];
//   }
//
//   static void navigate(DateTime? dateSelected) {
//     Modular.to.pushNamed(
//       '/picture',
//       arguments: {'dateSelected': dateSelected},
//     );
//   }
//
//   @override
//   _PicturePageState createState() => _PicturePageState();
// }
//
// class _PicturePageState extends State<PicturePage> {
//   @override
//   void initState() {
//     super.initState();
//     //store.getSpaceMediaFromDate(widget.dateSelected);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: ScopedBuilder(
//         store: store,
//         onLoading: (context) => Center(child: CircularProgressIndicator()),
//         onError: (context, error) => Center(
//           child: Text(
//             'An error occurred, try again later.',
//             style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),
//           ),
//         ),
//         onState: (context, SpaceMediaEntity spaceMedia) {
//           return PageSliderUp(
//             onSlideUp: () => showDescriptionBottomSheet(
//               context: context,
//               title: spaceMedia.title,
//               description: spaceMedia.description,
//             ),
//             child: spaceMedia.mediaType == 'video' && spaceMedia.mediaUrl != null
//                 ? CustomVideoPlayer(spaceMedia)
//                 : spaceMedia.mediaType == 'image' && spaceMedia.mediaUrl != null
//                     ? ImageNetworkWithLoader(spaceMedia.mediaUrl!)
//                     : Container(),
//           );
//         },
//       ),
//     );
//   }
// }
