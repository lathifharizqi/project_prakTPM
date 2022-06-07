import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  final data;
  const detail({Key? key, required this.data }) : super(key: key);

  @override
  _detailState createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rekapitulasi ${widget.data['nama']}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.data['nama'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Kode: " + widget.data['kode'])),
                  ],
                ),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(15, 15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text("ODP"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Proses"),
                              SizedBox(height: 5),
                              Text("${widget.data['odpProses']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Selesai"),
                              SizedBox(height: 5),
                              Text("${widget.data['odpSelesai']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Total"),
                              SizedBox(height: 5),
                              Text("${widget.data['odpTotal']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(15, 15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text("PDP"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Proses"),
                              SizedBox(height: 5),
                              Text("${widget.data['pdpProses']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Selesai"),
                              SizedBox(height: 5),
                              Text("${widget.data['pdpSelesai']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Total"),
                              SizedBox(height: 5),
                              Text("${widget.data['pdpTotal']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(15, 15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text("OTG"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Proses"),
                              SizedBox(height: 5),
                              Text("${widget.data['otgProses']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Selesai"),
                              SizedBox(height: 5),
                              Text("${widget.data['otgSelesai']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Total"),
                              SizedBox(height: 5),
                              Text("${widget.data['otgTotal']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(15, 15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text("KASUS"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Positif"),
                              SizedBox(height: 5),
                              Text("${widget.data['positif']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Sembuh"),
                              SizedBox(height: 5),
                              Text("${widget.data['sembuh']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Meninggal"),
                              SizedBox(height: 5),
                              Text("${widget.data['meninggal']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(15, 15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text("MENINGGAL"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("ODP"),
                              SizedBox(height: 5),
                              Text("${widget.data['odpMeninggal']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("PDP"),
                              SizedBox(height: 5),
                              Text("${widget.data['pdpMeninggal']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("OTG"),
                              SizedBox(height: 5),
                              Text("${widget.data['otgMeninggal']}", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
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
