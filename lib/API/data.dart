
import 'networkData.dart';

class Data {
  List<String> answer = List<String>();

  Future<List<String>> get1USD(dynamic jasonData) async {
    API api = API();

    var data = await api.getData();
    if (data != null) {
      String EUR = data['rates']['EUR'];
      answer.add(EUR);

      String ILS = data['rates']['ILS'];
      answer.add(ILS);

      String EGP = data['rates']['EGP'];
      answer.add(EGP);

      String AUD = data['rates']['AUD'];
      answer.add(AUD);

      String JOD = data['rates']['JOD'];
      answer.add(JOD);

      String BTC = data['rates']['BTC'];
      answer.add(BTC);

      String ETH = data['rates']['ETH'];
      answer.add(ETH);

      String CAD = data['rates']['CAD'];
      answer.add(CAD);

      String CNY = data['rates']['CNY'];
      answer.add(CNY);

      String GBP = data['rates']['GBP'];
      answer.add(GBP);

      String HKD = data['rates']['HKD'];
      answer.add(HKD);

      String IDR = data['rates']['IDR'];
      answer.add(IDR);

      String INR = data['rates']['INR'];
      answer.add(INR);

      String JPY = data['rates']['JPY'];
      answer.add(JPY);

      String MXN = data['rates']['MXN'];
      answer.add(MXN);

      String NOK = data['rates']['NOK'];
      answer.add(NOK);

      String NZD = data['rates']['NZD'];
      answer.add(NZD);

      String PLN = data['rates']['PLN'];
      answer.add(PLN);

      String RON = data['rates']['RON'];
      answer.add(RON);

      String RUB = data['rates']['RUB'];
      answer.add(RUB);

      String SEK = data['rates']['SEK'];
      answer.add(SEK);

      String SGD = data['rates']['SGD'];
      answer.add(SGD);

      String ZAR = data['rates']['ZAR'];
      answer.add(ZAR);
    }
    return answer;
  }

  Future<List<double>> getAnyUSD(double num) async {
    API api = API();
    var data = await api.getData();
    List<double> answer = List<double>();
    try {
      double EUR = double.parse(data['rates']['EUR']) * num;
      answer.add(EUR);

      double ILS = double.parse(data['rates']['ILS']) * num;
      answer.add(ILS);

      double EGP = double.parse(data['rates']['EGP']) * num;
      answer.add(EGP);

      double AUD = double.parse(data['rates']['AUD']) * num;
      answer.add(AUD);

      double JOD = double.parse(data['rates']['JOD']) * num;
      answer.add(JOD);

      double BTC = double.parse(data['rates']['BTC']) * num;
      answer.add(BTC);

      double ETH = double.parse(data['rates']['ETH']) * num;
      answer.add(ETH);

      double CAD = double.parse(data['rates']['CAD']) * num;
      answer.add(CAD);

      double CNY = double.parse(data['rates']['CNY']) * num;
      answer.add(CNY);

      double GBP = double.parse(data['rates']['GBP']) * num;
      answer.add(GBP);

      double HKD = double.parse(data['rates']['HKD']) * num;
      answer.add(HKD);

      double IDR = double.parse(data['rates']['IDR']) * num;
      answer.add(IDR);

      double INR = double.parse(data['rates']['INR']) * num;
      answer.add(INR);

      double JPY = double.parse(data['rates']['JPY']) * num;
      answer.add(JPY);

      double MXN = double.parse(data['rates']['JPY']) * num;
      answer.add(MXN);

      double NOK = double.parse(data['rates']['JPY']) * num;
      answer.add(NOK);

      double NZD = double.parse(data['rates']['NZD']) * num;
      answer.add(NZD);

      double PLN = double.parse(data['rates']['PLN']) * num;
      answer.add(PLN);

      double RON = double.parse(data['rates']['RON']) * num;
      answer.add(RON);

      double RUB = double.parse(data['rates']['RUB']) * num;
      answer.add(RUB);

      double SEK = double.parse(data['rates']['SEK']) * num;
      answer.add(SEK);

      double SGD = double.parse(data['rates']['SGD']) * num;
      answer.add(SGD);

      double ZAR = double.parse(data['rates']['ZAR']) * num;
      answer.add(ZAR);
    } catch (e) {
      return null;
    }
    return answer;
  }
}
