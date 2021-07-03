import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'api/api_service.dart';
import 'dart:io';
import 'api/FMapi/nbl_detailsapi.dart';
import 'dart:ui';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:open_file/open_file.dart';


String nblfile=Uri.encodeFull("https://rms2.rhapsody.ae/nbl_file/${NBLDetData.fileurl.last}");


//bool alreadycheckedin = false;
final containerscolor = Color(0xffFAECE3);
final alertboxcolor = Colors.white;
final transparentwhite = Colors.white.withOpacity(0.18);
final iconscolor = Color(0xff424B4D);
const grey = Color(0xFFB4B5B9);
const orange = Color(0xFFF58426);
const pink = Color(0xffFEE8DA);

class BackGround extends StatelessWidget {
  BackGround({this.child});
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFB4B5B9), Color(0xFFF58426)])),
      child: child,
    );
  }
}

String outletid = chekinoutlet.checkinoutletid;
//ignore: must_be_immutable
class OutletDetails extends StatelessWidget {
  String outletname = chekinoutlet.checkinoutletname;
  String outletarea = chekinoutlet.checkinarea;
  String outletcity = chekinoutlet.checkincity;
  String outletstate = chekinoutlet.checkinstate;
  String outletcountry = chekinoutlet.checkincountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.00),
      decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10.0),
            Icon(
              Icons.house_sharp,
              color: iconscolor,size: 40,
            ),
            SizedBox(width: 5.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "[$outletid]",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize:16 ),
                    ),
                    Text(
                      outletname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize:16),
                    ),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '$outletarea,$outletcity,$outletstate,$outletcountry',
                  ),
                )
                // AutoSizeText('$outletarea,$outletcity,$outletstate,$outletstate,$outletcountry',
                //   //style: TextStyle(fontSize:15),
                //   maxLines: 1,
                //   minFontSize: 12,
                //   overflow: TextOverflow.ellipsis,
                //   maxFontSize: double.infinity,
                // ),
              ],
            ),
            SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}

class Containerblock extends StatelessWidget {
  Containerblock({this.numbertext, this.chartext,
    this.color, this.icon,this.width});
  final icon;
  final color;
  final numbertext;
  final chartext;
  final width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: containerscolor,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 35,
                color: color,
              ),
              SizedBox(height: 5),
              Text(
                numbertext,style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  chartext,
                  textAlign: TextAlign.center,style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text('${DBrequestdata.empname}(${DBrequestdata.receivedempid})'
                ,style: TextStyle(fontSize: 8.0,color: orange),),
              if(currentuser.roleid == 5)
                Text('- Field Manager',style: TextStyle(fontSize: 8.0,color: orange),)
              else if(currentuser.roleid == 6)
                Text('-Merchandiser',
                  style: TextStyle(fontSize: 8.0, color: orange),)
              else if(currentuser.roleid == 3)Text('- HR',style: TextStyle(fontSize: 8.0, color: orange),)
              else Text('- Client',style: TextStyle(fontSize: 8.0, color: orange),)
            ],
          ),
        ),
      ],
    );
  }
}


bool rmsdownloadsexists = false;
bool filealreadyexists = false;
class NBlFloatingButton extends StatefulWidget {
  @override
  _NBlFloatingButtonState createState() => _NBlFloatingButtonState();
}
class _NBlFloatingButtonState extends State<NBlFloatingButton> {
  Offset _dragOffset = Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _dragOffset.dx+MediaQuery.of(context).size.width /1.2,
      top: _dragOffset.dy+40,
      child: Draggable(
        child:Container(
            child : FloatingActionButton(
              heroTag: "btn1",
              onPressed: ()async{
                print("https://rms2.rhapsody.ae/nbl_file/${NBLDetData.fileurl.last}");
                print(nblfile);
                if (Platform.isAndroid) {
                  var downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
                  rmsdownloadsexists = await Directory("${downloadsDirectory.path}/Rmsnblfiles").exists();
                  if(rmsdownloadsexists){
                    filealreadyexists = await File("${downloadsDirectory.path}/Rmsnblfiles/${NBLDetData.fileurl.last}").exists();
                    print(filealreadyexists);
                    if(filealreadyexists){
                      OpenFile.open("/${downloadsDirectory.path}/${NBLDetData.fileurl.last}");
                    }else{
                      print("here");
                      await launch("https://rms2.rhapsody.ae/nbl_file/${NBLDetData.fileurl.last}");
                    }
                  }else{
                    Directory("${downloadsDirectory.path}/Rmsnblfiles").create();
                  } 
                } else if (Platform.isIOS) {
                  _launchURL();
                }
              },
              child: Text("NBL",style: TextStyle(color: pink),),
              backgroundColor: orange,)
        ),
        childWhenDragging:Container(
          child : Text(""),
        ),
        feedback:Container(
            child : FloatingActionButton(
              heroTag: "btn2",
              onPressed: (){
              },
              child: Text("NBL",style: TextStyle(color: pink),),
              backgroundColor: orange,)
        ),
        onDragEnd: (drag) {
          RenderBox renderBox = context.findRenderObject();
          onDragEnd(renderBox.globalToLocal(drag.offset));
        },
      ),
    );
  }
  void onDragEnd(Offset offset) {
    setState(() {
      _dragOffset += offset;
    });
  }
}

void _launchURL() async =>
    await canLaunch(nblfile) ? await launch(nblfile) : throw 'Could not launch $nblfile';
bool loaded=false;

