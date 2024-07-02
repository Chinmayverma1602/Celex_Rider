import 'package:celexapp/Appdrawer/HeaderDrawer.dart'; // Adjust the import to match your file structure
import 'package:celexapp/homepage.dart';
import 'package:celexapp/setting.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ValueNotifier<bool> onlineStatus = ValueNotifier<bool>(false);
  String userId = 'DB00179';
  String selectedCountry = 'Select Country';

  void _editUserId(BuildContext context) {
    TextEditingController controller = TextEditingController(text: userId);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit User ID'),
          content: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'User ID',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  userId = controller.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _selectCountry(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Country'),
          content: DropdownButton<String>(
            isExpanded: true,
            value: selectedCountry,
            items: <String>['Select Country', 'USA', 'Canada', 'India', 'UK']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCountry = newValue!;
              });
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.grey.shade600,
                Colors.grey.shade500,
                Colors.grey.shade300,
              ],
            ),
          ),
          child: ListView(
            children: [
              HeaderDrawer(
                  onlineStatus:
                      onlineStatus), // Pass the onlineStatus ValueNotifier here
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('My Profile', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.fire_truck),
                title: Text('Vehicle Details', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text('Documents', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.keyboard_return_sharp),
                title: Text('Returns', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on_sharp),
                title: Text('Meter Readings', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title:
                    Text('Trip Summary [Beta]', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      width: 63,
                      height: 63,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/avatar.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.edit, size: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sourav Das',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Text('Phone Number'),
                subtitle: Text('8013847964'),
                trailing: Icon(Icons.edit),
              ),
              Divider(),
              ListTile(
                title: Text('User ID'),
                subtitle: Text(userId),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editUserId(context);
                  },
                ),
              ),
              Divider(),
              ListTile(
                title: Text('Country'),
                subtitle: Text(selectedCountry),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    _selectCountry(context);
                  },
                ),
              ),
              Divider(),
              ValueListenableBuilder<bool>(
                valueListenable: onlineStatus,
                builder: (context, value, child) {
                  return SwitchListTile(
                    title: Text('Online Status'),
                    value: value,
                    onChanged: (bool newValue) {
                      onlineStatus.value = newValue;
                    },
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text('Member Since'),
                subtitle: Text('January 1, 2020'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
