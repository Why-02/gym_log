String age(DateTime today, DateTime birthdayDate) {
    Duration age = today.difference(birthdayDate);
    int year = age.inDays ~/ 365;
    int month = (age.inDays % 365) ~/ 30;
    int day = ((age.inDays % 365) % 30);

    switch (age.isNegative) {
      case true :
        return "Not born yet?";
      default :
        switch (year) {
          case <1 :
            switch (month) {
              case <1 :
                switch (day) {
                  case <=1:
                    return "1 day old";
                  default :
                    return "$day days old";
                }
              case 1 :
                return "1 month old";
              case >1 && !=12 :
                return "$month months old";
              default :
                return "11 months old";
            }
          case 1 :
            return "1 year old";
          default :
            return "$year years old";
        }
    }
  }