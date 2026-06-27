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

import 'package:protobuf/protobuf.dart' as $pb;

class TipoAlerta extends $pb.ProtobufEnum {
  static const TipoAlerta DESCONOCIDO = TipoAlerta._(0, _omitEnumNames ? '' : 'DESCONOCIDO');
  static const TipoAlerta SALUD = TipoAlerta._(1, _omitEnumNames ? '' : 'SALUD');
  static const TipoAlerta ALIMENTOS = TipoAlerta._(2, _omitEnumNames ? '' : 'ALIMENTOS');
  static const TipoAlerta SEGURIDAD = TipoAlerta._(3, _omitEnumNames ? '' : 'SEGURIDAD');
  static const TipoAlerta INFRAESTRUCTURA = TipoAlerta._(4, _omitEnumNames ? '' : 'INFRAESTRUCTURA');

  static const $core.List<TipoAlerta> values = <TipoAlerta> [
    DESCONOCIDO,
    SALUD,
    ALIMENTOS,
    SEGURIDAD,
    INFRAESTRUCTURA,
  ];

  static final $core.Map<$core.int, TipoAlerta> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TipoAlerta? valueOf($core.int value) => _byValue[value];

  const TipoAlerta._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
