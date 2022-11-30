import"package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:users_dm/sellersScreens/home_screen.dart';


class PaymentGateway extends StatefulWidget
{
  String? addressID;
  double? totalAmount;
  String? sellerUID;


  PaymentGateway({this.addressID, this.totalAmount, this.sellerUID});

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {



  late Razorpay _razorpay;

  TextEditingController textEditingController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }



  void openCheckout()
  {
    var options = {
      'key': 'rzp_test_rxsEzpYjsIr4Uy',
      'amount': (widget.totalAmount)! * 100,
      'name': 'Direct Mart',
      'description': 'Ecommerce Application',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      },
    };
    try {
      _razorpay.open(options);

    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));


    Fluttertoast.showToast(msg: "Congratulations,PAYMENT SUCCESSFUL. \n Order has been placed successfully.",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.greenAccent);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("payment Failure");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print("External wallet");
  }


  @override
  void dispose()
  {
    super.dispose();
    _razorpay.clear();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text("Razorpay Payment Gateway"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset("images/pay.jpg",
                height: 220,
                fit: BoxFit.cover,
              ),
            ),

            //Image.asset("images/pay.jpg",fit: BoxFit.cover,),

            const SizedBox(height: 20,),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),

                ),
                onPressed: ()
                {
                  openCheckout();
                },
                child: const Text(
                  "OPEN Payment Gateway",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            const SizedBox(height: 13,),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),

                ),
                onPressed: ()
                {
                  Fluttertoast.showToast(msg: "Congratulations, Order has been placed successfully.",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_LONG,
                      backgroundColor: Colors.black,
                      textColor: Colors.greenAccent);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: const Text(
                  "Cash on Delivery",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
          ],
        ),
      ),
    );

  }
}