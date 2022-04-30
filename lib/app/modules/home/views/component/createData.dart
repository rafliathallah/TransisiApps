import 'package:flutter/material.dart';
import 'package:transisi_app/app/data/model_create.dart';

class CreateData extends StatefulWidget {
  CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  final _nameC = TextEditingController();
  final _jobC = TextEditingController();

  HttpStateful dataResponse =
      HttpStateful(createdAt: '', id: '', job: '', name: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    color: Color(0xffDEF3F4),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      (dataResponse.id == null)
                          ? "ID : Belum ada data"
                          : "ID : ${dataResponse.id}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text("Name : ", style: TextStyle(fontSize: 20)),
                    Text(
                      (dataResponse.id == null)
                          ? "ID : Belum ada data"
                          : " ${dataResponse.name}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text("Job : ", style: TextStyle(fontSize: 20)),
                    Text(
                      (dataResponse.id == null)
                          ? "ID : Belum ada data"
                          : dataResponse.job,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text("Created At : ", style: TextStyle(fontSize: 20)),
                    Text(
                      (dataResponse.id == null)
                          ? "ID : Belum ada data"
                          : " ${dataResponse.createdAt}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                child: Card(
                  color: Color(0xffDEF3F4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameC,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                          ),
                        ),
                        TextField(
                          controller: _jobC,
                          decoration: InputDecoration(
                            labelText: 'Job',
                          ),
                        ),
                      ],
                    ),
                  ),
                  semanticContainer: true,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.greenAccent)),
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  HttpStateful.connectAPI(_nameC.text, _jobC.text).then(
                    (value) {
                      print(value.name);
                      setState(() {
                        dataResponse = value;
                      });
                    },
                  );
                },
                child: Text(
                  "POST DATA",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
