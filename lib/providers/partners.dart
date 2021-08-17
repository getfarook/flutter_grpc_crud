import 'dart:convert';
import 'package:flutter/material.dart';
import './partner.dart';
import '../models/http_exception.dart';
import 'package:grpc/grpc.dart';
import '../protos_out/partner.pb.dart' as pb1;
import '../protos_out/partner.pbgrpc.dart' as pb2;
import './constants.dart';

class Partners with ChangeNotifier {

  List<Partner> _items = [];

  List<Partner> get items{
    return [..._items];
  }

  Partner findById(int id){
    return _items.firstWhere((partner) => partner.id == id);
  }

  var client = pb2.PartnerServiceClient(
    ClientChannel(
      Constants.serverIp,
      port: Constants.port,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );

  Future<void> fetchAndSetPartnersRpc() async {
    try {
      final response = await client.getPartners(pb1.GetPartnerRequest());
     // final response = await http.get(url);
      //final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedData = response.myPartners;
      final List<Partner> loadedPartners = [];
      extractedData.forEach((element) {
        loadedPartners.add(Partner(
          id: element.id,
          name: element.name,
          openBal: element.openBal,
          currBal: element.currBal,
          contactNo: element.contactNo,
          details: element.details,
        ));
      });
      _items = loadedPartners;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addPartnerRpc(Partner partner) async {
    try{
      final response = await client.addPartner(
          pb1.Partner()
            ..name = partner.name
            ..openBal = partner.openBal
            ..currBal = partner.currBal
            ..contactNo = partner.contactNo
            ..details = partner.details
      );
      final newPartner = Partner(
        name: partner.name,
        openBal: partner.openBal,
        currBal: partner.currBal,
        contactNo: partner.contactNo,
        details: partner.details,
        id: response.id,
      );
      _items.add(newPartner);
      notifyListeners();
    }catch(error){
      print(error);
      throw error;
    }
  }

  Future<void> updatePartnerRpc(int id, Partner newPartner) async {
    final partnerIndex = _items.indexWhere((partner) => partner.id == id);
    if (partnerIndex >= 0) {
      final response = await client.updatePartner(
          pb1.Partner()
            ..id = id
            ..name = newPartner.name
            ..openBal = newPartner.openBal
            ..currBal = newPartner.currBal
            ..contactNo = newPartner.contactNo
            ..details = newPartner.details
      );
      _items[partnerIndex] = newPartner;
      notifyListeners();
    } else {
      print('Update failed. Unable to find the partner index in _items list');
    }
  }

  Future<void> deletePartnerRpc(int id) async {
    final existingPartnerIndex = _items.indexWhere((part) => part.id == id);
    var existingPartner = _items[existingPartnerIndex];
    _items.removeAt(existingPartnerIndex);
    notifyListeners();
    try{
      print("Right before");
      final response = client.deletePartner(
        pb1.PartnerId()
          ..id = id
      );
    }catch(error){
      print("Inside catch 1");
      _items.insert(existingPartnerIndex, existingPartner);
      notifyListeners();
      print(error);
    }
    existingPartner = null;
  }

}