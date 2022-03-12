
class ForTimetablesMixin {

//english weekday to russian
  String rusWeekDay(String weekDay) {
    switch (weekDay) {
      case "Monday":
        return "Понедельник";
        break;
      case "Tuesday":
        return "Вторник";
        break;
      case "Wednesday":
        return "Среда";
        break;
      case "Thursday":
        return "Четверг";
        break;
      case "Friday":
        return "Пятница";
        break;
      case "Saturday":
        return "Суббота";
        break;
      case "Sunday":
        return "Воскресенье";
        break;
    }
  }
}
