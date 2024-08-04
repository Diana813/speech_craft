import 'dart:convert';

String countries = json.encode([
  {"name": "Afganistan", "code": "AF"},
  {"name": "Wyspy Alandzkie", "code": "AX"},
  {"name": "Albania", "code": "AL"},
  {"name": "Algieria", "code": "DZ"},
  {"name": "Samoa Amerykańskie", "code": "AS"},
  {"name": "Andora", "code": "AD"},
  {"name": "Angola", "code": "AO"},
  {"name": "Anguilla", "code": "AI"},
  {"name": "Antarktyda", "code": "AQ"},
  {"name": "Antigua i Barbuda", "code": "AG"},
  {"name": "Argentyna", "code": "AR"},
  {"name": "Armenia", "code": "AM"},
  {"name": "Aruba", "code": "AW"},
  {"name": "Australia", "code": "AU"},
  {"name": "Austria", "code": "AT"},
  {"name": "Azerbejdżan", "code": "AZ"},
  {"name": "Bahamy", "code": "BS"},
  {"name": "Bahrajn", "code": "BH"},
  {"name": "Bangladesz", "code": "BD"},
  {"name": "Barbados", "code": "BB"},
  {"name": "Białoruś", "code": "BY"},
  {"name": "Belgia", "code": "BE"},
  {"name": "Belize", "code": "BZ"},
  {"name": "Benin", "code": "BJ"},
  {"name": "Bermudy", "code": "BM"},
  {"name": "Bhutan", "code": "BT"},
  {"name": "Boliwia", "code": "BO"},
  {"name": "Bośnia i Hercegowina", "code": "BA"},
  {"name": "Botswana", "code": "BW"},
  {"name": "Wyspa Bouveta", "code": "BV"},
  {"name": "Brazylia", "code": "BR"},
  {"name": "Brytyjskie Terytorium Oceanu Indyjskiego", "code": "IO"},
  {"name": "Brunei Darussalam", "code": "BN"},
  {"name": "Bułgaria", "code": "BG"},
  {"name": "Burkina Faso", "code": "BF"},
  {"name": "Burundi", "code": "BI"},
  {"name": "Kambodża", "code": "KH"},
  {"name": "Kamerun", "code": "CM"},
  {"name": "Kanada", "code": "CA"},
  {"name": "Wyspy Zielonego Przylądka", "code": "CV"},
  {"name": "Kajmany", "code": "KY"},
  {"name": "Republika Środkowoafrykańska", "code": "CF"},
  {"name": "Czad", "code": "TD"},
  {"name": "Chile", "code": "CL"},
  {"name": "Chiny", "code": "CN"},
  {"name": "Wyspa Bożego Narodzenia", "code": "CX"},
  {"name": "Wyspy Kokosowe", "code": "CC"},
  {"name": "Kolumbia", "code": "CO"},
  {"name": "Komory", "code": "KM"},
  {"name": "Kongo", "code": "CG"},
  {"name": "Demokratyczna Republika Konga", "code": "CD"},
  {"name": "Wyspy Cooka", "code": "CK"},
  {"name": "Kostaryka", "code": "CR"},
  {"name": "Chorwacja", "code": "HR"},
  {"name": "Kuba", "code": "CU"},
  {"name": "Cypr", "code": "CY"},
  {"name": "Czechy", "code": "CZ"},
  {"name": "Dania", "code": "DK"},
  {"name": "Dżibuti", "code": "DJ"},
  {"name": "Dominika", "code": "DM"},
  {"name": "Dominikana", "code": "DO"},
  {"name": "Ekwador", "code": "EC"},
  {"name": "Egipt", "code": "EG"},
  {"name": "Salwador", "code": "SV"},
  {"name": "Gwinea Równikowa", "code": "GQ"},
  {"name": "Erytrea", "code": "ER"},
  {"name": "Estonia", "code": "EE"},
  {"name": "Etiopia", "code": "ET"},
  {"name": "Falklandy (Malwiny)", "code": "FK"},
  {"name": "Wyspy Owcze", "code": "FO"},
  {"name": "Fidżi", "code": "FJ"},
  {"name": "Finlandia", "code": "FI"},
  {"name": "Francja", "code": "FR"},
  {"name": "Gujana Francuska", "code": "GF"},
  {"name": "Polinezja Francuska", "code": "PF"},
  {"name": "Francuskie Terytoria Południowe", "code": "TF"},
  {"name": "Gabon", "code": "GA"},
  {"name": "Gambia", "code": "GM"},
  {"name": "Gruzja", "code": "GE"},
  {"name": "Niemcy", "code": "DE"},
  {"name": "Ghana", "code": "GH"},
  {"name": "Gibraltar", "code": "GI"},
  {"name": "Grecja", "code": "GR"},
  {"name": "Grenlandia", "code": "GL"},
  {"name": "Grenada", "code": "GD"},
  {"name": "Gwadelupa", "code": "GP"},
  {"name": "Guam", "code": "GU"},
  {"name": "Gwatemala", "code": "GT"},
  {"name": "Guernsey", "code": "GG"},
  {"name": "Gwinea", "code": "GN"},
  {"name": "Gwinea-Bissau", "code": "GW"},
  {"name": "Gujana", "code": "GY"},
  {"name": "Haiti", "code": "HT"},
  {"name": "Wyspy Heard i McDonalda", "code": "HM"},
  {"name": "Stolica Apostolska (Watykan)", "code": "VA"},
  {"name": "Honduras", "code": "HN"},
  {"name": "Hongkong", "code": "HK"},
  {"name": "Węgry", "code": "HU"},
  {"name": "Islandia", "code": "IS"},
  {"name": "Indie", "code": "IN"},
  {"name": "Indonezja", "code": "ID"},
  {"name": "Iran, Islamska Republika", "code": "IR"},
  {"name": "Irak", "code": "IQ"},
  {"name": "Irlandia", "code": "IE"},
  {"name": "Wyspa Man", "code": "IM"},
  {"name": "Izrael", "code": "IL"},
  {"name": "Włochy", "code": "IT"},
  {"name": "Jamajka", "code": "JM"},
  {"name": "Japonia", "code": "JP"},
  {"name": "Jersey", "code": "JE"},
  {"name": "Jordania", "code": "JO"},
  {"name": "Kazachstan", "code": "KZ"},
  {"name": "Kenia", "code": "KE"},
  {"name": "Kiribati", "code": "KI"},
  {"name": "Korea, Republika", "code": "KR"},
  {"name": "Kuwejt", "code": "KW"},
  {"name": "Kirgistan", "code": "KG"},
  {"name": "Łotwa", "code": "LV"},
  {"name": "Liban", "code": "LB"},
  {"name": "Lesotho", "code": "LS"},
  {"name": "Liberia", "code": "LR"},
  {"name": "Libijska Arabska Dżamahirija", "code": "LY"},
  {"name": "Liechtenstein", "code": "LI"},
  {"name": "Litwa", "code": "LT"},
  {"name": "Luksemburg", "code": "LU"},
  {"name": "Makau", "code": "MO"},
  {"name": "Macedonia Północna", "code": "MK"},
  {"name": "Madagaskar", "code": "MG"},
  {"name": "Malawi", "code": "MW"},
  {"name": "Malezja", "code": "MY"},
  {"name": "Malediwy", "code": "MV"},
  {"name": "Mali", "code": "ML"},
  {"name": "Malta", "code": "MT"},
  {"name": "Wyspy Marshalla", "code": "MH"},
  {"name": "Martynika", "code": "MQ"},
  {"name": "Mauretania", "code": "MR"},
  {"name": "Mauritius", "code": "MU"},
  {"name": "Majotta", "code": "YT"},
  {"name": "Meksyk", "code": "MX"},
  {"name": "Mikronezja, Sfederowane Stany", "code": "FM"},
  {"name": "Mołdawia, Republika", "code": "MD"},
  {"name": "Monako", "code": "MC"},
  {"name": "Mongolia", "code": "MN"},
  {"name": "Montserrat", "code": "MS"},
  {"name": "Maroko", "code": "MA"},
  {"name": "Mozambik", "code": "MZ"},
  {"name": "Mjanma", "code": "MM"},
  {"name": "Namibia", "code": "NA"},
  {"name": "Nauru", "code": "NR"},
  {"name": "Nepal", "code": "NP"},
  {"name": "Holandia", "code": "NL"},
  {"name": "Antyle Holenderskie", "code": "AN"},
  {"name": "Nowa Kaledonia", "code": "NC"},
  {"name": "Nowa Zelandia", "code": "NZ"},
  {"name": "Nikaragua", "code": "NI"},
  {"name": "Niger", "code": "NE"},
  {"name": "Nigeria", "code": "NG"},
  {"name": "Niue", "code": "NU"},
  {"name": "Wyspa Norfolk", "code": "NF"},
  {"name": "Mariany Północne", "code": "MP"},
  {"name": "Norwegia", "code": "NO"},
  {"name": "Oman", "code": "OM"},
  {"name": "Pakistan", "code": "PK"},
  {"name": "Palau", "code": "PW"},
  {"name": "Palestyna, Terytorium Okupowane", "code": "PS"},
  {"name": "Panama", "code": "PA"},
  {"name": "Papua-Nowa Gwinea", "code": "PG"},
  {"name": "Paragwaj", "code": "PY"},
  {"name": "Peru", "code": "PE"},
  {"name": "Filipiny", "code": "PH"},
  {"name": "Pitcairn", "code": "PN"},
  {"name": "Polska", "code": "PL"},
  {"name": "Portugalia", "code": "PT"},
  {"name": "Portoryko", "code": "PR"},
  {"name": "Katar", "code": "QA"},
  {"name": "Reunion", "code": "RE"},
  {"name": "Rumunia", "code": "RO"},
  {"name": "Federacja Rosyjska", "code": "RU"},
  {"name": "Rwanda", "code": "RW"},
  {"name": "Wyspa Świętej Heleny", "code": "SH"},
  {"name": "Saint Kitts i Nevis", "code": "KN"},
  {"name": "Saint Lucia", "code": "LC"},
  {"name": "Saint-Pierre i Miquelon", "code": "PM"},
  {"name": "Saint Vincent i Grenadyny", "code": "VC"},
  {"name": "Samoa", "code": "WS"},
  {"name": "San Marino", "code": "SM"},
  {"name": "Wyspy Świętego Tomasza i Książęca", "code": "ST"},
  {"name": "Arabia Saudyjska", "code": "SA"},
  {"name": "Senegal", "code": "SN"},
  {"name": "Serbia i Czarnogóra", "code": "CS"},
  {"name": "Seszele", "code": "SC"},
  {"name": "Sierra Leone", "code": "SL"},
  {"name": "Singapur", "code": "SG"},
  {"name": "Słowacja", "code": "SK"},
  {"name": "Słowenia", "code": "SI"},
  {"name": "Wyspy Salomona", "code": "SB"},
  {"name": "Somalia", "code": "SO"},
  {"name": "Republika Południowej Afryki", "code": "ZA"},
  {"name": "Georgia Południowa i Sandwich Południowy", "code": "GS"},
  {"name": "Hiszpania", "code": "ES"},
  {"name": "Sri Lanka", "code": "LK"},
  {"name": "Sudan", "code": "SD"},
  {"name": "Surinam", "code": "SR"},
  {"name": "Svalbard i Jan Mayen", "code": "SJ"},
  {"name": "Eswatini", "code": "SZ"},
  {"name": "Szwecja", "code": "SE"},
  {"name": "Szwajcaria", "code": "CH"},
  {"name": "Syryjska Republika Arabska", "code": "SY"},
  {"name": "Tajwan", "code": "TW"},
  {"name": "Tadżykistan", "code": "TJ"},
  {"name": "Tanzania, Zjednoczona Republika", "code": "TZ"},
  {"name": "Tajlandia", "code": "TH"},
  {"name": "Timor Wschodni", "code": "TL"},
  {"name": "Togo", "code": "TG"},
  {"name": "Tokelau", "code": "TK"},
  {"name": "Tonga", "code": "TO"},
  {"name": "Trynidad i Tobago", "code": "TT"},
  {"name": "Tunezja", "code": "TN"},
  {"name": "Turcja", "code": "TR"},
  {"name": "Turkmenistan", "code": "TM"},
  {"name": "Turks i Caicos", "code": "TC"},
  {"name": "Tuvalu", "code": "TV"},
  {"name": "Uganda", "code": "UG"},
  {"name": "Ukraina", "code": "UA"},
  {"name": "Zjednoczone Emiraty Arabskie", "code": "AE"},
  {"name": "Wielka Brytania", "code": "GB"},
  {"name": "Stany Zjednoczone", "code": "US"},
  {"name": "Dalekie Wyspy Mniejsze Stanów Zjednoczonych", "code": "UM"},
  {"name": "Urugwaj", "code": "UY"},
  {"name": "Uzbekistan", "code": "UZ"},
  {"name": "Vanuatu", "code": "VU"},
  {"name": "Wenezuela", "code": "VE"},
  {"name": "Wietnam", "code": "VN"},
  {"name": "Brytyjskie Wyspy Dziewicze", "code": "VG"},
  {"name": "Wyspy Dziewicze Stanów Zjednoczonych", "code": "VI"},
  {"name": "Wallis i Futuna", "code": "WF"},
  {"name": "Sahara Zachodnia", "code": "EH"},
  {"name": "Jemen", "code": "YE"},
  {"name": "Zambia", "code": "ZM"},
  {"name": "Zimbabwe", "code": "ZW"}
]);
