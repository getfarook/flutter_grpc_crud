///
//  Generated code. Do not modify.
//  source: prodpb/partner.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'partner.pb.dart' as $0;
export 'partner.pb.dart';

class PartnerServiceClient extends $grpc.Client {
  static final _$addPartner = $grpc.ClientMethod<$0.Partner, $0.PartnerId>(
      '/prod.PartnerService/AddPartner',
      ($0.Partner value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PartnerId.fromBuffer(value));
  static final _$getPartners =
      $grpc.ClientMethod<$0.GetPartnerRequest, $0.Partners>(
          '/prod.PartnerService/GetPartners',
          ($0.GetPartnerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Partners.fromBuffer(value));
  static final _$deletePartner =
      $grpc.ClientMethod<$0.PartnerId, $0.DelPartnerResponse>(
          '/prod.PartnerService/DeletePartner',
          ($0.PartnerId value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DelPartnerResponse.fromBuffer(value));
  static final _$updatePartner =
      $grpc.ClientMethod<$0.Partner, $0.DelPartnerResponse>(
          '/prod.PartnerService/UpdatePartner',
          ($0.Partner value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DelPartnerResponse.fromBuffer(value));

  PartnerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.PartnerId> addPartner($0.Partner request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addPartner, request, options: options);
  }

  $grpc.ResponseFuture<$0.Partners> getPartners($0.GetPartnerRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getPartners, request, options: options);
  }

  $grpc.ResponseFuture<$0.DelPartnerResponse> deletePartner(
      $0.PartnerId request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deletePartner, request, options: options);
  }

  $grpc.ResponseFuture<$0.DelPartnerResponse> updatePartner($0.Partner request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updatePartner, request, options: options);
  }
}

abstract class PartnerServiceBase extends $grpc.Service {
  $core.String get $name => 'prod.PartnerService';

  PartnerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Partner, $0.PartnerId>(
        'AddPartner',
        addPartner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Partner.fromBuffer(value),
        ($0.PartnerId value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPartnerRequest, $0.Partners>(
        'GetPartners',
        getPartners_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPartnerRequest.fromBuffer(value),
        ($0.Partners value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PartnerId, $0.DelPartnerResponse>(
        'DeletePartner',
        deletePartner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PartnerId.fromBuffer(value),
        ($0.DelPartnerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Partner, $0.DelPartnerResponse>(
        'UpdatePartner',
        updatePartner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Partner.fromBuffer(value),
        ($0.DelPartnerResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PartnerId> addPartner_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Partner> request) async {
    return addPartner(call, await request);
  }

  $async.Future<$0.Partners> getPartners_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetPartnerRequest> request) async {
    return getPartners(call, await request);
  }

  $async.Future<$0.DelPartnerResponse> deletePartner_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PartnerId> request) async {
    return deletePartner(call, await request);
  }

  $async.Future<$0.DelPartnerResponse> updatePartner_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Partner> request) async {
    return updatePartner(call, await request);
  }

  $async.Future<$0.PartnerId> addPartner(
      $grpc.ServiceCall call, $0.Partner request);
  $async.Future<$0.Partners> getPartners(
      $grpc.ServiceCall call, $0.GetPartnerRequest request);
  $async.Future<$0.DelPartnerResponse> deletePartner(
      $grpc.ServiceCall call, $0.PartnerId request);
  $async.Future<$0.DelPartnerResponse> updatePartner(
      $grpc.ServiceCall call, $0.Partner request);
}
