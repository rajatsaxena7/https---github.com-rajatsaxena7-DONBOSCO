import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'it'];

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
    String? itText = '',
  }) =>
      [enText, itText][languageIndex] ?? '';

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
  // loginpage
  {
    '9du06q87': {
      'en': 'Login ',
      'it': 'Login',
    },
    '9sob20vo': {
      'en': 'Email',
      'it': 'E-mail',
    },
    'oymdpiiq': {
      'en': 'Password',
      'it': 'Parola d\'ordine',
    },
    'k4i33vw5': {
      'en': 'Forget password?',
      'it': 'Dimenticare la password?',
    },
    '3ighptnk': {
      'en': 'Log in',
      'it': 'Login',
    },
    'ctkk2viw': {
      'en': 'or',
      'it': 'O',
    },
    '5hz3i980': {
      'en': '',
      'it': 'Google',
    },
    'l0i8pc73': {
      'en': 'or',
      'it': 'O',
    },
    'yevz4azd': {
      'en': 'Guest user login',
      'it': 'Accesso utente ospite',
    },
    'gdq4knlp': {
      'en': 'Don\'t have a account?',
      'it': 'Non hai un account?',
    },
    'jdvp5mpb': {
      'en': 'Sign up',
      'it': 'Iscrizione',
    },
    'ktxx9jga': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // signuppage
  {
    'tz02o1l1': {
      'en': 'Sign up ',
      'it': 'Iscrizione',
    },
    '3wilxxz3': {
      'en': 'Name',
      'it': 'Nome',
    },
    '2hyuip5s': {
      'en': 'Email',
      'it': 'E-mail',
    },
    '7wwvq6py': {
      'en': 'Phone number',
      'it': 'Numero di telefono',
    },
    '84jttqg1': {
      'en': 'Password',
      'it': 'Parola d\'ordine',
    },
    'v884g4m8': {
      'en': 'I Accept the terms and conditions',
      'it': 'Accetto i Termini e le Condizioni',
    },
    'fys3rid9': {
      'en': 'Create account',
      'it': 'Creare un account',
    },
    '6fod9uj3': {
      'en': 'Already have an account',
      'it': 'Hai già un account',
    },
    'fux6pnjp': {
      'en': 'Log in',
      'it': 'Login',
    },
    'fo62wcel': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // landingpage
  {
    'ke1fllgl': {
      'en': 'Donate By Categories',
      'it': 'Dona per categorie',
    },
    'sd29qnwb': {
      'en': 'Active Campaigns',
      'it': 'Campagne attive',
    },
    'egwuq5t6': {
      'en': 'View all',
      'it': 'Mostra tutto',
    },
    '0pmw2n4e': {
      'en': 'Donation starts with ',
      'it': 'La donazione inizia con',
    },
    'l0wt4txw': {
      'en': 'Goal Amount:',
      'it': 'Importo obiettivo:',
    },
    'bzvjw2in': {
      'en': 'Donations:',
      'it': 'Donazioni:',
    },
    'unk8i2zk': {
      'en': 'Donate Now',
      'it': 'Donate adesso',
    },
    '90iajrp8': {
      'en': 'Report Issues',
      'it': 'Segnala problemi',
    },
    'pnva4g0h': {
      'en': 'Send a Report',
      'it': 'Invia una segnalazione',
    },
    '1ny3bna6': {
      'en': 'Invite Friends',
      'it': 'Invita gli amici',
    },
    '5thu3y62': {
      'en': 'join the fight together',
      'it': 'uniamoci alla lotta insieme',
    },
    '7ov1di5i': {
      'en': 'Share',
      'it': 'Condividere',
    },
    'fi6cy4ka': {
      'en': 'Don Bosco Charity App',
      'it': 'App Carità Don Bosco',
    },
    '184ke4vm': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // settings
  {
    '9fps4dlv': {
      'en': 'Settings',
      'it': 'Impostazioni',
    },
    'ozhtjqbz': {
      'en': 'Edit Profile',
      'it': 'Modifica Profilo',
    },
    '3c6khui5': {
      'en': 'Change your account details',
      'it': 'Modifica i dettagli del tuo account',
    },
    'xn48v1dt': {
      'en': 'My Donations',
      'it': 'Le mie donazioni',
    },
    'exxdpk7p': {
      'en': 'Check my Donations',
      'it': 'Controlla le mie donazioni',
    },
    '665lr3hc': {
      'en': 'App language',
      'it': 'Lingua dell\'app',
    },
    'jdao38wm': {
      'en': 'Choose Language',
      'it': 'Scegli la lingua',
    },
    'mip8g0hy': {
      'en': 'Privacy Policy',
      'it': 'politica sulla riservatezza',
    },
    'hphfifn0': {
      'en': 'Check our privacy policy',
      'it': 'Controlla la nostra politica sulla privacy',
    },
    'ehbtnkqs': {
      'en': 'Raise an Issue',
      'it': 'Sollevare una questione',
    },
    'kkpe1aqf': {
      'en': 'Got any problem? email us',
      'it': 'Hai qualche problema? Mandaci una email',
    },
    'bwmffl53': {
      'en': 'Logout',
      'it': 'Disconnettersi',
    },
    'olt1qo52': {
      'en': 'Delete User',
      'it': 'Elimina utente',
    },
    'gcqv4c4r': {
      'en': 'Settings',
      'it': 'Impostazioni',
    },
  },
  // donate
  {
    '0v4ggcpl': {
      'en': 'Ongoing Crises',
      'it': 'Crisi continue',
    },
    'em7ionyp': {
      'en': 'Goal',
      'it': 'Obiettivo',
    },
    'x9uirgf9': {
      'en': 'Donate Now',
      'it': 'Donate adesso',
    },
    '3aszye7o': {
      'en': 'Urgent Attention',
      'it': 'Attenzione urgente',
    },
    'daga24kt': {
      'en': 'Urgent help is required on these crises',
      'it': 'In queste crisi è necessario un aiuto urgente',
    },
    's3prnv9p': {
      'en': 'Goal',
      'it': 'Obiettivo',
    },
    'z4e1y7pw': {
      'en': 'Donate Now',
      'it': 'Donate adesso',
    },
    '8qa989ia': {
      'en': 'Invite Friends',
      'it': 'Invita gli amici',
    },
    'c38gxmgq': {
      'en': 'join the fight together',
      'it': 'uniamoci alla lotta insieme',
    },
    '1q1mrnw5': {
      'en': 'Share',
      'it': 'Condividere',
    },
    'ptlohkz2': {
      'en': 'Donate Now',
      'it': 'Donate adesso',
    },
    'yc556x61': {
      'en': 'Donate',
      'it': 'Donare',
    },
  },
  // campaigndetails
  {
    'y22gebc7': {
      'en': 'Info',
      'it': 'Informazioni',
    },
    'opwc77rp': {
      'en': 'Goal Amount:',
      'it': 'Importo obiettivo:',
    },
    'b2eg20ao': {
      'en': 'Campaign Dates:  ',
      'it': 'Date della campagna:',
    },
    'f6caar3q': {
      'en': '  to  ',
      'it': 'A',
    },
    '6v4z0jdt': {
      'en': 'Description',
      'it': 'Descrizione',
    },
    '3xnk8xi8': {
      'en': 'Gallery',
      'it': 'Galleria',
    },
    'lmfkajr4': {
      'en': 'Donate Now',
      'it': 'Donate adesso',
    },
    '681eq13t': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // paymentpage
  {
    '4ilyyhg7': {
      'en': 'Complete Payment',
      'it': 'Pagamento completo',
    },
    'vwqy0tmc': {
      'en': 'Pay Custom Amount',
      'it': 'Paga un importo personalizzato',
    },
    'zuqywowt': {
      'en': 'Enter Amount',
      'it': 'Inserire l\'importo',
    },
    'o3nw808s': {
      'en': '20',
      'it': '20',
    },
    'p1tgecer': {
      'en': '50',
      'it': '50',
    },
    'ko85z5p5': {
      'en': '100',
      'it': '100',
    },
    '965b9aih': {
      'en': '200',
      'it': '200',
    },
    'zogi7zc5': {
      'en': '500',
      'it': '500',
    },
    '040lefwx': {
      'en': '1000',
      'it': '1000',
    },
    'ssa84exn': {
      'en': 'OR',
      'it': 'O',
    },
    'vksgekrr': {
      'en': 'Pay as anonymous',
      'it': 'Paga come anonimo',
    },
    '126dr0r3': {
      'en': 'Donate',
      'it': 'Donare',
    },
    'wugd0rc2': {
      'en': 'Button',
      'it': '',
    },
    '45a3dllb': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // myaccount
  {
    '9trh8abo': {
      'en': 'Change Picture',
      'it': 'Cambia immagine',
    },
    'lg6hj8ok': {
      'en': 'Information',
      'it': 'Informazione',
    },
    'iukm4nqh': {
      'en': 'Name',
      'it': 'Nome',
    },
    '12otp1mj': {
      'en': 'Change your name',
      'it': 'Cambia il tuo nome',
    },
    'ihutba12': {
      'en': 'Email',
      'it': 'E-mail',
    },
    'dwtqj67y': {
      'en': 'Change your Email',
      'it': 'Cambia la tua e-mail',
    },
    'i8gkbqf9': {
      'en': 'Phone Number',
      'it': 'Numero di telefono',
    },
    'su9lemwr': {
      'en': 'Change your Phone Number',
      'it': 'Cambia il tuo numero di telefono',
    },
    '95qhqokf': {
      'en': 'Update ',
      'it': 'Aggiornamento',
    },
    '8cu73kjq': {
      'en': 'Edit Account',
      'it': 'Modifica account',
    },
    'mjq0wuhp': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // privacy_policy
  {
    'oshb8vl1': {
      'en':
          'Privacy Policy dell\'App Don Bosco 2000\n\n*1. Informazioni raccolte*\n\nRaccogliamo le seguenti informazioni personali dai nostri utenti:\n\n- Nome\n- Indirizzo email\n- Informazioni di contatto\n- Altre informazioni personali necessarie per le donazioni\n\n*2. Scopo della raccolta*\n\nRaccogliamo queste informazioni per le seguenti finalità:\n\n- Gestire le donazioni in base alle campagne\n- Comunicare con gli utenti\n- Fornire supporto e assistenza\n\n*3. Condivisione di informazioni*\n\nNon condividiamo le informazioni personali degli utenti con terze parti, ad eccezione dei partner di pagamento per elaborare le donazioni.\n\n*4. Sicurezza dei dati*\n\nAdottiamo misure di sicurezza per proteggere le informazioni personali degli utenti. Tuttavia, non possiamo garantire la sicurezza assoluta dei dati online.\n\n*5. Cookies*\n\nUtilizziamo i cookies per migliorare l\'esperienza dell\'utente. Gli utenti possono gestire le impostazioni dei cookies nel proprio browser.\n\n*6. Modifiche alla privacy policy*\n\nCi riserviamo il diritto di apportare modifiche alla nostra privacy policy. Le modifiche saranno pubblicate sull\'applicazione.\n\n*7. Contattaci*\n\nSe hai domande sulla nostra privacy policy, contattaci all\'indirizzo email m.marfoq@donbosco2000.org ',
      'it':
          'Privacy Policy dell\'App Don Bosco 2000\n\n*1. Informazioni raccolte*\n\nRaccogliamo le seguenti informazioni personali dai nostri utenti:\n\n- Nome\n- Indirizzo email\n- Informazioni di contatto\n- Altre informazioni personali necessarie per le donazioni\n\n*2. Scopo della raccolta*\n\nRaccogliamo queste informazioni per le seguenti finalità:\n\n- Gestire le donazioni in base alle campagne\n- Comunicare con gli utenti\n- Fornire supporto e assistenza\n\n*3. Condizione di informazione*\n\nNon condividiamo le informazioni personali degli utenti con terze parti, ad eccezione dei partner di pagamento per elaborare le donazioni.\n\n*4. Sicurezza dei dati*\n\nAdottiamo misure di sicurezza per proteggere le informazioni personali degli utenti. Tuttavia, non possiamo garantire la sicurezza assoluta dei dati online.\n\n*5. Biscotti*\n\nUtilizziamo i cookie per migliorare l\'esperienza dell\'utente. Gli utenti possono gestire le impostazioni dei cookie nel proprio browser.\n\n*6. Modifica alla privacy policy*\n\nCi riserviamo il diritto di apportare modifiche alla nostra privacy policy. Le modifiche saranno pubblicate sull\'applicazione.\n\n*7. Contattaci*\n\nSe hai domande sulla nostra politica sulla privacy, contattaci all\'indirizzo email m.marfoq@donbosco2000.org',
    },
    'j72z55nz': {
      'en': 'Privacy Policy',
      'it': 'politica sulla riservatezza',
    },
    'f6r26iyj': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // raiseissue
  {
    'wchy0t8a': {
      'en': 'Raise an issue',
      'it': 'Sollevare una questione',
    },
    '4bq0y13c': {
      'en': 'Raise an request',
      'it': 'Solleva una richiesta',
    },
    'e84unxxc': {
      'en': 'Submit',
      'it': 'Invia',
    },
    'dri6jzwl': {
      'en': 'Raise an issue',
      'it': 'Sollevare una questione',
    },
    'xwsz5dni': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // mydonations
  {
    'h4pktmyw': {
      'en': 'My donations',
      'it': 'Le mie donazioni',
    },
    'hrmnha4k': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // categories
  {
    'zcye6qm6': {
      'en': 'Categories',
      'it': 'Categorie',
    },
    '0iu26z33': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // phone_number_verify
  {
    '3t3e9fml': {
      'en': ' Phone Verification',
      'it': 'Verifica telefonica',
    },
    'i4ancsp7': {
      'en': '+39',
      'it': '+39',
    },
    '3g2auo0w': {
      'en': '+91',
      'it': '+91',
    },
    '4uzzjvr5': {
      'en': '+1',
      'it': '+1',
    },
    'l5c5gjgt': {
      'en': 'Code',
      'it': 'Codice',
    },
    'zn1m4zql': {
      'en': 'Search for an item...',
      'it': 'Cerca un articolo...',
    },
    '10v48376': {
      'en': 'Enter Phone Number',
      'it': 'Inserisci il numero di telefono',
    },
    'n5p596ho': {
      'en': 'click to get OTP',
      'it': 'fare clic per ottenere l\'OTP',
    },
    '4bxmj30d': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // phone
  {
    'xzg13c3h': {
      'en': 'This code helps keep your account safe and secure.',
      'it': 'Questo codice aiuta a mantenere il tuo account sicuro e protetto.',
    },
    'hu1f562q': {
      'en': 'Resend Otp',
      'it': 'Invia nuovamente OT',
    },
    'ohuz8uo3': {
      'en': 'Verify',
      'it': 'Verificare',
    },
    'i3hgq76f': {
      'en': 'Confirm your Code',
      'it': 'Conferma il tuo codice',
    },
    'bgi8yqhi': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // search
  {
    'by25bupk': {
      'en': 'Search',
      'it': 'Ricerca',
    },
    'eow1tglk': {
      'en': 'Search Campaigns according to you',
      'it': 'Cerca campagne secondo te',
    },
    'e4tzkxac': {
      'en': 'Search all Campaigns',
      'it': 'Cerca in tutte le campagne',
    },
    '8h5kgqtb': {
      'en': 'Option 1',
      'it': 'opzione 1',
    },
    '09esd5n0': {
      'en': 'Results',
      'it': 'Risultati',
    },
    '92lcvvwu': {
      'en': 'Read Now',
      'it': 'Leggi ora',
    },
    'bsoy1t6o': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'it':
          'HSBC sta tornando al credito al consumo negli Stati Uniti secondo...',
    },
    'w28kniu0': {
      'en': 'Jackson Hewiit',
      'it': 'Jackson Hewiit',
    },
    'v1yw7lxm': {
      'en': '24',
      'it': '24',
    },
    'ph6oemw5': {
      'en': '12h',
      'it': '12h',
    },
    'g1e26xmk': {
      'en': 'Read Now',
      'it': 'Leggi ora',
    },
    'u3i0t2ev': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'it':
          'HSBC sta tornando al credito al consumo negli Stati Uniti secondo...',
    },
    'r7vc6j2a': {
      'en': 'Jackson Hewiit',
      'it': 'Jackson Hewiit',
    },
    '6y1lun4y': {
      'en': '24',
      'it': '24',
    },
    'ny3icpfk': {
      'en': '12h',
      'it': '12h',
    },
    'g13fulnm': {
      'en': 'Read Now',
      'it': 'Leggi ora',
    },
    'qhxaie2u': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'it':
          'HSBC sta tornando al credito al consumo negli Stati Uniti secondo...',
    },
    'rkudb04a': {
      'en': 'Jackson Hewiit',
      'it': 'Jackson Hewiit',
    },
    '2bnt6553': {
      'en': '24',
      'it': '24',
    },
    '5mi79yu4': {
      'en': '12h',
      'it': '12h',
    },
    'eisleceb': {
      'en': 'Read Now',
      'it': 'Leggi ora',
    },
    'xfgqffzt': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // deleteaccount
  {
    'c6bs24sd': {
      'en': 'Username/email',
      'it': 'Nome utente/e-mail',
    },
    'g7bdyfg1': {
      'en': 'Password',
      'it': 'Parola d\'ordine',
    },
    'v6p5ik0s': {
      'en': 'Why you want to delete?',
      'it': 'Perché vuoi eliminare?',
    },
    'kv2tjs62': {
      'en': 'Delete',
      'it': 'Eliminare',
    },
    'z3w4ldmq': {
      'en': 'delete account',
      'it': 'eliminare l\'account',
    },
    'twbbmuir': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // onboarding
  {
    'o9absggt': {
      'en': 'Donate For a Change',
      'it': 'Dona per un cambiamento',
    },
    '7bfg9a4j': {
      'en': 'Donate for a better world .',
      'it': 'Dona per un mondo migliore.',
    },
    '29ujlg2o': {
      'en': 'Connect with Causes You Care About',
      'it': 'Connettiti con le cause che ti stanno a cuore',
    },
    'fehuo48w': {
      'en': 'Start Making a Difference Today',
      'it': 'Inizia a fare la differenza oggi stesso',
    },
    'a0wqa4h3': {
      'en': 'Login',
      'it': 'Login',
    },
    'jotcs51v': {
      'en': 'Register',
      'it': 'Registrati',
    },
    'p57qt8mh': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // loginpageCopy
  {
    '5exrprcw': {
      'en': 'Login ',
      'it': 'Login',
    },
    '0rcmuut2': {
      'en': 'Email',
      'it': 'E-mail',
    },
    'm68kud6f': {
      'en': 'Password',
      'it': 'Parola d\'ordine',
    },
    'n6wndu6b': {
      'en': 'Forget password?',
      'it': 'Dimenticare la password?',
    },
    'hw8s96ls': {
      'en': 'Log in',
      'it': 'Login',
    },
    'am7wt67x': {
      'en': 'Don\'t have a account?',
      'it': 'Non hai un account?',
    },
    '91dzfzjo': {
      'en': 'Sign up',
      'it': 'Iscrizione',
    },
    'o5v76wu2': {
      'en': 'or',
      'it': 'O',
    },
    'svdl64wy': {
      'en': '',
      'it': 'Google',
    },
    'sduh5qqa': {
      'en': '',
      'it': 'Google',
    },
    'v3cf5g2t': {
      'en': 'or',
      'it': 'O',
    },
    '8y72o232': {
      'en': 'Guest user login',
      'it': 'Accesso utente ospite',
    },
    'za1g3naw': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // donationcompleted
  {
    'xj2yt6ld': {
      'en': 'Confirming the Payment',
      'it': 'Conferma del pagamento',
    },
    'v339m4fn': {
      'en': 'Please Do Not Close The Screen',
      'it': 'Si prega di non chiudere lo schermo',
    },
    'd2r0wr4l': {
      'en': 'This page will redirect automatically!',
      'it': 'Questa pagina verrà reindirizzata automaticamente!',
    },
    'vg90isbq': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // formpage
  {
    '5z72jpbo': {
      'en': 'Issue name',
      'it': 'Nome del problema',
    },
    'onvnncby': {
      'en': 'Describe The Issue',
      'it': 'Descrivi il problema',
    },
    'c8xpsb64': {
      'en': 'Upload image and video',
      'it': 'Carica immagine e video',
    },
    '4r5cga5c': {
      'en': 'Location',
      'it': 'Posizione',
    },
    'nqvz43j6': {
      'en': 'Submit',
      'it': 'Invia',
    },
    'ndhmjkbw': {
      'en': 'Report a Issue',
      'it': 'Segnala un problema',
    },
    '45qpjxmu': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // paymentprocessingpage
  {
    '9rf1l2gm': {
      'en': 'Home',
      'it': 'Casa',
    },
  },
  // language
  {
    'mhb0kntb': {
      'en': 'Do you want to continue \nin Italian?',
      'it': 'Vuoi continuare\nin italiano?',
    },
    'i6lvr6nj': {
      'en': 'no',
      'it': 'NO',
    },
    'uorcxd4i': {
      'en': 'YES',
      'it': 'SÌ',
    },
  },
  // languageselector
  {
    '1qvsusq4': {
      'en': 'Change Language',
      'it': 'Cambia lingua',
    },
  },
  // paymentcompletion
  {
    'os93v8rz': {
      'en': 'Payment',
      'it': 'Pagamento',
    },
  },
  // Miscellaneous
  {
    'miewycrp': {
      'en':
          'we use camera permissions to allow you upload your profile picture',
      'it':
          'utilizziamo le autorizzazioni della fotocamera per consentirti di caricare la tua immagine del profilo',
    },
    'j1optlev': {
      'en':
          'we usephoto library permissions to allow you upload your profile picture',
      'it':
          'utilizziamo le autorizzazioni della libreria di foto per consentirti di caricare la tua immagine del profilo',
    },
    'hme3z726': {
      'en': '',
      'it': '',
    },
    'f4ievysz': {
      'en': '',
      'it': '',
    },
    'c0vxj6ix': {
      'en': '',
      'it': '',
    },
    '22u83rgm': {
      'en': '',
      'it': '',
    },
    'v4knyfhk': {
      'en': '',
      'it': '',
    },
    'y4pjq2q3': {
      'en': '',
      'it': '',
    },
    '0cmvvur0': {
      'en': '',
      'it': '',
    },
    'ru3e6pq2': {
      'en': '',
      'it': '',
    },
    'fd2nxzl4': {
      'en': '',
      'it': '',
    },
    'm5mqgug2': {
      'en': '',
      'it': '',
    },
    'd7r6ewm5': {
      'en': '',
      'it': '',
    },
    '1h5vicru': {
      'en': '',
      'it': '',
    },
    '5wxsa3l4': {
      'en': '',
      'it': '',
    },
    'jzxoydpg': {
      'en': '',
      'it': '',
    },
    'pc0m4wqk': {
      'en': '',
      'it': '',
    },
    '24vq9mhm': {
      'en': '',
      'it': '',
    },
    'jlkc4382': {
      'en': '',
      'it': '',
    },
    '6gjbrnez': {
      'en': '',
      'it': '',
    },
    'sqmcuopd': {
      'en': '',
      'it': '',
    },
    '7hf35h4f': {
      'en': '',
      'it': '',
    },
    'exlqh3f3': {
      'en': '',
      'it': '',
    },
    'vxe2gwwd': {
      'en': '',
      'it': '',
    },
    'n14pfesn': {
      'en': '',
      'it': '',
    },
    '7k71160v': {
      'en': '',
      'it': '',
    },
    'enc1m1h4': {
      'en': '',
      'it': '',
    },
    '4vlcrije': {
      'en': '',
      'it': '',
    },
  },
].reduce((a, b) => a..addAll(b));
