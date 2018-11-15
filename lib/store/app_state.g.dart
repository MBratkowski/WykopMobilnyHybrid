// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entitiesState',
      serializers.serialize(object.entitiesState,
          specifiedType: const FullType(EntitiesState)),
      'mikroblogState',
      serializers.serialize(object.mikroblogState,
          specifiedType: const FullType(MikroblogState)),
      'entryScreensState',
      serializers.serialize(object.entryScreensState,
          specifiedType: const FullType(EntryScreensState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entitiesState':
          result.entitiesState.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntitiesState)) as EntitiesState);
          break;
        case 'mikroblogState':
          result.mikroblogState.replace(serializers.deserialize(value,
              specifiedType: const FullType(MikroblogState)) as MikroblogState);
          break;
        case 'entryScreensState':
          result.entryScreensState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(EntryScreensState))
              as EntryScreensState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final EntitiesState entitiesState;
  @override
  final MikroblogState mikroblogState;
  @override
  final EntryScreensState entryScreensState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.entitiesState, this.mikroblogState, this.entryScreensState})
      : super._() {
    if (entitiesState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entitiesState');
    }
    if (mikroblogState == null) {
      throw new BuiltValueNullFieldError('AppState', 'mikroblogState');
    }
    if (entryScreensState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entryScreensState');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        entitiesState == other.entitiesState &&
        mikroblogState == other.mikroblogState &&
        entryScreensState == other.entryScreensState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, entitiesState.hashCode), mikroblogState.hashCode),
        entryScreensState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('entitiesState', entitiesState)
          ..add('mikroblogState', mikroblogState)
          ..add('entryScreensState', entryScreensState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  EntitiesStateBuilder _entitiesState;
  EntitiesStateBuilder get entitiesState =>
      _$this._entitiesState ??= new EntitiesStateBuilder();
  set entitiesState(EntitiesStateBuilder entitiesState) =>
      _$this._entitiesState = entitiesState;

  MikroblogStateBuilder _mikroblogState;
  MikroblogStateBuilder get mikroblogState =>
      _$this._mikroblogState ??= new MikroblogStateBuilder();
  set mikroblogState(MikroblogStateBuilder mikroblogState) =>
      _$this._mikroblogState = mikroblogState;

  EntryScreensStateBuilder _entryScreensState;
  EntryScreensStateBuilder get entryScreensState =>
      _$this._entryScreensState ??= new EntryScreensStateBuilder();
  set entryScreensState(EntryScreensStateBuilder entryScreensState) =>
      _$this._entryScreensState = entryScreensState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _entitiesState = _$v.entitiesState?.toBuilder();
      _mikroblogState = _$v.mikroblogState?.toBuilder();
      _entryScreensState = _$v.entryScreensState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              entitiesState: entitiesState.build(),
              mikroblogState: mikroblogState.build(),
              entryScreensState: entryScreensState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entitiesState';
        entitiesState.build();
        _$failedField = 'mikroblogState';
        mikroblogState.build();
        _$failedField = 'entryScreensState';
        entryScreensState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
