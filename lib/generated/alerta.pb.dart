//
//  Generated code. Do not modify.
//  source: alerta.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'alerta.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'alerta.pbenum.dart';

class Reporte extends $pb.GeneratedMessage {
  factory Reporte({
    $core.String? id,
    TipoAlerta? tipo,
    $core.double? lat,
    $core.double? lng,
    $core.String? mensaje,
    $fixnum.Int64? timestamp,
    $core.String? reporteroId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (tipo != null) {
      $result.tipo = tipo;
    }
    if (lat != null) {
      $result.lat = lat;
    }
    if (lng != null) {
      $result.lng = lng;
    }
    if (mensaje != null) {
      $result.mensaje = mensaje;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (reporteroId != null) {
      $result.reporteroId = reporteroId;
    }
    return $result;
  }
  Reporte._() : super();
  factory Reporte.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reporte.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reporte', package: const $pb.PackageName(_omitMessageNames ? '' : 'alerta'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<TipoAlerta>(2, _omitFieldNames ? '' : 'tipo', $pb.PbFieldType.OE, defaultOrMaker: TipoAlerta.DESCONOCIDO, valueOf: TipoAlerta.valueOf, enumValues: TipoAlerta.values)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OF)
    ..aOS(5, _omitFieldNames ? '' : 'mensaje')
    ..aInt64(6, _omitFieldNames ? '' : 'timestamp')
    ..aOS(7, _omitFieldNames ? '' : 'reporteroId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reporte clone() => Reporte()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reporte copyWith(void Function(Reporte) updates) => super.copyWith((message) => updates(message as Reporte)) as Reporte;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reporte create() => Reporte._();
  Reporte createEmptyInstance() => create();
  static $pb.PbList<Reporte> createRepeated() => $pb.PbList<Reporte>();
  @$core.pragma('dart2js:noInline')
  static Reporte getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reporte>(create);
  static Reporte? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  TipoAlerta get tipo => $_getN(1);
  @$pb.TagNumber(2)
  set tipo(TipoAlerta v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTipo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTipo() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get lat => $_getN(2);
  @$pb.TagNumber(3)
  set lat($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLat() => $_has(2);
  @$pb.TagNumber(3)
  void clearLat() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get lng => $_getN(3);
  @$pb.TagNumber(4)
  set lng($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLng() => $_has(3);
  @$pb.TagNumber(4)
  void clearLng() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get mensaje => $_getSZ(4);
  @$pb.TagNumber(5)
  set mensaje($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMensaje() => $_has(4);
  @$pb.TagNumber(5)
  void clearMensaje() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get timestamp => $_getI64(5);
  @$pb.TagNumber(6)
  set timestamp($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestamp() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get reporteroId => $_getSZ(6);
  @$pb.TagNumber(7)
  set reporteroId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasReporteroId() => $_has(6);
  @$pb.TagNumber(7)
  void clearReporteroId() => $_clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
