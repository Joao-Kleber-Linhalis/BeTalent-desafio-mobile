import 'package:intl/intl.dart';

class Tools {
  static String formatDateToString(DateTime dateTime) {
    // Define o formato de saída
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    // Retorna a data formatada como String
    return dateFormat.format(dateTime);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 12 || phoneNumber.length == 13) {
      final regex = RegExp(
          r'^(\d{2})(\d{2})(\d{5})(\d{4})$'); //Parte o numero em 4 grupos
      final match = regex.firstMatch(phoneNumber);

      if (match != null) {
        final countryCode = match.group(1); // Código do país - GRUPO 1
        final ddd = match.group(2); // DDD - Grupo 2
        final firstPart = match.group(3); // Primeiros 5 dígitos - Gripo 3
        final secondPart = match.group(4); // Últimos 4 dígitos - Grupo 4

        // Retorna o número formatado
        return '+$countryCode ($ddd) $firstPart-$secondPart';
      }
    }
    // Retorna o número original se não estiver no formato esperado
    return phoneNumber;
  }
}
