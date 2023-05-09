import 'package:dio/dio.dart';
import 'package:weeek_api/models/currency.dart';

import '../models/contact.dart';
import '../models/deal.dart';
import '../models/funnels_model.dart';
import '../models/funnels_status.dart';
import '../models/organization.dart';

const String _url = "https://api.weeek.net/public/v1";
Dio dio = Dio();

class Api {
  initApi(String token) {
    dio.options.headers.addAll({"Authorization": token});
    dio.options.baseUrl = _url;
  }

  Future<List<Currency>> getCurrency() async {
    var res = await dio.get<Map>("/crm/currencies");
    var cur = <Currency>[];
    for (var element in res.data!['currencies']) {
      cur.add(Currency.fromJson(element));
    }
    return cur;
  }

  Future<List<Organization>> getOrganization() async {
    var res = await dio.get<Map>("/crm/organizations");
    var cur = <Organization>[];
    for (var element in res.data!['organizations']) {
      cur.add(Organization.fromJson(element));
    }
    return cur;
  }

  Future<Organization> getOrganizationById(String id) async {
    var res = await dio.get<Map>("/crm/organizations/$id");

    return Organization.fromJson(res.data!["organization"]);
  }

  Future<Organization> createOrganization(
    String name,
    List<String> address,
    List<String> emails,
    List<String> phones,
  ) async {
    var org = Organization(
        id: "id",
        creatorId: "creatorId",
        name: name,
        addresses: address,
        emails: emails,
        phones: phones,
        responsibles: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    var res = await dio.post("/crm/organizations", data: org.toJson());
    return Organization.fromJson(res.data["organization"]);
  }

  Future<Organization> updateOrganization(
    String id, {
    String? name,
    List<String>? address,
    List<String>? emails,
    List<String>? phones,
  }) async {
    var org = (await getOrganizationById(id)).copyWith(
        name: name, addresses: address, emails: emails, phones: phones);

    var res = await dio.post("/crm/organizations", data: org.toJson());
    return Organization.fromJson(res.data["organization"]);
  }

  Future<bool> removeOrganizationById(String id) async {
    var status = await dio.delete(
      "/crm/organizations/$id",
    );
    return status.data['success'];
  }

  Future<List<Contact>> getContact() async {
    var res = await dio.get<Map>("/crm/contacts");
    var cur = <Contact>[];
    for (var element in res.data!['contacts']) {
      cur.add(Contact.fromJson(element));
    }
    return cur;
  }

  Future<Contact> getContactById(String id) async {
    var res = await dio.get<Map>("/crm/contacts/$id");

    return Contact.fromJson(res.data!["contact"]);
  }

  Future<Contact> createContact(
    String name,
    String email,
    String phone,
  ) async {
    var org = Contact(
        id: "id",
        creatorId: "creatorId",
        organizationId: " ",
        name: name,
        phone: phone,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    var res = await dio.post("/crm/contacts", data: org.toJson());
    return Contact.fromJson(res.data["contact"]);
  }

  Future<Contact> updateContact(String id,
      {String? name, String? orgId, String? phone}) async {
    var org = (await getContactById(id))
        .copyWith(name: name, organizationId: null, phone: phone);

    var res = await dio.post("/crm/contacts", data: org.toJson());
    return Contact.fromJson(res.data["contact"]);
  }

  Future<bool> removeContactById(String id) async {
    var status = await dio.delete(
      "/crm/contacts/$id",
    );
    return status.data['success'];
  }

  Future<List<Funnels>> getAllFunnels() async {
    var res = await dio.get<Map>("/crm/funnels/");
    var funnels = <Funnels>[];
    for (var element in res.data!["funnels"]) {
      funnels.add(Funnels.fromJson(element));
    }
    return funnels;
  }

  Future<Funnels?> createFunnels(String name,
      {int currencyId = 1, bool isPrivate = true}) async {
    var res = await dio.post<Map>("/crm/funnels/",
        data: {"name": name, "currencyId": currencyId, "isPrivate": isPrivate});
    return Funnels.fromJson(res.data!["funnel"]);
  }

  Future<Funnels?> getFunnelsById(String id) async {
    var res = await dio.get<Map>("/crm/funnels/$id");
    return Funnels.fromJson(res.data!["funnel"]);
  }

  Future<Funnels?> updateFunnel(String id, String name,
      {int currencyId = 1, bool isPrivate = true}) async {
    var res = await dio.put<Map>("/crm/funnels/$id",
        data: {"name": name, "currencyId": currencyId, "isPrivate": isPrivate});
    return Funnels.fromJson(res.data!["funnel"]);
  }

  Future<bool> deleteFunnel(String id) async {
    var res = await dio.delete<Map>("/crm/funnels/$id");
    return res.data!["success"];
  }

  Future<List<StatusFunnels>> getAllFunnelsStatus(String idFunnel) async {
    var res = await dio.get<Map>("/crm/funnels/$idFunnel/statuses");
    var funnels = <StatusFunnels>[];
    for (var element in res.data!["statuses"]) {
      funnels.add(StatusFunnels.fromJson(element));
    }
    return funnels;
  }

  Future<StatusFunnels?> createFunnelsStatus(
    String idFunnel,
    String name,
  ) async {
    var res = await dio.post<Map>("/crm/funnels/$idFunnel/statuses", data: {
      "name": name,
    });
    return StatusFunnels.fromJson(res.data!["status"]);
  }

  Future<StatusFunnels?> getFunnelsByIdStatus(String id) async {
    var res = await dio.get<Map>("/crm/statuses/$id");
    return StatusFunnels.fromJson(res.data!["status"]);
  }

  Future<StatusFunnels?> updateFunnelStatus(
    String id,
    String name,
  ) async {
    var res = await dio.put<Map>("/crm/statuses/$id", data: {
      "name": name,
    });
    return StatusFunnels.fromJson(res.data!["status"]);
  }

  Future<bool> deleteFunnelStatus(String id) async {
    var res = await dio.delete<Map>("/crm/statuses/$id");
    return res.data!["success"];
  }

  Future<List<Deal>> getDeals(String funnelStatusId) async {
    var res = await dio.get<Map>("/crm/statuses/$funnelStatusId/deals");
    var funnels = <Deal>[];
    for (var element in res.data!["deals"]) {
      funnels.add(Deal.fromJson(element));
    }
    return funnels;
  }

  Future<Deal> createDeal(String funnelStatusId, Deal deal) async {
    var res = await dio.post<Map>("/crm/statuses/$funnelStatusId/deals",
        data: deal.toJson());

    return Deal.fromJson(res.data?["deal"]);
  }

  Future<Deal> getDealById(String id) async {
    var res = await dio.get("/crm/deals/$id");
    return Deal.fromJson(res.data["deal"]);
  }

  Future<Deal> updateDeal(String id, Deal deal) async {
    var res = await dio.put("/crm/deals/$id", data: deal.toJson());
    return Deal.fromJson(res.data["deal"]);
  }

  Future<bool> deleteDealById(
    String id,
  ) async {
    var res = await dio.delete(
      "/crm/deals/$id",
    );

    return res.data["success"];
  }

  Future<bool> moveDealById(String dealId, String statusId,
      {String? previousDealId}) async {
    var res = await dio.post("/crm/deals/$dealId/move",
        data: {"statusId": statusId, "previousDealId": previousDealId});
    return res.data["success"];
  }
}
