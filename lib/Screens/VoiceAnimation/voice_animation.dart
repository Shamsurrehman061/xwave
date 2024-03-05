import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../Res/AppColors/app_colors.dart';



class AnimatedSoundButton extends StatefulWidget {

  @override
  _AnimatedSoundButtonState createState() => _AnimatedSoundButtonState();
}



class _AnimatedSoundButtonState extends State<AnimatedSoundButton> {
  final _audioPlayer = AudioPlayer();


  bool isRecording = false;
  bool isPlaying = false;



  var path;


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  var recorderController = RecorderController();
  var playerController = PlayerController();


  startRecording()async
  {
    if(isRecording)
      {
        isRecording = false;
        path = await recorderController.stop();
        print(path);
      }
    else {
      isRecording = true;
      await recorderController.record();
    }
  }


  startPlayer()async{


    if(isPlaying)
      {
        isPlaying = false;
        playerController.stopPlayer();
      }
    else
      {
        initPlayer(path);
        isPlaying = true;
        playerController.startPlayer();
      }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;


    playerController = PlayerController();
  }



  initPlayer(var path1)async
  {
    final waveformData = await playerController.extractWaveformData(
      path: path,
      noOfSamples: 100,
    );
    await playerController.preparePlayer(
      path: path1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("voice recoerder and player"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children:
          [

            SizedBox(
              height: 20.0,
            ),


            Row(
              children:
              [
                SizedBox(width: 10.0,),
                //Text(chatController.convertSecondsToMinutesAndSeconds(chatController.count.value).toString()),
                AudioWaveforms(
                  enableGesture: true,
                  size: Size(
                      MediaQuery.of(context).size.width / 2,
                      50),
                  recorderController: recorderController,
                  waveStyle: const WaveStyle(
                    waveColor: Colors.white,
                    extendWaveform: true,
                    showMiddleLine: false,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xFF1E1B26),
                  ),
                  padding: const EdgeInsets.only(left: 18),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15),

                ),
              ],
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  IconButton(onPressed: ()async{
                    if(isRecording)
                      {
                        await startRecording();
                      }
                  }, icon: Icon(Icons.delete, color: AppColors.textFieldColor,),),
                  IconButton(onPressed: ()async{
                    await startRecording();
                  }, icon: Icon(isRecording ? Icons.stop : Icons.mic),),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orangeColor,
                      ),
                      child: IconButton(
                        onPressed: (){
                          //chatController.imageList.clear();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1B26),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children:
                [
                  IconButton(onPressed: ()async{
                    await startPlayer();
                  }, icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),),
                  SizedBox(
                    width: 10.0,
                  ),
                  AudioFileWaveforms(
                    size: Size(
                        MediaQuery.of(context).size.width/2,
                        50),
                    enableSeekGesture: true,
                    waveformType: WaveformType.long,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xFF1E1B26),
                    ),
                    playerWaveStyle: const PlayerWaveStyle(
                      scaleFactor: 0.8,
                      fixedWaveColor: Colors.white30,
                      liveWaveColor: Colors.white,
                      waveCap: StrokeCap.butt,
                      showSeekLine: false,
                    ),
                    playerController: playerController,

                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  //Obx(() => Text(chatController.convertSecondsToMinutesAndSeconds(chatController.count.value).toString()),),
                  SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
