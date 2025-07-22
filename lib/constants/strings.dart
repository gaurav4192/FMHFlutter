class Strings {
  Strings._();

  static const String url = "http://dev-orclebs.intelloger.com:8000/webservices/rest";

  // InputFields
  static const String emailLabel = "Email";
  static const String emailHint = "Enter your email";
  static const String passwordHint = "Password";
  static const String mobilenumber = "Mobile Number";
  static const String passwordConfirmationHint = "Password Confirmation";

  // Login
  static const String loginLabel = 'Login';
  static const String submitApplication = 'Submit Application';
  static const String forgotPassword = 'Forgot password?';
  static const String submit = 'Submit';
  static const String ok = 'Ok';
  static const String yes = 'Yes';

  static const String resetPasswordLabel = 'Reset Password';
  static const String oldPasswordHint = 'Old Password';
  static const String newPasswordHint = 'New Password';
  static const String reset = 'Reset';

  static const String logout = 'Logout';

  // Error
  static const String errorLabel = 'Error';
  static const String emailError = 'Please enter valid email';
  static const String passwordNotMatch = 'Password does not match';
  static const String confirmPassword = "Please confirm your password";



  static const String approve = 'Approve';
  static const String reject = 'Reject';
  static const String cancel = 'Cancel';
  static const String reasonforrejection = 'Reason for rejection';
  static const String approveleaves = 'Approve Leaves';
  static const String applyleave = 'Apply Leave';


  static const String approveexpense = 'Approve Expenses';
  static const String applyexpense = 'Apply Expenses';

  static const String apply = 'Apply';
  static const String clearall = 'Clear All';



  static const String prefToken = "prefToken";

  static const String prefLoginPersonId = "prefLoginPersonId";
  static const String prefLoginUserId = "prefLoginUserId";
  static const String prefGroupId = "prefGroupId";
  static const String prefSecurityProfile = "prefSecurityProfile";

  static const String UPLOAD_PATH = "/u01/install/APPS/fs1/EBSapps/appl/xxintg/12.0.0/rest_outbound";
  static const String SFTP_IP = "140.238.241.23";
  static const String SFTP_USER_NAME = "opc";
  static const String AVAILABLEERRORLEAVE = "You don't have available Leave balance for any Leave Type";



  static const String SFTP_PUBLIC_KEY =

      "-----BEGIN RSA PRIVATE KEY-----\n" +
          "MIIEpQIBAAKCAQEAynkk/nm679XNi4pjok9VupRlJH5E4MN1v/DDNqFgTf9mzwyR\n" +
          "fkXYrBn2MCJauco9eZNRdhFbBAHGKlkDVXoNvtOkWRg2cJo+kQ0ZSmKhcRxQ5Hz8\n" +
          "TbHTcvkcTSU3qV+D6eQCmXuYhCv2Bsytf2HQw9vXkhZ5Vny0WYfvtjq2AOGt2SIe\n" +
          "6J23wMZQp3SNGv31xQXjV4eWvuDXBqFezc2zLaWXeniAHlkQHpa3z9uHnW0xM8qF\n" +
          "zdhm/HtFGxsvO3tzcaUwt6vpJ2OGe6aiQ+nAP9y7Mtm4oEke+7oN7+kVcbTVw6lh\n" +
          "9Z9PD8sH3I9V9eiUJ8GxGjEo6T6SJ2wAvDUobwIDAQABAoIBADIraHZB1Yc+FAti\n" +
          "hCOgwt5TjOhI/WowJIol70knHYTWJzRgqeB/EBw85pqwuIhWy3rHfSTjUgkhI2g0\n" +
          "3DWe468IJC4LaNnn7l7kvwKGg/hSCt1C9wWNbZaMkW2wLiWizD31SIuda4I8nl66\n" +
          "8raglykg3T6OoQxEJDAXFdeynoyC7iEOw4KfEAdqjG7F8ln6QX94LdrzgmRSGRn6\n" +
          "JYcvMK2gYJgZVHn8GrOjnqDa1Z5VQHfgCotvkaqrL6E5QUhOdFlk2Bc31u8minfL\n" +
          "+bHfV8F0HqqFLXflmlHD8EAsIxngXOmm9EgIWfChb9Re1TO3dG6q8DdI6ewe9RaJ\n" +
          "e8nIlHECgYEA8HO+zLZUAPz9ReRkbgXeROgmSiugQaxvoKmgAHsmWCbyn9qvMMVI\n" +
          "myGvRQWlAxkrXNfThhRu6fEqpcZuE/yyaPolVecIh4gaQ6laJgDaqaCEh78t+UVu\n" +
          "WOTcv4fOiEG+JXwuOV8C2X/rYUkjedC83OtWN+r5meUn8+HdgaALKBkCgYEA15C5\n" +
          "8CqmHYKnKp3yg4DximbVdOUxrCBaxdXB9KHf99a2BamwC87I1/49L/jug31CfqlM\n" +
          "KwGQgQdkUsWVX3MQidSqKLjl36jhGFi3QC+OwVr5zRk3b+KB07Q80r9+/6tIOdse\n" +
          "LjNhGzM4OWjcybUzaBCOnUQSSb8CmBGGU0vUhccCgYEAjHdBVfuJVU51crf6h198\n" +
          "OgrYG2oi41qll1igNMe8XbDa+dFZmIcXZDCoYAztGcNBVqpqUiBrrtSI0nD560kq\n" +
          "vDKtTuJ5VBuJJE+xbxP+qSsxYM+pPr51uQ5xep4OZADr4KALrM45LvAQhDOius3b\n" +
          "Fr+QDXiCOYnp7gnbSZdCDTkCgYEAwmBPOZ/LcDq6r/QClM+1fX4ipihw9Ourzk5k\n" +
          "eUlp4loqgcqz4sHQWut2kwZdVBWj2wCfnPvpKF/Y98YQXiQsWox37wZiyZ3HcyO0\n" +
          "Ad2gVPvK2kUNtwbA2HviiIqCYto442qQuUo9GsDBxwqmY//PXdvoLSkPcI4bMbJD\n" +
          "tGJhPUsCgYEAtOMPImglUZbnLb1adt2G8pUxWAiaJ3xqI6bf1+CySmMRm27PHi9R\n" +
          "Cjifjg3UD7b9ROS3NauixGio0zce8MZRIGUFYedw2qNUX+qXMfB3nCZl5E856WEO\n" +
          "RW4XmN6l998xxo/2PATYd0U7vvSNq+NOY1B1hOVMRCwpYxt0d8TuK8o=\n" +
          "-----END RSA PRIVATE KEY-----";
}