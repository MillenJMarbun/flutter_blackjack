class RoyalValueCheck {
  static int bruh(value) {
    int returnVal = 0;
    switch (value) {
      case 'JACK':
        {
          returnVal = 10;
        }
        break;
      case 'QUEEN':
        {
          returnVal += 10;
        }
        break;
      case 'KING':
        {
          returnVal += 10;
        }
        break;
      case 'ACE':
        {
          returnVal += 11;
        }
        break;
      default:
        {
          print("loadinggg + $returnVal");
          returnVal += int.parse(value != null ? value : '0');
        }
        break;
    }
    return returnVal;
  }
}
