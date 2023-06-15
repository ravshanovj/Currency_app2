import 'package:firstapp1/service/get_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
          title: Text(
            "Local Data",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: FutureBuilder(
          future: GetService.getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: LinearProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 120,
                    child: Card(
                      margin: EdgeInsets.all(7),
                      color: Colors.black54,
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 4)),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random/$index"),
                              radius: 50,
                            ),
                          ),
                          title: Text(
                            GetService.currencyBox!
                                .get(index)!
                                .title
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                              GetService.currencyBox!
                                  .get(index)!
                                  .code
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          trailing: Text(
                              GetService.currencyBox!
                                  .get(index)!
                                  .cbPrice
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
            }
          },
        ));
  }
}
