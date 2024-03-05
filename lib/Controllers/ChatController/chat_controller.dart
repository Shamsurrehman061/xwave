import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../../Models/ImageModel/image_model.dart';
import '../../Utils/PickMedia/pick_media.dart';


class ChatController extends GetxController{

  PickMedia pickMedia = PickMedia();
  final imageList = <ImageModel>[].obs;
  final videoList = [].obs;
  final isReply = false.obs;
  var recorderController = RecorderController();
  var playerController = PlayerController();
  final duration = Duration(seconds: 0).obs;
  VideoPlayerController? controller;
  bool isRecordingCompleted = false;
  final voiceRecording = false.obs;
  Directory? appDirectory;
  bool isLoading = true;
  final isRecording = false.obs;
  final isPlaying = false.obs;
  String? path;
  String? path1;
  var height;
  var width;

  final count = 0.obs;
  
  Timer? timer;
  
  
  getDuration(){
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      count.value +=1;
    });
  }


  String convertSecondsToMinutesAndSeconds(int seconds) {
    final minutes = seconds ~/ 60; // Integer division gives whole minutes
    final remainingSeconds = seconds % 60;

    // Pad minutes and seconds with leading zeros for aesthetics
    final formattedMinutes = minutes.toString().padLeft(2, '0');
    final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

    return '$formattedMinutes:$formattedSeconds';
  }



  initializeRecorder()
  {
    initialiseControllers();
  }

  initializePlayer()async
  {
    playerController = PlayerController();
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory!.path}/recording.acc";
    await playerController.preparePlayer(
        path: path!,
      noOfSamples: 100,
      shouldExtractWaveform: true,
      volume: 5.0,
    );


  }

  disposeRecorder()
  {
    recorderController.dispose();
    playerController.dispose();
  }


  void _getDir() async{
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory!.path}/recording.acc";
    isLoading = false;
  }

  void initialiseControllers(){
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;

    voiceRecording.value = true;
  }

  void playPause() async {
    initializePlayer();
    try{
      if(playerController.playerState != PlayerState.playing)
      {
        isPlaying.value = true;
        await playerController.startPlayer(finishMode: FinishMode.loop);
      }
      else
      {
        isPlaying.value = false;
        await playerController.pausePlayer();
      }
    }
    catch(e)
    {
      print("audio playing error **************************************: $e");
    }

  }


  void refreshWave(){
    if (isRecording.value) recorderController.refresh();
  }

   startOrStopRecording() async{
    try {
      if (isRecording.isTrue) {
        timer!.cancel();
        print(count.value);
        final path = await recorderController.stop();

        if (path != null){
          isRecordingCompleted = true;
          this.path = path;
          print("path: $path1");
          debugPrint(path);
          debugPrint("Recorded file size: ${File(path).lengthSync()}");
        }
      } else {
        await recorderController.record();
        getDuration();
      }
    } catch (e) {
      debugPrint("${e.toString()} cause error");
    } finally {
        isRecording.value = !isRecording.value;
    }
  }




  setVoiceRecorder(final val)
  {
    voiceRecording.value = val;
  }

  setReply(final value)
  {
    print("$isReply ******************Before");
    isReply.value = value;
    print("$isReply ******************After");
  }

  getImage(ImageSource source)async
  {
    imageList.clear();
    final mapData =await pickMedia.getMedia(source);

    final path = mapData['path'];
    height = mapData['height'];
    width = mapData['width'];

    final imageModel = ImageModel(
        width: width,
        height: height,
        imageUrl: path,
    );

    if(path != null)
      {
        imageList.add(imageModel);
      }
  }

  initVideoController(var data)
  {
    controller = VideoPlayerController.file(File(data))..initialize();
  }

  getVideo(ImageSource source)async
  {
    videoList.clear();
    final data =await pickMedia.getVideo(source);

    if(data != null)
    {
      controller = VideoPlayerController.file(File(data))..initialize();
      videoList.add(data);
    }
  }



}