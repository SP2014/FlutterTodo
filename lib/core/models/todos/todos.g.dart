// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Todos> _$todosSerializer = new _$TodosSerializer();

class _$TodosSerializer implements StructuredSerializer<Todos> {
  @override
  final Iterable<Type> types = const [Todos, _$Todos];
  @override
  final String wireName = 'Todos';

  @override
  Iterable<Object> serialize(Serializers serializers, Todos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'task',
      serializers.serialize(object.task, specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(String)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Todos deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodosBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'task':
          result.task = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Todos extends Todos {
  @override
  final int id;
  @override
  final String task;
  @override
  final String category;
  @override
  final String timestamp;

  factory _$Todos([void Function(TodosBuilder) updates]) =>
      (new TodosBuilder()..update(updates)).build();

  _$Todos._({this.id, this.task, this.category, this.timestamp}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Todos', 'id');
    }
    if (task == null) {
      throw new BuiltValueNullFieldError('Todos', 'task');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('Todos', 'category');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('Todos', 'timestamp');
    }
  }

  @override
  Todos rebuild(void Function(TodosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodosBuilder toBuilder() => new TodosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todos &&
        id == other.id &&
        task == other.task &&
        category == other.category &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), task.hashCode), category.hashCode),
        timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Todos')
          ..add('id', id)
          ..add('task', task)
          ..add('category', category)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class TodosBuilder implements Builder<Todos, TodosBuilder> {
  _$Todos _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _task;
  String get task => _$this._task;
  set task(String task) => _$this._task = task;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _timestamp;
  String get timestamp => _$this._timestamp;
  set timestamp(String timestamp) => _$this._timestamp = timestamp;

  TodosBuilder();

  TodosBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _task = _$v.task;
      _category = _$v.category;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Todos other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Todos;
  }

  @override
  void update(void Function(TodosBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Todos build() {
    final _$result = _$v ??
        new _$Todos._(
            id: id, task: task, category: category, timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
