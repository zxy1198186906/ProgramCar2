class RegexHelper{
  static const NUM_LESS = 0;
  static const NUM_MORE = 1;
  static const NUM_ILLEGAL = -1;

  //might error
  static int regexFindNum(String source){
    RegExp regExp = new RegExp("(\\D*)(\\d+)(.*)");
    if(regExp.hasMatch(source)) {
      List<Match> matchList = regExp.allMatches(source).toList();
      return int.parse(matchList.elementAt(2).group(0));
    }
    return -1;
  }

  static bool regexFindState(String source){
    RegExp regExp = new RegExp(".*on.*");
    if(regExp.hasMatch(source))
      return true;
    return false;
  }

  static int regexFindType(String source){
    List<String> _regCharacter = [
      ".*time.*",
      ".*temperature.*",
      ".*network.*",
      ".*clock.*",
      ".*music.*",
      ".*gps.*",
    ];
    for(String str in _regCharacter){
      RegExp regExp = new RegExp(str);
      if(regExp.hasMatch(source))
        return _regCharacter.indexOf(str);
    }
    return -1;
  }

  static int regexFindEqual(String source){
    List<String> _regCharacter = [
      ".*earlier.*",
      ".*lower.*",
      ".*off.*",
      ".*later.*",
      ".*higher.*",
      ".*on.*",
    ];
    for(String str in _regCharacter){
      RegExp regExp = new RegExp(str);
      if(regExp.hasMatch(source)){
        if(_regCharacter.indexOf(str) <= 2)
          return NUM_LESS;
        else
          return NUM_MORE;
      }
    }
    return NUM_ILLEGAL;
  }
}