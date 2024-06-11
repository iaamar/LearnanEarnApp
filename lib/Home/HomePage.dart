import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnanearnapp/AIInterviewQ/InterviewQLandingPage.dart';
import 'package:learnanearnapp/AIRevamp/AIRevampLandingPage.dart';
import 'package:learnanearnapp/Home/JobCard.dart';
import 'package:learnanearnapp/Home/JobDetailPage.dart';
import 'package:learnanearnapp/subscriptions/SubscriptionsPage.dart';
import '../SizeConfig.dart';
import '../Styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        height: 52,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          color: kPurple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: kPurple,
                child: TextField(
                  style: kPoppinsMedium.copyWith(
                    color: kWhite,
                  ),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    prefixIcon: SvgPicture.asset(
                      'assets/icon_search.svg',
                    ),
                    hintText: 'Type the jobs you want to search',
                    hintStyle: kPoppinsRegular.copyWith(
                        color: kWhiteF5, backgroundColor: kPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: kTransparent,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: kTransparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: kTransparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: kTransparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: kTransparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            const VerticalDivider(
              color: kWhite,
              thickness: 1,
            ),
            const SizedBox(
              width: 12,
            ),
            SvgPicture.asset(
              'assets/icon_filter_list.svg',
            ),
          ],
        ),
      ),
      backgroundColor: kPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 22,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AirevampLandingPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.auto_awesome, // Using a similar icon
                                color: Colors.white,
                                size: 18,
                              ),
                              Text(
                                " AI Revamp",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const InterviewQLandingPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.auto_awesome, // Using a similar icon
                                color: Colors.white,
                                size: 18,
                              ),
                              Text(
                                " AI InterviewQ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset(
                        color: kWhite,
                        'assets/icon_notification_none.svg',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '40 JOBS FOUND',
                    style: kPoppinsBold.copyWith(
                      color: kWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'All Relevance',
                        style: kPoppinsSemibold.copyWith(
                          color: kWhite,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset(
                        'assets/icon_arrow_drop_down.svg',
                        color: kWhite,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubscriptionsPage(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 114, 208),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'TRY PREMIUM TODAY',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Jobs where you’re a top applicant',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Based on your chances of hearing back',
                            style: TextStyle(
                                color: Color.fromARGB(255, 215, 209, 209),
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFA07BDC),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Padding(
              //           padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               const Text(
              //                 "Empower your job search with AI InterviewQ",
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 20,
              //               ),
              //               GestureDetector(
              //                 onTap: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) =>
              //                             const InterviewQLandingPage(),
              //                       ));
              //                 },
              //                 child: Container(
              //                   padding:
              //                       const EdgeInsets.fromLTRB(10, 5, 10, 5),
              //                   decoration: BoxDecoration(
              //                     color: const Color.fromARGB(
              //                         255, 125, 39, 179), // Custom purple color
              //                     borderRadius: BorderRadius.circular(4),
              //                   ),
              //                   child: const Row(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       Icon(
              //                         Icons
              //                             .auto_awesome, // Using a similar icon
              //                         color: Colors.white,
              //                         size: 12,
              //                       ),
              //                       SizedBox(width: 8),
              //                       Text(
              //                         'Try now',
              //                         style: TextStyle(
              //                           color: Colors.white,
              //                           fontSize: 12,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Hero(
              //         tag: "aiinterivweq",
              //         child: Image.asset(
              //           'assets/downloadman.png',
              //           height: 150,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return JobCard(
                    position: 'Senior Product Designer',
                    company: 'Google INC',
                    companyImage:
                        'https://st3.depositphotos.com/1050070/13243/i/450/depositphotos_132435332-stock-photo-google-logo-on-pc-screen.jpg',
                    status: 'applied',
                    types: const [
                      'Full Time',
                      'Remote',
                      'Contractual',
                    ],
                    salary: '\$64k - \$80k',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JobDetailPage(),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
