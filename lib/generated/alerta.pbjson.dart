//
//  Generated code. Do not modify.
//  source: alerta.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tipoAlertaDescriptor instead')
const TipoAlerta$json = {
  '1': 'TipoAlerta',
  '2': [
    {'1': 'DESCONOCIDO', '2': 0},
    {'1': 'SALUD', '2': 1},
    {'1': 'ALIMENTOS', '2': 2},
    {'1': 'SEGURIDAD', '2': 3},
    {'1': 'INFRAESTRUCTURA', '2': 4},
  ],
};

/// Descriptor for `TipoAlerta`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tipoAlertaDescriptor = $convert.base64Decode(
    'CgpUaXBvQWxlcnRhEg8KC0RFU0NPTk9DSURPEAASCQoFU0FMVUQQARINCglBTElNRU5UT1MQAh'
    'INCglTRUdVUklEQUQQAxITCg9JTkZSQUVTVFJVQ1RVUkEQBA==');

@$core.Deprecated('Use reporteDescriptor instead')
const Reporte$json = {
  '1': 'Reporte',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'tipo', '3': 2, '4': 1, '5': 14, '6': '.alerta.TipoAlerta', '10': 'tipo'},
    {'1': 'lat', '3': 3, '4': 1, '5': 2, '10': 'lat'},
    {'1': 'lng', '3': 4, '4': 1, '5': 2, '10': 'lng'},
    {'1': 'mensaje', '3': 5, '4': 1, '5': 9, '10': 'mensaje'},
    {'1': 'timestamp', '3': 6, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'reportero_id', '3': 7, '4': 1, '5': 9, '10': 'reporteroId'},
  ],
};

/// Descriptor for `Reporte`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reporteDescriptor = $convert.base64Decode(
    'CgdSZXBvcnRlEg4KAmlkGAEgASgJUgJpZBImCgR0aXBvGAIgASgOMhIuYWxlcnRhLlRpcG9BbG'
    'VydGFSBHRpcG8SEAoDbGF0GAMgASgCUgNsYXQSEAoDbG5nGAQgASgCUgNsbmcSGAoHbWVuc2Fq'
    'ZRgFIAEoCVIHbWVuc2FqZRIcCgl0aW1lc3RhbXAYBiABKANSCXRpbWVzdGFtcBIhCgxyZXBvcn'
    'Rlcm9faWQYByABKAlSC3JlcG9ydGVyb0lk');

