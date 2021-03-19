import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'package:merchandising/login_page.dart';
import '../../Constants.dart';
import 'merchandiserdashboard.dart';
import 'myprofile.dart';
import 'package:merchandising/api/api_service.dart';
import'package:merchandising/model/rememberme.dart';
import 'package:merchandising/main.dart';
import 'package:merchandising/HR/HRdashboard.dart';
final menuitemscolor = Colors.black54;

class DrawerHeaderinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.person_circle_fill,
          color: Colors.white,
          size: 50,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DBrequestdata.empname,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Text(
              DBrequestdata.receivedempid,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ],
        )
      ],
    );
  }
}

class MenuElements extends StatelessWidget {
  MenuElements({@required this.title, @required this.icon});
  final title;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: menuitemscolor,
          size: 25,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(color: menuitemscolor, fontSize: 15),
        )
      ],
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: orange,
          ),
          child: DrawerHeaderinfo(),
        ),
        ListTile(
          title: MenuElements(
            title: 'My Dashboard',
            icon: Icons.dashboard_rounded,
          ),
          onTap: () {
            if(currentuser.roleid == 6){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DashBoard()));
            }else if(currentuser.roleid == 3){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HRdashboard()));
            }else if(currentuser.roleid == 5){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FieldManagerDashBoard()));
            }

          },
        ),
        ListTile(
          title: MenuElements(
            title: 'My Profile',
            icon: Icons.person,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Myprofile()));
          },
        ),
        ListTile(
          title: MenuElements(
            title: 'My Customers',
            icon: CupertinoIcons.group_solid,
          ),
          onTap: () {},
        ),
        ListTile(
          title: MenuElements(
            title: 'Notifications',
            icon: Icons.notifications,
          ),
          onTap: () {},
        ),
        ListTile(
          title: MenuElements(
            title: 'Certificates',
            icon: CupertinoIcons.doc_on_doc_fill,
          ),
          onTap: () {},
        ),
      /*  ListTile(
          title: MenuElements(
            title: 'Settings',
            icon: Icons.settings,
          ),
          onTap: () {},
        ), */
        ListTile(
          title: MenuElements(title: 'EOD Summary', icon: Icons.dynamic_form),
          onTap: () {},
        ),
        ListTile(
          title: MenuElements(
            title: 'Log out',
            icon: Icons.logout,
          ),
          onTap: () {
            removeValues();
            chackdata();
            loggedin.email = null;
            loggedin.password = null;
            currentuser.roleid = null;
            remembereddata.email= null;
            remembereddata.password =null;
            DBrequestdata.empname = null;
            DBrequestdata.emailid =null;
            currentuser.roleid = null;
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
          },
        ),
        /*Image(
          image: AssetImage('images/ttflogo.png'),
          height:40,
        ),*/
      ],
    );
  }
}
