
abstract class BaseLocaleRepository {
  Future< bool> changeLocale({required String langCode});
  Future<String?> getSavedLang();
}
