import 'package:intl/intl.dart';

String formatToCustomDate(String inputDate) {
  try {
    // Parse the input date string into a DateTime object
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(inputDate);

    // Format to 'dd MMM EEE' → 06 Aug Tue
    return DateFormat('dd MMM EEE').format(parsedDate);
  } catch (e) {
    return 'Invalid Date';
  }
}
