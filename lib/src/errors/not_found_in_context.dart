class EzNotFoundInContext implements Exception {
  @override
  String toString() {
    return 'EzI18n was not found in the context. Make sure that EzI18n is properly set up in your MaterialApp.';
  }
}
