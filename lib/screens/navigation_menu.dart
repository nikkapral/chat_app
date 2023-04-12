import 'package:chattapp/theme.dart';
import 'package:chattapp/helpers.dart';
import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 30),
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: (BorderRadius.circular(30)),
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    Helpers.randomPictureUrl(),
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(width: 20,),
                Text(
                  'Nikita Kapralov', 
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16, 

                    ),
                  ),
              ]
            ),
            SizedBox(height:30),

            ListTile(
            leading: Icon(Icons.thermostat),
            title: Text('Theme'),
            onTap: () => null,
            ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Private access'),
            onTap: () => null,
            ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit account'),
            onTap: () => null,
            ),

          const SizedBox(height: 30,),

          ListTile(
            leading: Icon(Icons.qr_code),
            title: Text('Scan QR'),
            onTap: () => null,
            ),


        
        ]
      )
    ),
  );
}
}