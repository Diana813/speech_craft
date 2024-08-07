import 'dart:convert';

String languages = json.encode([
  {"code": "aa", "name": "Afar"},
  {"code": "ab", "name": "Abchaski"},
  {"code": "ae", "name": "Awestyjski"},
  {"code": "af", "name": "Afrykanerski"},
  {"code": "ak", "name": "Akan"},
  {"code": "am", "name": "Amharski"},
  {"code": "an", "name": "Aragoński"},
  {"code": "ar", "name": "Arabski"},
  {"code": "as", "name": "Asamski"},
  {"code": "av", "name": "Awareski"},
  {"code": "ay", "name": "Ajmara"},
  {"code": "az", "name": "Azerbejdżański"},
  {"code": "ba", "name": "Baszkiński"},
  {"code": "be", "name": "Białoruski"},
  {"code": "bg", "name": "Bułgarski"},
  {"code": "bh", "name": "Języki biharskie"},
  {"code": "bi", "name": "Bislama"},
  {"code": "bm", "name": "Bambara"},
  {"code": "bn", "name": "Bengalski"},
  {"code": "bo", "name": "Tybetański"},
  {"code": "br", "name": "Bretoński"},
  {"code": "bs", "name": "Bośniacki"},
  {"code": "ca", "name": "Kataloński; Walencjański"},
  {"code": "ce", "name": "Czeczeński"},
  {"code": "ch", "name": "Chamorro"},
  {"code": "co", "name": "Korsykański"},
  {"code": "cr", "name": "Cree"},
  {"code": "cs", "name": "Czeski"},
  {"code": "cv", "name": "Czuwaski"},
  {"code": "cy", "name": "Walijski"},
  {"code": "da", "name": "Duński"},
  {"code": "de", "name": "Niemiecki"},
  {"code": "dv", "name": "Divehi"},
  {"code": "dz", "name": "Dzongkha"},
  {"code": "ee", "name": "Ewe"},
  {"code": "el", "name": "Grecki"},
  {"code": "en", "name": "Angielski"},
  {"code": "eo", "name": "Esperanto"},
  {"code": "es", "name": "Hiszpański"},
  {"code": "et", "name": "Estoński"},
  {"code": "eu", "name": "Baskijski"},
  {"code": "fa", "name": "Perski"},
  {"code": "ff", "name": "Fula"},
  {"code": "fi", "name": "Fiński"},
  {"code": "fj", "name": "Fidżyjski"},
  {"code": "fo", "name": "Faroeski"},
  {"code": "fr", "name": "Francuski"},
  {"code": "fy", "name": "Fryzyjski zachodni"},
  {"code": "ga", "name": "Irlandzki"},
  {"code": "gd", "name": "Szkocki gaelicki"},
  {"code": "gl", "name": "Galicyjski"},
  {"code": "gn", "name": "Guarani"},
  {"code": "gu", "name": "Gudżarati"},
  {"code": "gv", "name": "Manx"},
  {"code": "ha", "name": "Hausa"},
  {"code": "he", "name": "Hebrajski"},
  {"code": "hi", "name": "Hindi"},
  {"code": "ho", "name": "Hiri Motu"},
  {"code": "hr", "name": "Chorwacki"},
  {"code": "ht", "name": "Haitański"},
  {"code": "hu", "name": "Węgierski"},
  {"code": "hy", "name": "Ormiański"},
  {"code": "hz", "name": "Herero"},
  {"code": "id", "name": "Indonezyjski"},
  {"code": "ig", "name": "Igbo"},
  {"code": "ii", "name": "Syczuan Yi"},
  {"code": "ik", "name": "Inupiat"},
  {"code": "io", "name": "Ido"},
  {"code": "is", "name": "Islandzki"},
  {"code": "it", "name": "Włoski"},
  {"code": "iu", "name": "Inuktitut"},
  {"code": "ja", "name": "Japoński"},
  {"code": "jv", "name": "Jawajski"},
  {"code": "ka", "name": "Gruziński"},
  {"code": "kg", "name": "Kongo"},
  {"code": "ki", "name": "Kikuyu"},
  {"code": "kj", "name": "Kuanyama"},
  {"code": "kk", "name": "Kazachski"},
  {"code": "kl", "name": "Grenlandzki"},
  {"code": "km", "name": "Centralny Khmer"},
  {"code": "kn", "name": "Kannada"},
  {"code": "ko", "name": "Koreański"},
  {"code": "kr", "name": "Kanuri"},
  {"code": "ks", "name": "Kaszmirski"},
  {"code": "ku", "name": "Kurdyjski"},
  {"code": "kv", "name": "Komi"},
  {"code": "kw", "name": "Cornish"},
  {"code": "ky", "name": "Kirgiski"},
  {"code": "la", "name": "Łaciński"},
  {"code": "lb", "name": "Luksemburski"},
  {"code": "lg", "name": "Ganda"},
  {"code": "li", "name": "Limburgski"},
  {"code": "ln", "name": "Lingala"},
  {"code": "lo", "name": "Lao"},
  {"code": "lt", "name": "Litewski"},
  {"code": "lu", "name": "Luba-Katanga"},
  {"code": "lv", "name": "Łotewski"},
  {"code": "mg", "name": "Malagasy"},
  {"code": "mh", "name": "Marszalski"},
  {"code": "mi", "name": "Maoryjski"},
  {"code": "mk", "name": "Macedoński"},
  {"code": "ml", "name": "Malajalam"},
  {"code": "mn", "name": "Mongolski"},
  {"code": "mr", "name": "Marathi"},
  {"code": "ms", "name": "Malajski"},
  {"code": "mt", "name": "Maltański"},
  {"code": "my", "name": "Birmański"},
  {"code": "na", "name": "Nauruański"},
  {"code": "nb", "name": "Norweski Bokmål"},
  {"code": "nd", "name": "Ndebele, północny"},
  {"code": "ne", "name": "Nepalski"},
  {"code": "ng", "name": "Ndonga"},
  {"code": "nl", "name": "Holenderski"},
  {"code": "nn", "name": "Norweski Nynorsk"},
  {"code": "no", "name": "Norweski"},
  {"code": "nr", "name": "Ndebele, południowy"},
  {"code": "nv", "name": "Navajo; Navaho"},
  {"code": "ny", "name": "Chichewa; Chewa; Nyanja"},
  {"code": "oc", "name": "Oksytański"},
  {"code": "oj", "name": "Odżibwejski"},
  {"code": "om", "name": "Oromo"},
  {"code": "or", "name": "Oriya"},
  {"code": "os", "name": "Osetyński"},
  {"code": "pa", "name": "Pendżabski"},
  {"code": "pi", "name": "Pali"},
  {"code": "pl", "name": "Polski"},
  {"code": "ps", "name": "Paszto"},
  {"code": "pt", "name": "Portugalski"},
  {"code": "qu", "name": "Keczua"},
  {"code": "rm", "name": "Retoromański"},
  {"code": "rn", "name": "Rundi"},
  {"code": "ro", "name": "Rumuński"},
  {"code": "ru", "name": "Rosyjski"},
  {"code": "rw", "name": "Kinyarwanda"},
  {"code": "sa", "name": "Sanskryt"},
  {"code": "sc", "name": "Sardyński"},
  {"code": "sd", "name": "Sindhi"},
  {"code": "se", "name": "Sami północny"},
  {"code": "sg", "name": "Sango"},
  {"code": "si", "name": "Sinhałski"},
  {"code": "sk", "name": "Słowacki"},
  {"code": "sl", "name": "Słoweński"},
  {"code": "sm", "name": "Samoański"},
  {"code": "sn", "name": "Shona"},
  {"code": "so", "name": "Somalijski"},
  {"code": "sq", "name": "Albański"},
  {"code": "sr", "name": "Serbski"},
  {"code": "ss", "name": "Swati"},
  {"code": "st", "name": "Sotho, południowy"},
  {"code": "su", "name": "Sundajski"},
  {"code": "sv", "name": "Szwedzki"},
  {"code": "sw", "name": "Suahili"},
  {"code": "ta", "name": "Tamilski"},
  {"code": "te", "name": "Telugu"},
  {"code": "tg", "name": "Tadżycki"},
  {"code": "th", "name": "Tajski"},
  {"code": "ti", "name": "Tigrinia"},
  {"code": "tk", "name": "Turkmeński"},
  {"code": "tl", "name": "Tagalog"},
  {"code": "tn", "name": "Tswana"},
  {"code": "to", "name": "Tonga (Wyspy Tonga)"},
  {"code": "tr", "name": "Turecki"},
  {"code": "ts", "name": "Tsonga"},
  {"code": "tt", "name": "Tatar"},
  {"code": "tw", "name": "Twi"},
  {"code": "ty", "name": "Tahitiański"},
  {"code": "ug", "name": "Ujgur"},
  {"code": "uk", "name": "Ukraiński"},
  {"code": "ur", "name": "Urdu"},
  {"code": "uz", "name": "Uzbecki"},
  {"code": "ve", "name": "Venda"},
  {"code": "vi", "name": "Wietnamski"},
  {"code": "vo", "name": "Volapük"},
  {"code": "wa", "name": "Walloński"},
  {"code": "wo", "name": "Wolof"},
  {"code": "xh", "name": "Xhosa"},
  {"code": "yi", "name": "Jidysz"},
  {"code": "yo", "name": "Joruba"},
  {"code": "za", "name": "Zhuang; Chuang"},
  {"code": "zh", "name": "Chiński"},
  {"code": "zu", "name": "Zulu"}
]);
