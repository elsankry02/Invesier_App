// import 'package:flutter/material.dart';

// import '../../features/model/follow_model.dart';
// import '../extension/extension.dart';

// class CustomFollowUserTile extends StatelessWidget {

//   final Color? backGroundColor;
//   final Color broderColor;
//   final String title;
//   final EdgeInsetsGeometry? padding;
//   const CustomFollowUserTile({
//     super.key,

//     required this.broderColor,
//     required this.title,
//     this.backGroundColor,
//     this.padding,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: ClipOval(
//         child: Image.asset(
//           items.image,
//           height: 30,
//           width: 30,
//           fit: BoxFit.cover,
//         ),
//       ),
//       title: Text(
//         items.title,
//         style: context.kTextTheme.titleSmall!.copyWith(
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       subtitle: Text(
//         items.subTitle,
//         style: context.kTextTheme.titleSmall!.copyWith(
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//       trailing: Container(
//         padding: padding,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(31),
//           color: backGroundColor,
//           border: Border.all(color: broderColor),
//         ),
//         child: Text(
//           title,
//           style: context.kTextTheme.labelMedium!.copyWith(
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
