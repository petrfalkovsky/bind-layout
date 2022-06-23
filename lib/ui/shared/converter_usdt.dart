String convertUSDT(String currency) {
  var coin = '';
  coin = currency;
  if (coin.contains('USDT')) {
    coin = coin.split('USDT (').last.split(')').first;
  }
  return coin;
}
