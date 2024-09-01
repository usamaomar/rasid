import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    '0clu3f3s': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    '3nyeilc6': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'z2lz0ejh': {
      'en': 'Login',
      'ar': 'دخول',
    },
    'v4vpo7sv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'kv0bx0iw': {
      'en': '',
      'ar': '',
    },
    'mw3rdj88': {
      'en': '',
      'ar': '',
    },
    'gehqz8e1': {
      'en': '',
      'ar': '',
    },
    '1fjqyq9i': {
      'en': '',
      'ar': '',
    },
    'qyig5eky': {
      'en': '',
      'ar': '',
    },
    'xnxl02h3': {
      'en': '',
      'ar': '',
    },
    'mv933viz': {
      'en': '',
      'ar': '',
    },
    'nri8scur': {
      'en': '',
      'ar': '',
    },
    'k7b1omsk': {
      'en': '',
      'ar': '',
    },
    '3fq24cot': {
      'en': '',
      'ar': '',
    },
    'urvatoma': {
      'en': '',
      'ar': '',
    },
    '68t6h9c2': {
      'en': '',
      'ar': '',
    },
    'oqly4oqk': {
      'en': '',
      'ar': '',
    },
    'arfqdwbs': {
      'en': '',
      'ar': '',
    },
    '2ztn87ap': {
      'en': '',
      'ar': '',
    },
    '3jv4ugn0': {
      'en': '',
      'ar': '',
    },
    'rknz5y52': {
      'en': '',
      'ar': '',
    },
    'ce9owiw6': {
      'en': '',
      'ar': '',
    },
    'hb0ws32h': {
      'en': '',
      'ar': '',
    },
    'egxtaem0': {
      'en': '',
      'ar': '',
    },
    'xs0e42si': {
      'en': '',
      'ar': '',
    },
    'zql61k2m': {
      'en': '',
      'ar': '',
    },
    '8k9bnxbb': {
      'en': '',
      'ar': '',
    },
    'h1j8ofuq': {
      'en': '',
      'ar': '',
    },
    '4zlcvspq': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
