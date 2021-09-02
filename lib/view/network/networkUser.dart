import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/network/networkController.dart';

class NetWorkUser extends StatelessWidget {
  final networkController = Get.put(NetworkController());
  NetWorkUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networks"),
        centerTitle: true,
      ),
      body: Obx(
        () => (networkController.load.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                  itemCount: networkController.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        title: Text(networkController.data[index].username),
                        subtitle: Text(networkController.data[index].email),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
