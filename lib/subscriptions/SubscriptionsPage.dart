import 'dart:convert';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Plan',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: windowHeight * 0.1,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFAEF9D0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Ends in\n7 days',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Pick your plan',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Subscription Plans
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.8,
                    ),
                    items: [
                      _buildPlanCard(
                          context,
                          'Basic',
                          10,
                          '\$/month/user',
                          [
                            '"Revamped" Resume revision and style recommendations',
                            'Key words to match with related job titles'
                          ],
                          const Color(0xFF96C2A8),
                          const Color(0xFFD3DE51)),
                      _buildPlanCard(
                          context,
                          'Standard',
                          15,
                          '\$/month/user',
                          [
                            'Job Recommendations based on resume/cv + Job descriptions',
                            'Revamped'
                          ],
                          const Color(0xFFF5C6FD),
                          const Color(0xFF89F4DA)),
                      _buildPlanCard(
                          context,
                          'Premium',
                          25,
                          '\$/month/user',
                          [
                            'AI - InterviewQ',
                            'AI - Revamped',
                            'Job recommendations based on CV/Resume + job descriptions',
                            'Chatbot career pathways'
                          ],
                          const Color(0xFFB37FC5),
                          const Color(0xFF3B1818)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Additional Information
                ],
              ),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Cancel any time *',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        text: 'Need Help? ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Contact Us',
                            style: TextStyle(color: Colors.blue),
                            // Add your contact link here
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, String title, int price,
      String duration, List<String> features, Color first, Color last) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [first, last],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  price.toString() + " " + duration,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                ...features.map((feature) => Text('• $feature')).toList(),
                const SizedBox(height: 16),
                
              ],
            ),
Center(
                  child: GestureDetector(
                    
                      onTap: () async {
                        await StripePaymentHandle()
                            .stripeMakePayment(price.toString());
                      },
                      child: Container(
                        width: windowWidth * 0.4,
                        height: windowWidth * 0.11,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black,width: 0.8),
                        ),
                        child: const Center(child:  Text('Subscribe',style: TextStyle(fontSize: 16),)))),
                ),

          ],
        ),
      ),
    );
  }
}

class StripePaymentHandle {
  Map<String, dynamic>? paymentIntent;

  Future<void> stripeMakePayment(String price) async {
    try {
      paymentIntent = await createPaymentIntent(price, 'USD');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], //Gotten from payment intent
              style: ThemeMode.dark,
              merchantDisplayName: 'LearnanEarn'));
      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      Fluttertoast.showToast(msg: 'Payment succesfully completed');
    } on Exception catch (e) {
      if (e is StripeException) {
        Fluttertoast.showToast(
            msg: '${e.error.localizedMessage}');
      } else {
        Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
      }
    }
  }

//create Payment
  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };
      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

//calculate Amount
  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount) * 100);
    return calculatedAmount.toString();
  }
}
