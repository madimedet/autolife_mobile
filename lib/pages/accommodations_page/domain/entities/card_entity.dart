// import 'package:equatable/equatable.dart';

// // ignore: must_be_immutable
// class CardEntity extends Equatable {
//   String name;
//   String lastNumbersOfCard;
//   int amount;

//   CardEntity({
//     required this.name,
//     required this.lastNumbersOfCard,
//     required this.amount,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'lastNumbersOfCard': lastNumbersOfCard,
//       'amount': amount,
//     };
//   }

//   factory CardEntity.copyWith({
//     required CardEntity card,
//     String name = '',
//     String lastNumbersOfCard = '',
//     String amount = '',
//   }) =>
//       CardEntity(
//         name: name == '' ? card.name : name,
//         lastNumbersOfCard: lastNumbersOfCard == ''
//             ? card.lastNumbersOfCard
//             : lastNumbersOfCard,
//         amount: card.amount,
//       );

//   @override
//   List<Object> get props => [name, lastNumbersOfCard, amount];
// }
