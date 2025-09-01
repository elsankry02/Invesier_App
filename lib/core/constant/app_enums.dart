enum ContactType { email, phone }

enum Language {
  english(name: "English ", flag: "🇺🇸", code: "en"),
  arabic(name: "العربية", flag: "🇸🇦", code: "ar");

  const Language({required this.name, required this.flag, required this.code});

  final String name;
  final String flag;
  final String code;
}
