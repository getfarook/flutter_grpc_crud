///
//  Generated code. Do not modify.
//  source: prodpb/prod.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'prod.pb.dart' as $1;
export 'prod.pb.dart';

class ProductServiceClient extends $grpc.Client {
  static final _$addProduct = $grpc.ClientMethod<$1.Product, $1.ProdId>(
      '/prod.ProductService/AddProduct',
      ($1.Product value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ProdId.fromBuffer(value));
  static final _$getProducts =
      $grpc.ClientMethod<$1.GetProdRequest, $1.Products>(
          '/prod.ProductService/GetProducts',
          ($1.GetProdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Products.fromBuffer(value));
  static final _$deleteProduct =
      $grpc.ClientMethod<$1.ProdId, $1.DelProdResponse>(
          '/prod.ProductService/DeleteProduct',
          ($1.ProdId value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.DelProdResponse.fromBuffer(value));
  static final _$updateProduct =
      $grpc.ClientMethod<$1.Product, $1.DelProdResponse>(
          '/prod.ProductService/UpdateProduct',
          ($1.Product value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.DelProdResponse.fromBuffer(value));

  ProductServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ProdId> addProduct($1.Product request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addProduct, request, options: options);
  }

  $grpc.ResponseFuture<$1.Products> getProducts($1.GetProdRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getProducts, request, options: options);
  }

  $grpc.ResponseFuture<$1.DelProdResponse> deleteProduct($1.ProdId request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteProduct, request, options: options);
  }

  $grpc.ResponseFuture<$1.DelProdResponse> updateProduct($1.Product request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$updateProduct, request, options: options);
  }
}

abstract class ProductServiceBase extends $grpc.Service {
  $core.String get $name => 'prod.ProductService';

  ProductServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Product, $1.ProdId>(
        'AddProduct',
        addProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Product.fromBuffer(value),
        ($1.ProdId value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetProdRequest, $1.Products>(
        'GetProducts',
        getProducts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetProdRequest.fromBuffer(value),
        ($1.Products value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ProdId, $1.DelProdResponse>(
        'DeleteProduct',
        deleteProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ProdId.fromBuffer(value),
        ($1.DelProdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Product, $1.DelProdResponse>(
        'UpdateProduct',
        updateProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Product.fromBuffer(value),
        ($1.DelProdResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ProdId> addProduct_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Product> request) async {
    return addProduct(call, await request);
  }

  $async.Future<$1.Products> getProducts_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GetProdRequest> request) async {
    return getProducts(call, await request);
  }

  $async.Future<$1.DelProdResponse> deleteProduct_Pre(
      $grpc.ServiceCall call, $async.Future<$1.ProdId> request) async {
    return deleteProduct(call, await request);
  }

  $async.Future<$1.DelProdResponse> updateProduct_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Product> request) async {
    return updateProduct(call, await request);
  }

  $async.Future<$1.ProdId> addProduct(
      $grpc.ServiceCall call, $1.Product request);
  $async.Future<$1.Products> getProducts(
      $grpc.ServiceCall call, $1.GetProdRequest request);
  $async.Future<$1.DelProdResponse> deleteProduct(
      $grpc.ServiceCall call, $1.ProdId request);
  $async.Future<$1.DelProdResponse> updateProduct(
      $grpc.ServiceCall call, $1.Product request);
}
