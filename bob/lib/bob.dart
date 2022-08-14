///Source [https://exercism.org/tracks/dart/exercises/bob]
///
///_DESCRIPTION_
///
/// Bob is a lackadaisical teenager. In conversation, his responses are very limited.
/// Bob answers 'Sure.' if you ask him a question, such as "How are you?".
/// He answers 'Whoa, chill out!' if you YELL AT HIM (in all capitals).
/// He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
/// He says 'Fine. Be that way!' if you address him without actually saying anything.
/// He answers 'Whatever.' to anything else.
/// Bob's conversational partner is a purist when it comes to written communication
/// and always follows normal rules regarding sentence punctuation in English.
///
class Bob {
  // Bob's responses to questions
  static const _sure = 'Sure.';
  static const _chillOut = 'Whoa, chill out!';
  static const _calmDown = 'Calm down, I know what I\'m doing!';
  static const _fine = 'Fine. Be that way!';
  static const _whatever = 'Whatever.';

  bool _isAQuestion(String input) => input.trim().endsWith('?');
  /// This guards against inputs like: '1, 2, 3' || '1, 2, 3?'
  bool _containsActualWords(String input) => input.trim().toLowerCase() != input.trim().toUpperCase();
  bool _isShouting(String input) => _containsActualWords(input) && input.trim().toUpperCase() == input.trim();
  bool _saidNothing(String input) => input.trim().isEmpty;

  String response(String input) {
    if (_isAQuestion(input) && !_isShouting(input)) return _sure;
    if (!_isAQuestion(input) && _isShouting(input)) return _chillOut;
    if (_isAQuestion(input) && _isShouting(input)) return _calmDown;
    if (_saidNothing(input)) return _fine;
    return _whatever;
  }
}

 