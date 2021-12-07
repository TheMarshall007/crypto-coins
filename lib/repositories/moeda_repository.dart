import 'package:crypto_coins/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(icone: 'images/bitcoin.png', nome: 'Bitcoin', sigla: 'BTC', preco: 164603.00),
    Moeda(icone: 'images/shiba.png', nome: 'Shiba', sigla: 'SHIB', preco: 16545156.155),
    Moeda(icone: 'images/floki.png', nome: 'Floki', sigla: 'FLOKI', preco: 16515454.51),
  ];
}