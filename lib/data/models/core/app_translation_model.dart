class AppTranslationModel {
  late Map<String, String> _translation;

  AppTranslationModel({required Map<String,String> translation}){
    _translation=Map.fromEntries(translation.entries.map((e)=>MapEntry(e.key.toLowerCase(), e.value)));
  }

  String translate(final String word, [final List<String>? arguments]) {
    String result =
        _translation[word] ?? _translation[word.toLowerCase()] ?? word;
    if (arguments != null) {
      for (int i = 0; i < arguments.length; i++) {
        result = result.replaceFirst('[$i]', arguments[i]);
      }
    }
    return result;
  }

  factory AppTranslationModel.empty() => AppTranslationModel(
        translation: {'key': 'value'},
      );
}
