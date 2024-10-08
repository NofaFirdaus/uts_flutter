class RegexRegister {
  RegExp regexEmail = RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,6}$');
  RegExp regexUsername = RegExp(r'^[a-zA-Z0-9]{5,15}$');
  RegExp regexName = RegExp(r'^[a-zA-Z ]{3,60}$');
  RegExp regexPassword = RegExp(r'^[A-Za-z\d@$!%*?&]+( {1,2}[A-Za-z\d@$!%*?&]+)*$');

}