import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// import  'package:flutter/material.dart';
// import  'package:keyboard_actions/keyboard_actions.dart';


// class Content extends StatefulWidget {
//   const Content({
//     required Key key,
//   }) : super(key: key);

//   @override
//   _ContentState createState() => _ContentState();
// }

// class _ContentState extends State<Content> {
//   final FocusNode _nodeText1 = FocusNode();
//   KeyboardActionsConfig _buildConfig(BuildContext context) {
//     return KeyboardActionsConfig(
//       keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//       keyboardBarColor: Colors.grey[200],
//       nextFocus: true,
//       actions: [
//         KeyboardActionsItem(
//           focusNode: _nodeText1,
//         ),
//       ]
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyboardActions(
//       config: _buildConfig(context),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextField(
//                 keyboardType: TextInputType.number,
//                 focusNode: _nodeText1,
//                 decoration: const InputDecoration(
//                   hintText: "Input Number",
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }