class RowElementInfo {
  final int columnSpan;
  final Object? id;

  const RowElementInfo({
    this.id,
    this.columnSpan = 1,
  });

  RowElementInfo copyWith({
    int? columnSpan,
    Object? id,
  }) {
    return RowElementInfo(
      columnSpan: columnSpan ?? this.columnSpan,
      id: id ?? this.id,
    );
  }
}
