import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'Loading.dart';

class VideoApp extends StatefulWidget {

   String vurl,reps,sets,rests,desc,titt;
  @override
  _VideoAppState createState() => _VideoAppState();

   VideoApp({this.vurl , this.reps, this.sets, this.rests,
 this.titt,     this.desc});
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.vurl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: _controller.value.initialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                      : Container(
                    color: Colors.white,
                    height: 220,
                    child: Loading(),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 10),
                      child: Container(

                        width: MediaQuery.of(context).size.width*0.94,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(widget.titt,style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(children: [
Text(" Sets : "+widget.sets),
                                ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(children: [
                                  Text(" Reps : "+widget.reps),
                                ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(children: [
                                  Text(" Rest : "+widget.rests),
                                ],),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 10),
                      child: Container(

                        width: MediaQuery.of(context).size.width*0.94,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Description",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(children: [
                                  Expanded(child: Text(widget.desc)),
                                ],),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("ggjgjgjjgjg"+widget.reps+widget.desc+widget.sets+widget.rests);

              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
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