import 'package:drift/drift.dart';
import 'package:skeeper/src/core/components/database/database.dart';
import 'package:skeeper/src/core/components/database/src/tables/todos_table.dart';

part 'app_database.g.dart';

/// The drift-managed database configuration
@DriftDatabase(tables: [TodosTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? createExecutor());

  @override
  int get schemaVersion => 1;
}
