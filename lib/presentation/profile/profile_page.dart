import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height:30),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                ),
                SizedBox(height:20),
                Text(
                  'Username',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold) ,
                )
              ],              
            ),
          ),
          SizedBox(height: 30,),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personal information',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Correo',
                          ),
                          Text(
                            'david_6327@hotmail.com',
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Theme.of(context).secondaryHeaderColor),
                          ),
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              'Dark mode',
                              style: Theme.of(context).textTheme.bodyText1
                            ),
                            value: true,
                            onChanged: (val){

                            }
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: RaisedButton(
                    color: AppColors.purple,
                    textColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Log Out'
                      ),
                    ),

                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}