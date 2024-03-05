import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';



/// Example for EmojiPickerFlutter
class Chk extends StatefulWidget {
  const Chk({super.key});

  @override
  ChkState createState() => ChkState();
}

class ChkState extends State<Chk> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Emoji Picker Example App'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index){
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                      [




                        //
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{
                        //
                        //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        //       chatController.setReply(true);
                        //     });
                        //
                        //     FocusScope.of(context).requestFocus(focusNode);
                        //
                        //
                        //   },
                        //   direction: DismissDirection.startToEnd,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: text1.length > 30 ? Bubble(
                        //       style: styleMe,
                        //       child:  Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text1, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Align(
                        //             alignment: Alignment.topRight,
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ) : Bubble(
                        //       style: styleMe,
                        //       child:  Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text1, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Padding(
                        //             padding: EdgeInsets.only(top:12.0),
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.startToEnd,
                        //   child: Padding(
                        //     padding: EdgeInsets.only(right: 5.0),
                        //     child: Padding(
                        //       padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //       child: text.length > 30 ? Bubble(
                        //         style: styleMeContinue,
                        //         child:  Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Align(
                        //               alignment: Alignment.topRight,
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ) : Bubble(
                        //         style: styleMeContinue,
                        //         child:  Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Padding(
                        //               padding: EdgeInsets.only(top:12.0),
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //
                        //
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.endToStart,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: text2.length > 30 ?  Bubble(
                        //       style: styleSomebody,
                        //       child:  Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Align(
                        //             alignment: Alignment.bottomRight,
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ) : Bubble(
                        //       style: styleSomebody,
                        //       child:  Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Padding(
                        //             padding: EdgeInsets.only(top:12.0),
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.endToStart,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(left: 5.0),
                        //       child: text2.length > 30 ? Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Align(
                        //               alignment: Alignment.bottomRight,
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ) : Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Padding(
                        //               padding: EdgeInsets.only(top:12.0),
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.endToStart,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(left: 5.0),
                        //       child: text3.length > 30 ? Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text3, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Align(
                        //               alignment: Alignment.bottomRight,
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ) : Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text3, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Padding(
                        //               padding: EdgeInsets.only(top:12.0),
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //
                        //
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.startToEnd,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: text1.length > 30 ? Bubble(
                        //       style: styleMe,
                        //       child:  Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text1, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Align(
                        //             alignment: Alignment.topRight,
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ) : Bubble(
                        //       style: styleMe,
                        //       child:  Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text1, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Padding(
                        //             padding: EdgeInsets.only(top:12.0),
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.startToEnd,
                        //   child: Padding(
                        //     padding: EdgeInsets.only(right: 5.0),
                        //     child: Padding(
                        //       padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //       child: text.length > 30 ? Bubble(
                        //         style: styleMeContinue,
                        //         child:  Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Align(
                        //               alignment: Alignment.topRight,
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ) : Bubble(
                        //         style: styleMeContinue,
                        //         child:  Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Padding(
                        //               padding: EdgeInsets.only(top:12.0),
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //
                        //
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.endToStart,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: text2.length > 30 ?  Bubble(
                        //       style: styleSomebody,
                        //       child:  Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Align(
                        //             alignment: Alignment.bottomRight,
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ) : Bubble(
                        //       style: styleSomebody,
                        //       child:  Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Padding(
                        //             padding: EdgeInsets.only(top:12.0),
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.endToStart,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(left: 5.0),
                        //       child: text2.length > 30 ? Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Align(
                        //               alignment: Alignment.bottomRight,
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ) : Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text2, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Padding(
                        //               padding: EdgeInsets.only(top:12.0),
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.endToStart,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(left: 5.0),
                        //       child: text3.length > 30 ? Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text3, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Align(
                        //               alignment: Alignment.bottomRight,
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("11:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ) : Bubble(
                        //         style: styleSomebodyContinue,
                        //         child:  Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children:
                        //           [
                        //             Padding(
                        //                 padding: EdgeInsets.only(right: 5),
                        //                 child: Container(
                        //                     constraints: BoxConstraints(
                        //                       maxWidth: 300.0,
                        //                     ),
                        //                     child: Text(text3, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //             Padding(
                        //               padding: EdgeInsets.only(top:12.0),
                        //               child: SizedBox(
                        //                 width: size.width * 0.19,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children:
                        //                   [
                        //                     Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                     SizedBox(
                        //                       width: 3.0,
                        //                     ),
                        //                     Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //
                        //
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   confirmDismiss: (a)async{},
                        //   direction: DismissDirection.startToEnd,
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
                        //     child: text1.length > 30 ? Bubble(
                        //       style: styleMe,
                        //       child:  Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                   constraints: BoxConstraints(
                        //                     maxWidth: 300.0,
                        //                   ),
                        //                   child: Text(text1, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //           Align(
                        //             alignment: Alignment.topRight,
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ) : Bubble(
                        //       style: styleMeContinueReply,
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         crossAxisAlignment: CrossAxisAlignment.end,
                        //         children:
                        //         [
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: Container(
                        //                 constraints: BoxConstraints(
                        //                   maxWidth: 300.0,
                        //                 ),
                        //                 child: Column(
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children: [
                        //
                        //                     Padding(
                        //                       padding: EdgeInsets.only(top: 2, left: 4),
                        //                       child: Container(
                        //                         padding: EdgeInsets.all(10.0),
                        //                         decoration: BoxDecoration(
                        //                           color: Colors.white,
                        //                           borderRadius: BorderRadius.circular(10.0),
                        //                         ),
                        //                         child: Column(
                        //                           crossAxisAlignment: CrossAxisAlignment.start,
                        //                           children:
                        //                           [
                        //                             Text("John Abraham", style: TextStyle(color: Colors.black, fontSize: 16.sp),),
                        //                             Text("hello", style: TextStyle(color: Colors.black, fontSize: 14.sp),),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 5.0,
                        //                     ),
                        //                     Padding(
                        //                       padding: EdgeInsets.only(left: 7),
                        //                         child: Text(text1, style: TextStyle(color: Colors.black, fontSize: 16.sp),)),
                        //                   ],
                        //                 ),
                        //               )),
                        //           Padding(
                        //             padding: EdgeInsets.only(top:12.0),
                        //             child: SizedBox(
                        //               width: size.width * 0.19,
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children:
                        //                 [
                        //                   Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //                   SizedBox(
                        //                     width: 3.0,
                        //                   ),
                        //                   Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //
                        //



                        // Padding(
                        //   padding: EdgeInsets.only(right: 5.0),
                        //   child: Bubble(
                        //     style: styleMeContinue,
                        //     child: text.length < 50 ? Row(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         Padding(
                        //             padding: EdgeInsets.only(right: 5),
                        //             child: ConstrainedBox(
                        //                 constraints: BoxConstraints(
                        //                   maxWidth: 300.0,
                        //                 ),
                        //                 child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16.sp),))),
                        //         Padding(
                        //           padding: EdgeInsets.only(top:8.0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //               SizedBox(
                        //                 width: 3.0,
                        //               ),
                        //               Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ) : Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       crossAxisAlignment: CrossAxisAlignment.end,
                        //       children: [
                        //         Padding(
                        //             padding: EdgeInsets.only(right: 5),
                        //             child: Container(
                        //                 constraints: BoxConstraints(
                        //                   maxWidth: 300.0,
                        //                 ),
                        //                 child: Text(text, style: TextStyle(color: Colors.black, fontSize: 20),))),
                        //         Padding(
                        //           padding: EdgeInsets.only(top:0.0),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.end,
                        //             children: [
                        //               Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 12),),
                        //               SizedBox(
                        //                 width: 3.0,
                        //               ),
                        //               Icon(Icons.done_all, color: AppColors.tickColorInDarkMode, size: 13.0,),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),



                        // SizedBox(
                        //   height: size.height * 0.006,
                        // ),
                        //
                        // Padding(
                        //   padding: EdgeInsets.only(left: 8.0),
                        //   child: Bubble(
                        //     style: styleSomebodyContinue,
                        //     child: Stack(
                        //       children:
                        //       [
                        //         Padding(
                        //             padding: EdgeInsets.only(right: 5),
                        //             child: ConstrainedBox(
                        //                 constraints: BoxConstraints(
                        //                   maxWidth: 300.0,
                        //                 ),
                        //                 child: Text("I will get back to you as soon as it", style: TextStyle(color: Colors.black, height: 1.1, fontSize: 16.sp),))),
                        //         Positioned(
                        //           bottom: 0,
                        //           right: 0,
                        //           child: Padding(
                        //             padding: EdgeInsets.only(top:20.0),
                        //             child: Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //           ),
                        //         ),
                        //
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        //
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children:
                        //   [
                        //     CircleAvatar(
                        //       radius: 15.0,
                        //       backgroundImage: AssetImage(AppImages.pic4),
                        //     ),
                        //     Bubble(
                        //       style: styleSomebody,
                        //       child: Stack(
                        //         children:
                        //         [
                        //
                        //           Padding(
                        //               padding: EdgeInsets.only(right: 5),
                        //               child: ConstrainedBox(
                        //                 constraints: BoxConstraints(
                        //                   maxWidth: 300.0,
                        //                 ),
                        //                 child: Column(
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children:
                        //                   [
                        //                     Text("Sana Khan", style: TextStyle(color: AppColors.orangeColor, fontStyle: FontStyle.italic, fontSize: 14.sp),),
                        //                     Text("I will get back to you as soon as it is morning here.", style: TextStyle(color: Colors.black, height: 1.1, fontSize: 16.sp),),
                        //                   ],
                        //                 ),
                        //               )),
                        //           Positioned(
                        //             bottom: 0,
                        //             right: 0,
                        //             child: Padding(
                        //               padding: EdgeInsets.only(top:20.0),
                        //               child: Text("12:00 am", style: TextStyle(color: AppColors.timeStampColor, fontSize: 11.sp),),
                        //             ),
                        //           ),
                        //
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        //
                        // SizedBox(
                        //   height: size.height * 0.006,
                        // ),
                        //
                        // Padding(
                        //   padding: EdgeInsets.only(left: 8.0),
                        //   child: Align(
                        //       alignment: Alignment.topLeft,
                        //       child: ClipRRect(
                        //           borderRadius: BorderRadius.circular(10.0),
                        //           child: Image.asset(AppImages.nature, width: 250, fit: BoxFit.cover,))),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.chatTimeLabelColor,
                        //     borderRadius: BorderRadius.circular(6.0),
                        //   ),
                        //   child: Text("Today", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),),
                        // ),
                        //
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),

                      ],
                    );
                  },
                )
            ),

          ],
        ),
      ),
    );
  }
}