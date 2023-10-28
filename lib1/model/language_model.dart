class LanguageModel {
  final String flag;
  final String name;
  final String languageCode;

  LanguageModel(
    this.flag,
    this.name,
    this.languageCode,
  );

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      // LanguageModel("🇺🇸", "English", 'en'),
      LanguageModel("Hi! I'am manaqa ", "English", 'en'),
      LanguageModel("Hola soy manaqa", "Española", 'es'),
    ];
  }
}
