// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAddressCollection on Isar {
  IsarCollection<Address> get address => this.collection();
}

const AddressSchema = CollectionSchema(
  name: r'Address',
  id: 3544600503126319553,
  properties: {
    r'addressId': PropertySchema(
      id: 0,
      name: r'addressId',
      type: IsarType.string,
    ),
    r'addressTitle': PropertySchema(
      id: 1,
      name: r'addressTitle',
      type: IsarType.string,
    ),
    r'area': PropertySchema(
      id: 2,
      name: r'area',
      type: IsarType.string,
    ),
    r'district': PropertySchema(
      id: 3,
      name: r'district',
      type: IsarType.string,
    ),
    r'doorNumber': PropertySchema(
      id: 4,
      name: r'doorNumber',
      type: IsarType.string,
    ),
    r'landmark': PropertySchema(
      id: 5,
      name: r'landmark',
      type: IsarType.string,
    ),
    r'pincode': PropertySchema(
      id: 6,
      name: r'pincode',
      type: IsarType.string,
    ),
    r'street': PropertySchema(
      id: 7,
      name: r'street',
      type: IsarType.string,
    )
  },
  estimateSize: _addressEstimateSize,
  serialize: _addressSerialize,
  deserialize: _addressDeserialize,
  deserializeProp: _addressDeserializeProp,
  idName: r'id',
  indexes: {
    r'addressId': IndexSchema(
      id: -4281582689294981551,
      name: r'addressId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'addressId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _addressGetId,
  getLinks: _addressGetLinks,
  attach: _addressAttach,
  version: '3.0.5',
);

int _addressEstimateSize(
  Address object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.addressId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.addressTitle.length * 3;
  bytesCount += 3 + object.area.length * 3;
  {
    final value = object.district;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.doorNumber.length * 3;
  {
    final value = object.landmark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pincode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.street;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _addressSerialize(
  Address object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.addressId);
  writer.writeString(offsets[1], object.addressTitle);
  writer.writeString(offsets[2], object.area);
  writer.writeString(offsets[3], object.district);
  writer.writeString(offsets[4], object.doorNumber);
  writer.writeString(offsets[5], object.landmark);
  writer.writeString(offsets[6], object.pincode);
  writer.writeString(offsets[7], object.street);
}

Address _addressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Address(
    addressId: reader.readStringOrNull(offsets[0]),
    addressTitle: reader.readString(offsets[1]),
    area: reader.readString(offsets[2]),
    district: reader.readStringOrNull(offsets[3]),
    doorNumber: reader.readString(offsets[4]),
    landmark: reader.readStringOrNull(offsets[5]),
    pincode: reader.readStringOrNull(offsets[6]),
    street: reader.readStringOrNull(offsets[7]),
  );
  object.id = id;
  return object;
}

P _addressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _addressGetId(Address object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _addressGetLinks(Address object) {
  return [];
}

void _addressAttach(IsarCollection<dynamic> col, Id id, Address object) {
  object.id = id;
}

extension AddressByIndex on IsarCollection<Address> {
  Future<Address?> getByAddressId(String? addressId) {
    return getByIndex(r'addressId', [addressId]);
  }

  Address? getByAddressIdSync(String? addressId) {
    return getByIndexSync(r'addressId', [addressId]);
  }

  Future<bool> deleteByAddressId(String? addressId) {
    return deleteByIndex(r'addressId', [addressId]);
  }

  bool deleteByAddressIdSync(String? addressId) {
    return deleteByIndexSync(r'addressId', [addressId]);
  }

  Future<List<Address?>> getAllByAddressId(List<String?> addressIdValues) {
    final values = addressIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'addressId', values);
  }

  List<Address?> getAllByAddressIdSync(List<String?> addressIdValues) {
    final values = addressIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'addressId', values);
  }

  Future<int> deleteAllByAddressId(List<String?> addressIdValues) {
    final values = addressIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'addressId', values);
  }

  int deleteAllByAddressIdSync(List<String?> addressIdValues) {
    final values = addressIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'addressId', values);
  }

  Future<Id> putByAddressId(Address object) {
    return putByIndex(r'addressId', object);
  }

  Id putByAddressIdSync(Address object, {bool saveLinks = true}) {
    return putByIndexSync(r'addressId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAddressId(List<Address> objects) {
    return putAllByIndex(r'addressId', objects);
  }

  List<Id> putAllByAddressIdSync(List<Address> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'addressId', objects, saveLinks: saveLinks);
  }
}

