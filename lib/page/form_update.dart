import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:motoshop_reborn/models/firebasemodel.dart';
import 'package:motoshop_reborn/provider/firebase_provider.dart';
import 'package:motoshop_reborn/theme.dart';
import 'package:motoshop_reborn/widget/appbar.dart';
import 'package:provider/provider.dart';

class FormUpdate extends StatefulWidget {
  final bool isUpdating;

  FormUpdate({this.isUpdating});
  @override
  _FormUpdateState createState() => _FormUpdateState();
}

class _FormUpdateState extends State<FormUpdate> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List _subarrayaja = [];

  Motors _currentMotors;
  String _imageUrl;
  File _imageFile;

  TextEditingController arrayajaController = TextEditingController();
  @override
  void initState() {
    super.initState();
    MotorsNotifier motorsNotifier =
        Provider.of<MotorsNotifier>(context, listen: false);
    if (motorsNotifier.currentMotors != null) {
      _currentMotors = motorsNotifier.currentMotors;
    } else {
      _currentMotors = Motors();
    }

    _imageUrl = _currentMotors.gambar_utama;
    //  _currentMotors.arrayaja = _subarrayaja;
  }

  // ignore: missing_return
  Widget _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Text("Image Post");
    } else if (_imageFile != null) {
      print("showing image from local file");

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 240,
          ),
          // ignore: deprecated_member_use
          FlatButton(
              padding: EdgeInsets.all(16),
              color: Colors.black54,
              child: Text(
                "Change Image",
                style: regularTextStyle.copyWith(color: Colors.white),
              ),
              onPressed: () => _getLocalImage())
        ],
      );
    } else if (_imageUrl != null) {
      print("showing image from url");

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            fit: BoxFit.cover,
            height: 240,
          ),
          // ignore: deprecated_member_use
          FlatButton(
              padding: EdgeInsets.all(16),
              color: Colors.black54,
              child: Text(
                "Change Image",
                style: regularTextStyle.copyWith(color: Colors.white),
              ),
              onPressed: () => _getLocalImage())
        ],
      );
    }
  }

  _getLocalImage() async {
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 30,
    );

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Judul"),
      initialValue: _currentMotors.judul,
      keyboardType: TextInputType.text,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : Yamaha R15 Tahun 2019 ';
        }
        if (value.length < 3) {
          return 'Judul minimal 3';
        }
        return null;
      },
      onSaved: (String value) {
        _currentMotors.judul = value;
      },
    );
  }

  Widget _buildTahunMotor() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Tahun Motor"),
      initialValue: _currentMotors.tahun_motor.toString(),
      keyboardType: TextInputType.number,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : 2019 ';
        }
        if (value.length < 3) {
          return 'Tahun Motor minimal 3 angka';
        }
        return null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onSaved: (String value) {
        _currentMotors.tahun_motor = int.tryParse(value);
      },
    );
  }

  Widget _buildJarkTempuh() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Jarak Tempuh",
        prefixText: "Km ",
      ),
      initialValue: _currentMotors.jarak_tempuh.toString(),
      keyboardType: TextInputType.number,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : 25000 ';
        }
        if (value.length < 3) {
          return 'Jarak Tempuh minimal 3 angka';
        }
        return null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onSaved: (String value) {
        _currentMotors.jarak_tempuh = int.tryParse(value);
      },
    );
  }

  Widget _buildHarga() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Harga Motor", prefixText: "Rp "),
      initialValue: _currentMotors.harga.toString(),
      keyboardType: TextInputType.number,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : 20000000 ';
        }
        if (value.length < 6 || value.length > 20) {
          return 'Harga minimal 6 angka';
        }
        return null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onSaved: (String value) {
        _currentMotors.harga = int.tryParse(value);
      },
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Tipe Motor"),
      initialValue: _currentMotors.tipe_motor,
      keyboardType: TextInputType.text,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : R15 155cc ';
        }
        if (value.length < 3) {
          return 'Tipe motor minimal 3 huruf';
        }
        return null;
      },
      onSaved: (String value) {
        _currentMotors.tipe_motor = value;
      },
    );
  }

  Widget _buildMerkField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Merk Motor"),
      initialValue: _currentMotors.merk_motor,
      keyboardType: TextInputType.text,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : Yamaha ';
        }
        if (value.length < 3 || value.length > 20) {
          return 'Merk Motor minimal 3 huruf';
        }
        return null;
      },
      onSaved: (String value) {
        _currentMotors.merk_motor = value;
      },
    );
  }

  Widget _buildPlatMotorField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Plat Motor"),
      initialValue: _currentMotors.plat_motor,
      keyboardType: TextInputType.text,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : B Kota Bekasi ';
        }
        if (value.length < 3) {
          return 'Plat Motor minimal 3 huruf ';
        }
        return null;
      },
      onSaved: (String value) {
        _currentMotors.plat_motor = value;
      },
    );
  }

  Widget _buildPajakField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Pajak Motor"),
      initialValue: _currentMotors.pajak_motor,
      keyboardType: TextInputType.text,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh Hidup 20-01-2023 ';
        }
        if (value.length < 3) {
          return 'Pajak Motor minimal 3 huruf ';
        }
        return null;
      },
      onSaved: (String value) {
        _currentMotors.pajak_motor = value;
      },
    );
  }

  Widget _buildDeskripsiField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Deskripsi Motor"),
      initialValue: _currentMotors.dekripsi,
      keyboardType: TextInputType.text,
      style: regularTextStyle,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mohon diisikan, Contoh : Yamaha R15 2019 Surat-surat lengkap... ';
        }
        if (value.length < 10 || value.length > 30) {
          return 'Dekripsi minimal 10 huruf dan max 30';
        }
        return null;
      },
      onSaved: (String value) {
        _currentMotors.dekripsi = value;
      },
    );
  }

  // _buildArrayajaFied() {
  //   return SizedBox(
  //     width: 200,
  //     child: TextField(
  //       controller: arrayajaController,
  //       keyboardType: TextInputType.text,
  //       decoration: InputDecoration(labelText: "arrayaja"),
  //       style: regularTextStyle,
  //     ),
  //   );
  // }

  // _addArrayaja(String text) {
  //   if (text.isNotEmpty) {
  //     setState(() {
  //       _subarrayaja.add(text);
  //     });
  //     arrayajaController.clear();
  //   }
  // }

  _saveMotors() {
    print("saveMotors Called");
    if (!_formState.currentState.validate()) {
      return;
    }
    _formState.currentState.save();
    print("Form Save");

    uploadMotorsAndImage(
        _currentMotors, widget.isUpdating, _imageFile, _onMotorsUploaded);

    print("Judul: ${_currentMotors.judul}");
    print("Tipe Motor: ${_currentMotors.tipe_motor}");
    print("Aarray Aaja: ${_currentMotors.arrayaja.toString()}");
    print("Image File: ${_imageFile.toString()}");
    print("Image Url: ${_imageUrl}");
  }

  _onMotorsUploaded(Motors motors) {
    MotorsNotifier motorsNotifier =
        Provider.of<MotorsNotifier>(context, listen: false);
    motorsNotifier.addMotors(motors);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.redConst,
      key: _scaffoldKey,
      appBar: customAppbar(widget.isUpdating ? "Edit Post" : "Upload Motors"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formState,
            child: Column(
              children: <Widget>[
                _showImage(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  widget.isUpdating ? "Edit Posting " : "Post Motors",
                  style: regularTextStyle,
                ),
                SizedBox(
                  height: 16,
                ),
                _imageFile == null && _imageUrl == null
                    ? ButtonTheme(
                        child: ElevatedButton(
                            child: Text("Add Image"),
                            onPressed: () => _getLocalImage()),
                      )
                    : SizedBox(
                        height: 0,
                      ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     _buildArrayajaFied(),
                //     ButtonTheme(
                //       child: ElevatedButton(
                //           child: Text("add"),
                //           onPressed: () {
                //             _addArrayaja(arrayajaController.text);
                //           }),
                //     )
                //   ],
                // ),
                _buildNameField(),
                _buildMerkField(),
                _buildCategoryField(),
                _buildTahunMotor(),
                _buildJarkTempuh(),
                _buildPlatMotorField(),
                _buildPajakField(),
                _buildDeskripsiField(),
                _buildHarga(),
                SizedBox(
                  height: 16,
                ),
                Row(
                    children: _subarrayaja
                        .map((arrayaja) => Container(
                              height: 30,
                              child: Card(
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    arrayaja,
                                    style: regularTextStyle.copyWith(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ))
                        .toList())
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          focusColor: Colors.red,
          backgroundColor: Colors.red,
          child: Icon(Icons.save),
          onPressed: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _saveMotors();
          }),
    );
  }
}
