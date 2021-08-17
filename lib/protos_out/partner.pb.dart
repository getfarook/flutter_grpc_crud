///
//  Generated code. Do not modify.
//  source: prodpb/partner.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Partner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Partner', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'prod'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openBal', $pb.PbFieldType.OD, protoName: 'openBal')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currBal', $pb.PbFieldType.OD, protoName: 'currBal')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contactNo', protoName: 'contactNo')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details')
    ..hasRequiredFields = false
  ;

  Partner._() : super();
  factory Partner() => create();
  factory Partner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Partner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Partner clone() => Partner()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Partner copyWith(void Function(Partner) updates) => super.copyWith((message) => updates(message as Partner)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Partner create() => Partner._();
  Partner createEmptyInstance() => create();
  static $pb.PbList<Partner> createRepeated() => $pb.PbList<Partner>();
  @$core.pragma('dart2js:noInline')
  static Partner getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Partner>(create);
  static Partner _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get openBal => $_getN(2);
  @$pb.TagNumber(3)
  set openBal($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOpenBal() => $_has(2);
  @$pb.TagNumber(3)
  void clearOpenBal() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get currBal => $_getN(3);
  @$pb.TagNumber(4)
  set currBal($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrBal() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrBal() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get contactNo => $_getSZ(4);
  @$pb.TagNumber(5)
  set contactNo($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContactNo() => $_has(4);
  @$pb.TagNumber(5)
  void clearContactNo() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get details => $_getSZ(5);
  @$pb.TagNumber(6)
  set details($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDetails() => $_has(5);
  @$pb.TagNumber(6)
  void clearDetails() => clearField(6);
}

class PartnerId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PartnerId', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'prod'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  PartnerId._() : super();
  factory PartnerId() => create();
  factory PartnerId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PartnerId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PartnerId clone() => PartnerId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PartnerId copyWith(void Function(PartnerId) updates) => super.copyWith((message) => updates(message as PartnerId)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartnerId create() => PartnerId._();
  PartnerId createEmptyInstance() => create();
  static $pb.PbList<PartnerId> createRepeated() => $pb.PbList<PartnerId>();
  @$core.pragma('dart2js:noInline')
  static PartnerId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PartnerId>(create);
  static PartnerId _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Partners extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Partners', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'prod'), createEmptyInstance: create)
    ..pc<Partner>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'myPartners', $pb.PbFieldType.PM, protoName: 'myPartners', subBuilder: Partner.create)
    ..hasRequiredFields = false
  ;

  Partners._() : super();
  factory Partners() => create();
  factory Partners.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Partners.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Partners clone() => Partners()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Partners copyWith(void Function(Partners) updates) => super.copyWith((message) => updates(message as Partners)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Partners create() => Partners._();
  Partners createEmptyInstance() => create();
  static $pb.PbList<Partners> createRepeated() => $pb.PbList<Partners>();
  @$core.pragma('dart2js:noInline')
  static Partners getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Partners>(create);
  static Partners _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Partner> get myPartners => $_getList(0);
}

class GetPartnerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPartnerRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'prod'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetPartnerRequest._() : super();
  factory GetPartnerRequest() => create();
  factory GetPartnerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPartnerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPartnerRequest clone() => GetPartnerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPartnerRequest copyWith(void Function(GetPartnerRequest) updates) => super.copyWith((message) => updates(message as GetPartnerRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPartnerRequest create() => GetPartnerRequest._();
  GetPartnerRequest createEmptyInstance() => create();
  static $pb.PbList<GetPartnerRequest> createRepeated() => $pb.PbList<GetPartnerRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPartnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPartnerRequest>(create);
  static GetPartnerRequest _defaultInstance;
}

class DelPartnerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DelPartnerResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'prod'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DelPartnerResponse._() : super();
  factory DelPartnerResponse() => create();
  factory DelPartnerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelPartnerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelPartnerResponse clone() => DelPartnerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelPartnerResponse copyWith(void Function(DelPartnerResponse) updates) => super.copyWith((message) => updates(message as DelPartnerResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelPartnerResponse create() => DelPartnerResponse._();
  DelPartnerResponse createEmptyInstance() => create();
  static $pb.PbList<DelPartnerResponse> createRepeated() => $pb.PbList<DelPartnerResponse>();
  @$core.pragma('dart2js:noInline')
  static DelPartnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelPartnerResponse>(create);
  static DelPartnerResponse _defaultInstance;
}