extension AddressQueryWhereSort on QueryBuilder<Address, Address, QWhere> {
  QueryBuilder<Address, Address, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AddressQueryWhere on QueryBuilder<Address, Address, QWhereClause> {
  QueryBuilder<Address, Address, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> addressIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'addressId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> addressIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'addressId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> addressIdEqualTo(
      String? addressId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'addressId',
        value: [addressId],
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterWhereClause> addressIdNotEqualTo(
      String? addressId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'addressId',
              lower: [],
              upper: [addressId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'addressId',
              lower: [addressId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'addressId',
              lower: [addressId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'addressId',
              lower: [],
              upper: [addressId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AddressQueryFilter
    on QueryBuilder<Address, Address, QFilterCondition> {
  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addressId',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addressId',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addressId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'addressId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressId',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'addressId',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addressTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addressTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addressTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'addressTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'addressTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'addressTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'addressTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> addressTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition>
      addressTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'addressTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'area',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'area',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> areaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doorNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doorNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doorNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doorNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'doorNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'doorNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'doorNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'doorNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doorNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> doorNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'doorNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'landmark',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'landmark',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'landmark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'landmark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'landmark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'landmark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'landmark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'landmark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'landmark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'landmark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'landmark',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> landmarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'landmark',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pincode',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pincode',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pincode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pincode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pincode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pincode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pincode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pincode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pincode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pincode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pincode',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> pincodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pincode',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'street',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'street',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'street',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'street',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'street',
        value: '',
      ));
    });
  }

  QueryBuilder<Address, Address, QAfterFilterCondition> streetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'street',
        value: '',
      ));
    });
  }
}

extension AddressQueryObject
    on QueryBuilder<Address, Address, QFilterCondition> {}

extension AddressQueryLinks
    on QueryBuilder<Address, Address, QFilterCondition> {}

extension AddressQuerySortBy on QueryBuilder<Address, Address, QSortBy> {
  QueryBuilder<Address, Address, QAfterSortBy> sortByAddressId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressId', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByAddressIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressId', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByAddressTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressTitle', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByAddressTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressTitle', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByDoorNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doorNumber', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByDoorNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doorNumber', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByLandmark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landmark', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByLandmarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landmark', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByPincode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pincode', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByPincodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pincode', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByStreet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'street', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> sortByStreetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'street', Sort.desc);
    });
  }
}

extension AddressQuerySortThenBy
    on QueryBuilder<Address, Address, QSortThenBy> {
  QueryBuilder<Address, Address, QAfterSortBy> thenByAddressId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressId', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByAddressIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressId', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByAddressTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressTitle', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByAddressTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressTitle', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByDoorNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doorNumber', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByDoorNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doorNumber', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByLandmark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landmark', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByLandmarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'landmark', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByPincode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pincode', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByPincodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pincode', Sort.desc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByStreet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'street', Sort.asc);
    });
  }

  QueryBuilder<Address, Address, QAfterSortBy> thenByStreetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'street', Sort.desc);
    });
  }
}

extension AddressQueryWhereDistinct
    on QueryBuilder<Address, Address, QDistinct> {
  QueryBuilder<Address, Address, QDistinct> distinctByAddressId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addressId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Address, Address, QDistinct> distinctByAddressTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addressTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Address, Address, QDistinct> distinctByArea(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'area', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Address, Address, QDistinct> distinctByDistrict(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Address, Address, QDistinct> distinctByDoorNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doorNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Address, Address, QDistinct> distinctByLandmark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'landmark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Address, Address, QDistinct> distinctByPincode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pincode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Address, Address, QDistinct> distinctByStreet(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'street', caseSensitive: caseSensitive);
    });
  }
}

extension AddressQueryProperty
    on QueryBuilder<Address, Address, QQueryProperty> {
  QueryBuilder<Address, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Address, String?, QQueryOperations> addressIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addressId');
    });
  }

  QueryBuilder<Address, String, QQueryOperations> addressTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addressTitle');
    });
  }

  QueryBuilder<Address, String, QQueryOperations> areaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'area');
    });
  }

  QueryBuilder<Address, String?, QQueryOperations> districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'district');
    });
  }

  QueryBuilder<Address, String, QQueryOperations> doorNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doorNumber');
    });
  }

  QueryBuilder<Address, String?, QQueryOperations> landmarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'landmark');
    });
  }

  QueryBuilder<Address, String?, QQueryOperations> pincodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pincode');
    });
  }

  QueryBuilder<Address, String?, QQueryOperations> streetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'street');
    });
  }
}
