import 'package:flutter/material.dart';


class ShowNotification extends StatefulWidget {
  const ShowNotification({super.key});

  @override
  State<ShowNotification> createState() => _ShowNotificationState();
}

class _ShowNotificationState extends State<ShowNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:
          [
            ElevatedButton(onPressed: (){

            }, child: Text("show Notification")),
          ],
        ),
      ),
    );
  }
}
