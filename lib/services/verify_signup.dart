class VerifySignup {

    String? inputtedUsername; 
    String? inputtedPassword;
    String? inputtedEmail;
    List<String> masterlistUsername = [
      'user1234',
    ];
    List<String> masterlistEmail = [
      'user1234@rocketmail.com',
    ];

  VerifySignup({this.inputtedUsername, this.inputtedPassword, this.inputtedEmail});

  bool verifyUserPass() {
    return (masterlistEmail.contains(inputtedEmail) || masterlistUsername.contains(inputtedUsername)) ? false : true;
  }
}
