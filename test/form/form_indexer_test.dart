void main() {
  /*group('FormIndexer.', () {
    FormIndexer _indexer = new FormIndexer();

    setUp(() {
      _indexer.clear();
    });

    test('Registers a FormGroup into FormIndexer.', () async {
      FormGroup formGroup = new FormGroup(controls: {}, validators: []);
      formGroup.name = 'field1';
      _indexer.addControl(formGroup);

      expect(_indexer, isNotNull);
      expect(_indexer.containsKey(formGroup.uniqueName), isTrue);
      expect(_indexer[formGroup.uniqueName], isA<FormGroup>());
    });

    test('Registers and get a FormGroup from FormIndexer.', () async {
      FormGroup formGroup = new FormGroup(controls: {}, validators: []);
      formGroup.name = 'field1';
      _indexer.addControl(formGroup);

      FormGroup storedFormGroup = _indexer.ofFormGroup(formGroup.uniqueName);

      expect(storedFormGroup, isNotNull);
      expect(_indexer[formGroup.uniqueName], isA<FormGroup>());
      expect(_indexer[formGroup.uniqueName].name, 'field1');
    });

    test('Registers and removes a FormGroup from FormIndexer.', () async {
      FormGroup formGroup = new FormGroup(controls: {}, validators: []);
      formGroup.name = 'field1';
      _indexer.addControl(formGroup);
      _indexer.removeControl(formGroup);

      expect(_indexer.containsKey(formGroup.uniqueName), isFalse);
    });
  });*/
}
