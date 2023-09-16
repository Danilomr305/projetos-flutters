import 'package:dart_aula_01/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/bitcoin.png', 
      nome: 'Bitcoin', 
      sigla: 'BTC', 
      preco: 164603.00,
    ),

    Moeda(
      icone: 'images/ethereum.png', 
      nome: 'Ethereum', 
      sigla: 'ETH', 
      preco: 9716.00,
    ),

    Moeda(
      icone: 'images/xrp.png', 
      nome: 'XRP', 
      sigla: 'XRP', 
      preco: 3.34,
    ),  

    Moeda(
      icone: 'images/usdcoin.png', 
      nome: 'USD Coin', 
      sigla: 'USDC', 
      preco: 5.02,
    ),

    Moeda(
      icone: 'images/cardano.png', 
      nome: 'Cardano', 
      sigla: 'ADA', 
      preco: 6.32,
    ),
    
    Moeda(
      icone: 'images/litecoin.png', 
      nome: 'Litecoin', 
      sigla: 'LTC', 
      preco: 669.93,
    ),

    Moeda(
      icone: 'images/dogecoin.webp', 
      nome: 'Dogecoin', 
      sigla: 'DOGE', 
      preco: 0.066545
    
    ),

    Moeda(
      icone: 'images/bnb.webp', 
      nome: 'Bnb', 
      sigla: 'BNB', 
      preco: 223.50,
    ),

    Moeda(
      icone: 'images/polygon.webp', 
      nome: 'Polygon', 
      sigla: 'MATIC', 
      preco: 0.580,
    ),

    Moeda(
      icone: 'images/shiba-inu.webp', 
      nome: 'Shiba Inu', 
      sigla: 'SHIB', 
      preco: 0.00000820
    ),

    Moeda(
      icone: 'images/wrapped-bitcoin.png', 
      nome: 'Wrapped Bitcoin', 
      sigla: 'WBTC', 
      preco: 27.25700
    ),

    Moeda(
      icone: 'images/unus-sed-leo.png', 
      nome: 'Unus Sed Leo', 
      sigla: 'LEO', 
      preco: 3.9088
    ),

    Moeda(
      icone: 'images/cosmos.png', 
      nome: 'Cosmos', 
      sigla: 'ATOM', 
      preco: 7.2097
    ),
  ];
}