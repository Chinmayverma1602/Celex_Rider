import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  final ValueNotifier<bool> onlineStatus;

  const HeaderDrawer({Key? key, required this.onlineStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      /*    color:
          Theme.of(context).primaryColor, / */
      // Set the background color if needed
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ValueListenableBuilder<bool>(
                  valueListenable: onlineStatus,
                  builder: (context, value, child) {
                    return CircleAvatar(
                      radius: 7,
                      backgroundColor: value ? Colors.green : Colors.grey,
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(width: 16.0),
          Text(
            'Sourav Das',
            style: TextStyle(
              color: Colors.black87, // Adjust the text color if needed
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
