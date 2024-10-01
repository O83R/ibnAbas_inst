import 'package:flutter/material.dart';

import '../model/user_model.dart';

class ConnectServer extends StatefulWidget {
  const ConnectServer({super.key});

  @override
  State<ConnectServer> createState() => _ConnectServerState();
}

class _ConnectServerState extends State<ConnectServer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter IP server',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Server IP',
                    suffix: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        Ctrl.ipServerCtrl.text.isEmpty
                            ? print('Please Enter IP Server')
                            /*Fluttertoast.showToast(
                                backgroundColor: Colors.orangeAccent,
                                textColor: Colors.blueAccent,
                                msg: 'Please Enter IP Server',
                                toastLength: Toast.LENGTH_SHORT,
                              )*/
                            : Operations.checkConnection(context);
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                    )),
                controller: Ctrl.ipServerCtrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
