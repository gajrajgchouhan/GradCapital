import 'dart:io';
class Model {
  String title;
  String uploader;
  String vendor;
  String payMethod;
  String debit;
  String gstNo;
  String gstAmt;
  String bill;

  Model(
      {required this.title,
      required this.uploader,
      required this.vendor,
      required this.payMethod,
      required this.debit,
      required this.gstNo,
      required this.gstAmt,
      required this.bill});
}
