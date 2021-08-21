String getPhoneNumber(String phoneNumber) {
  if (phoneNumber.startsWith("0")) {
    phoneNumber = phoneNumber.substring(1, phoneNumber.length);
  }
  phoneNumber = "971" + phoneNumber;
  return phoneNumber;
}
