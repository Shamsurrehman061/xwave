import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../Res/AppColors/app_colors.dart';



class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.path});

  final path;
  @override
  _VideoAppState createState() => _VideoAppState();
}
class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  bool isLoading = true;

  bool showContent = true;
  double sliderVal = 0.0;


  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }




  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        setState(() {
        });
      });
    _controller.addListener(() {
      setState(() {});
      sliderVal = _controller.value.position.inSeconds.toDouble();
    });
    _controller.play();
    setState(() {
      isLoading = false;
    });
    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        showContent = false;
      });
    });

  }

  hideVideoContent()async{
    setState(() {
      showContent = false;
    });
  }

  showVideoContent(){
    setState(() {
      showContent = true;
    });
    Future.delayed(Duration(seconds: 4), (){
      setState(() {
        showContent = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: isLoading ? Center(child: CircularProgressIndicator(color: AppColors.orangeColor,),) : Column(
          children:
          [
            Expanded(
              flex: 1,
              child: showContent ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You", style: TextStyle(color: Colors.white, fontSize: 25),),
                          Text("18 November, 7:55 pm", style: TextStyle(color: Colors.white, fontSize: 15),),
                        ],
                      ),
                    ],
                  ),
                ),


                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                  [
                    IconButton(onPressed: (){}, icon: Icon(Icons.star_border_outlined, color: Colors.white,),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.redo, color: Colors.white,),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.white,),)
                  ],
                ),
              ],
            ) : Container(),),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: (){
                  if(!showContent)
                    {
                      showVideoContent();
                    }
                  else
                    {
                      hideVideoContent();
                    }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children:
                  [

                    Center(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(
                          _controller,
                        ),
                      )
                          : Container(),
                    ),
                    showContent || _controller.value.isCompleted || !_controller.value.isPlaying ? Positioned(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(_controller.value.isCompleted ? Icons.play_arrow : _controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 50.0,), onPressed: (){
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },),
                        )) : Positioned(child: Container()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
                child: showContent ?  ValueListenableBuilder<VideoPlayerValue>(
                  valueListenable: _controller,
                  builder: (_, _updatedController, child){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children:
                        [
                          Expanded(
                            flex: 1,
                              child: Text(formattedTime(timeInSecond: _controller.value.position.inSeconds), style: TextStyle(color: Colors.white),)),
                          Expanded(
                            flex: 7,
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 3.0,
                                activeTrackColor: Color(0xff009466), // WhatsApp uses green for the active track
                                inactiveTrackColor: Colors.white, // WhatsApp uses light grey for the inactive track
                                thumbColor: Colors.green, // WhatsApp uses green for the thumb
                                overlayColor: Colors.green.withOpacity(0.3), // WhatsApp uses a semi-transparent green overlay
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
                              ),
                              child: Slider(
                                min: 0.0,
                                max: _controller.value.duration.inSeconds.toDouble(),
                                value: sliderVal,
                                onChanged: (double value){
                                  setState(() {
                                    _controller.pause();
                                    sliderVal = double.parse(_controller.value.position.inSeconds.toString());
                                    _controller.seekTo(Duration(seconds: value.toInt()));
                                  });
                                },
                                onChangeEnd: (value){
                                  setState(() {
                                    _controller.play();
                                  });
                                },
                                allowedInteraction: SliderInteraction.tapAndSlide,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(formattedTime(timeInSecond: _controller.value.duration.inSeconds), style: TextStyle(color: Colors.white),)),
                        ],
                      ),
                    );
                  },
                ) : Container(),),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}