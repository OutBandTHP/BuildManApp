#encoding: utf-8
LANGUAGES = [
  ['English',   'en'],
  ["עברית",      'he']
]

I18n.default_locale = :en

I18n.available_locales = LANGUAGES.map {|lang| lang[1]}
