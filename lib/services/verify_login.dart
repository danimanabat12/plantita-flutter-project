class VerifyLogin {

    String? inputtedUsername; 
    String? inputtedPassword;
    String _predefinedUsername = 'user1234';
    String _predefinedPassword = 'hatdog123'; 

  VerifyLogin( {this.inputtedUsername, this.inputtedPassword});

  bool verifyUserInput() {
    return (_predefinedPassword == inputtedPassword && _predefinedUsername == inputtedUsername) ? true : false;
  }
}