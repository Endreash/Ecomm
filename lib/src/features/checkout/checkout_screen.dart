// import 'dart:math';

// import 'package:chapasdk/chapasdk.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ecomm/src/features/cart/services/cart_services.dart';


// class CheckoutScreen extends ConsumerWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cartService = ref.read(cartServiceProvider);
//     final totalCost = cartService.calculateTotalCost();
//     print(totalCost);

//     return SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor: WidgetStateProperty.all<Color>(
//                     Theme.of(context).primaryColor),
//               ),
//               onPressed: () {
//                 var r = Random();

//                 const chars =
//                     'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//                 String transactionRef =
//                     List.generate(10, (index) => chars[r.nextInt(chars.length)])
//                         .join();
                        
//                 Chapa.paymentParameters(
//                   context: context, // context
//                   publicKey: 'CHAPUBK_TEST-1OPXyunVVRjoOvMv72NQVZTWy3wAkV7C',
//                   currency: 'ETB',
//                   amount: '1',
//                   email: 'endreash@gmail.com',
//                   phone: '0964001822',
//                   firstName: 'End',
//                   nativeCheckout: true,
//                   lastName: 'h',
//                   txRef: transactionRef,
//                   title: 'Test Payment',
//                   desc: 'Text Payment',
//                   namedRouteFallBack: "/",
//                   showPaymentMethodsOnGridView: true,
//                   availablePaymentMethods: [
//                     'mpesa',
//                     'cbebirr',
//                     'telebirr',
//                     'ebirr',
//                   ],
                  
//                   // onPaymentFinished: (message, reference, amount) {
//                   //   Navigator.pop(context);
//                   // },
//                 );
//               },
//               child: const Text(
//                 'Proceed to Pay',
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//           );
//   }
// }

import 'package:chapasdk/chapasdk.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: (){
          Chapa.paymentParameters(
            context: context,
  publicKey: 'CHAPUBK_TEST-1OPXyunVVRjoOvMv72NQVZTWy3wAkV7C',
  currency: 'ETB',
  amount: '1',
  email: 'fetanchapa.co',
  phone: '0911223344',
  firstName: 'Israel',
  lastName: 'Goytom',
  txRef: 'txn_12345',
  title: 'Order Payment',
  desc: 'Payment for order #12345',
  nativeCheckout: true,
  namedRouteFallBack: '/',
  showPaymentMethodsOnGridView: true,
  availablePaymentMethods: ['mpesa', 'cbebirr', 'telebirr', 'ebirr'],
          );
        }, 
        child: const Text(
                'Proceed to Pay',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
    );
  }
}