class DateConverter {

  String GetDateBrazilPattern(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String GetTimeBrazilPattern(DateTime date, {bool showSeconds = false}) {
    if(showSeconds){
      return '${date.hour}:${date.minute}:${date.second}';
    }
    return '${date.hour}:${date.minute}';
  }

}
