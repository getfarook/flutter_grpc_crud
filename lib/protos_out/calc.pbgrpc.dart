///
//  Generated code. Do not modify.
//  source: calc.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'calc.pb.dart' as $0;
export 'calc.pb.dart';

class CalcServiceClient extends $grpc.Client {
  static final _$calc = $grpc.ClientMethod<$0.CalcRequest, $0.CalcResponse>(
      '/calc.CalcService/Calc',
      ($0.CalcRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CalcResponse.fromBuffer(value));

  CalcServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CalcResponse> calc($0.CalcRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$calc, request, options: options);
  }
}

abstract class CalcServiceBase extends $grpc.Service {
  $core.String get $name => 'calc.CalcService';

  CalcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CalcRequest, $0.CalcResponse>(
        'Calc',
        calc_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CalcRequest.fromBuffer(value),
        ($0.CalcResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CalcResponse> calc_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CalcRequest> request) async {
    return calc(call, await request);
  }

  $async.Future<$0.CalcResponse> calc(
      $grpc.ServiceCall call, $0.CalcRequest request);
}
