import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:x_wave/Res/AppColors/app_colors.dart';
import 'package:x_wave/Res/ImagesUrl/images_url.dart';

class CreatingGroup extends StatefulWidget {
  const CreatingGroup({super.key});

  @override
  State<CreatingGroup> createState() => _CreatingGroupState();
}

class _CreatingGroupState extends State<CreatingGroup> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
        title: Text("Create Group", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [

            Expanded(
              flex: 1,
                child: Text("Group Description", style: TextStyle(color: AppColors.greyColor, fontSize: 17, fontWeight: FontWeight.bold),)),

            Expanded(
              flex: 2,
                child: Text("Make Group for Team Work", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),)),

            Expanded(
              flex: 2,
              child: Row(
                children:
                [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: AppColors.groupTypeColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text("Group work", style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: AppColors.groupTypeColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text("Team relationship", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
                child: Text("Group Admin", style: TextStyle(color: AppColors.greyColor, fontSize: 22, fontWeight: FontWeight.bold),)),

            Expanded(

              child: Row(
                children:
                [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(AppImages.pic3),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text("Rashid Khan", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      Text("Group Admin", style: TextStyle(color: AppColors.lastMessageColor, fontSize: 18,),),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
                child: Text("Invited Members", style: TextStyle(color: AppColors.greyColor, fontSize: 22, fontWeight: FontWeight.bold),)),


            Expanded(
              flex: 4,
              child: Column(
                children:
                [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(AppImages.pic2),
                      ),
                      Stack(
                        children:
                        [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(AppImages.pic2),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.addMemberColor,
                                ),
                                child: Icon(Icons.add, color: Colors.black, size: 18,),
                              )
                          ),
                        ],
                      ),
                      Stack(
                        children:
                        [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(AppImages.pic2),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.addMemberColor,
                                ),
                                child: Icon(Icons.add, color: Colors.black, size: 18,),
                              )
                          ),
                        ],
                      ),
                      Stack(
                        children:
                        [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(AppImages.pic2),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.addMemberColor,
                                ),
                                child: Icon(Icons.add, color: Colors.black, size: 18,),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    children:
                    [
                      Stack(
                        children:
                        [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(AppImages.pic2),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.addMemberColor,
                                ),
                                child: Icon(Icons.add, color: Colors.black, size: 18,),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.072,
                      ),
                      Stack(
                        children:
                        [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(AppImages.pic2),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.addMemberColor,
                                ),
                                child: Icon(Icons.add, color: Colors.black, size: 18,),
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.072,
                      ),
                      DottedBorder(
                        strokeWidth: 1,
                        borderType: BorderType.Circle,
                        padding: EdgeInsets.all(13.0),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: AppColors.orangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: size.height * 0.04,
                  onPressed: (){}, child: Text("Create", style: TextStyle(color: Colors.white, fontSize: 18),),),
              ),
            ),

            Expanded(child: Container(),),
          ],
        ),
      ),
    );
  }
}
