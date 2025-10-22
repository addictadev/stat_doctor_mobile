// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get errorFieldRequired => 'Ce champ est obligatoire';

  @override
  String get errorInvalidName => 'Format du nom invalide';

  @override
  String get errorInvalidUrl => 'URL invalide';

  @override
  String get errorInvalidEmail => 'Adresse e-mail invalide';

  @override
  String get errorInvalidPassword =>
      'Le mot de passe doit contenir au moins 8 caractères avec majuscule, minuscule et caractères spéciaux';

  @override
  String get errorPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get errorInvalidNumber => 'Numéro invalide';

  @override
  String get errorInvalidIban => 'Format IBAN invalide';

  @override
  String get errorInvalidMobileNumber => 'Numéro mobile invalide';

  @override
  String get errorInvalidStcPayId => 'Identifiant STC Pay invalide';

  @override
  String get errorInvalidNationalId => 'Numéro d\'identité nationale invalide';

  @override
  String get errorInvalidPassport => 'Numéro de passeport invalide';

  @override
  String get errorNoInternetConnection =>
      'Aucune connexion Internet disponible. Veuillez vérifier vos paramètres réseau et réessayer.';

  @override
  String get errorConnectionTimedOut =>
      'Délai de connexion dépassé. Veuillez vérifier votre connexion Internet et réessayer.';

  @override
  String get errorSessionExpired =>
      'Votre session a expiré. Veuillez vous reconnecter pour continuer.';

  @override
  String get errorUnknownServerError =>
      'Une erreur serveur inconnue s\'est produite. Veuillez réessayer plus tard ou contacter le support si le problème persiste.';

  @override
  String get errorUnexpectedError =>
      'Une erreur inattendue s\'est produite. Veuillez réessayer ou contacter le support si le problème persiste.';

  @override
  String get noResults => 'Oups ! Aucun résultat';

  @override
  String get noDataToDisplay => 'Aucune donnée à afficher pour le moment.';

  @override
  String get retry => 'Réessayer';

  @override
  String get tryAgain => 'Essayer à nouveau';

  @override
  String get uploadChooseImage => 'Choisir une image';

  @override
  String get uploadTakePicture => 'Prendre une photo';

  @override
  String get uploadChooseFromFiles => 'Choisir à partir des fichiers';
}
