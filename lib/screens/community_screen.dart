import 'package:flutter/material.dart';
import 'package:resident/helper/utility.dart';
import 'package:resident/screens/society_dues_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenPageState();
}

class _CommunityScreenPageState extends State<CommunityScreen> {
  static const sectionOneTitle = 'Pay';
  static const sectionTwoTitle = 'Discover';
  static const sectionThreeTitle = 'Engage';
  static const cardOneTitle = "Society Dues";
  static const cardOneDesc = 'Pay society dues, deposits ';
  static const cardTwoTitle = 'Rent Pay';
  static const cardTwoDesc = 'Make Rent payments';
  static const cardThreeTitle = 'Utilities Payment';
  static const cardThreeDesc = 'All in one-payment solution';
  static const cardFourTitle = 'Prepaid Meter';
  static const cardFourDesc = 'View consumption & pay utility bills';
  static const cardFiveTitle = 'Residents';
  static const cardFiveDesc = 'View society residents';
  static const cardSixTitle = 'Daily Help';
  static const cardSixDesc = 'Find daily helps and providers';
  static const cardSevenTitle = 'Emergency No,s';
  static const cardSevenDesc = 'Emergency contacts society';
  static const cardEightTitle = 'Local Directory';
  static const cardEightDesc = 'Share & find contacts';
  static const cardNineTitle = 'Help Desk';
  static const cardNineDesc = 'Raise complaints & services requests';
  static const cardTenTitle = 'Amenities';
  static const cardTenDesc = 'Book facilities in your society ';
  static const cardElevenTitle = 'Notice Board';
  static const cardElevenDesc = 'View society announcement';
  static const cardTwelveTitle = 'Communications';
  static const cardTwelveDesc = 'Speak your mind and interact';
  static const cardThirteenTitle = 'Documents';
  static const cardThirteenDesc = 'Find and store society documents';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                sectionOneTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              // 1st Row
              Row(
                children: [
                  _cards(0,Icons.wallet, cardOneTitle, cardOneDesc),
                  const SizedBox(width: 16),
                  _cards(1,Icons.house, cardTwoTitle, cardTwoDesc),
                ],
              ),
              const SizedBox(height: 12),
              // 2nd Row
              Row(
                children: [
                  _cards(2,Icons.payment, cardThreeTitle, cardThreeDesc),
                  const SizedBox(width: 16),
                  _cards(3,Icons.electric_meter, cardFourTitle, cardFourDesc),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                sectionTwoTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              // 3rd Row
              Row(
                children: [
                  _cards(4,Icons.contacts, cardFiveTitle, cardFiveDesc),
                  const SizedBox(width: 16),
                  _cards(5,Icons.help, cardSixTitle, cardSixDesc),
                ],
              ),
              const SizedBox(height: 12),
              // 4th Row
              Row(
                children: [
                  _cards(6,Icons.sos, cardSevenTitle, cardSevenDesc),
                  const SizedBox(width: 16),
                  _cards(7,Icons.book, cardEightTitle, cardEightDesc),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                sectionThreeTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              // 5th Row
              Row(
                children: [
                  _cards(8,Icons.help, cardNineTitle, cardNineDesc),
                  const SizedBox(width: 16),
                  _cards(9,Icons.pool, cardTenTitle, cardTenDesc),
                ],
              ),
              const SizedBox(height: 12),
              // 6th Row
              Row(
                children: [
                  _cards(10,Icons.note_alt, cardElevenTitle, cardElevenDesc),
                  const SizedBox(width: 16),
                  _cards(11,Icons.chat, cardTwelveTitle, cardTwelveDesc),
                ],
              ),
              const SizedBox(height: 12),
              // 7th Row
              Row(
                children: [
                  _cards(12,Icons.document_scanner, cardThirteenTitle,
                      cardThirteenDesc),
                  const SizedBox(width: 16),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cards(int id, IconData icon, String title, String title2) {
    return Expanded(
        child: GestureDetector(
          onTap: () {
            switch (id) {
              case 0:
                Utility.openPage(context, const SocietyDuesPage());
                break;
              case 1:
                Utility.openPage(context, const RentPayPage());//TODO Rent Pay
                break;
              case 2:
                Utility.openPage(context,const UtilitiesPaymentPage());//TODO Utilities Payment
                break;
              case 3:
                Utility.openPage(context, const PrepaidMeterPage());//TODO Prepaid Meter
                break;
              case 4:
                Utility.openPage(context, const ResidentsPage());//TODO Residents  //TODO PAGE
                break;
              case 5:
                Utility.openPage(context, const DailyHelpPage());//TODO Daily help
                break;
              case 6:
                Utility.openPage(context, const SOSPage());//TODO SOS
                break;
              case 7:
                Utility.openPage(context, const LocalDirectoryPage());//TODO Local directory
                break;
              case 8:
                Utility.openPage(context, const HelpDeskPage());//TODO Help Desk
                break;
              case 9:
                Utility.openPage(context, const AmentiesPage());//TODO Amenities
                break;
              case 10:
                Utility.openPage(context, const NoticeBoardPage());//TODO Notice Board
                break;
              case 11:
                Utility.openPage(context, const CommunicationsPage());//TODO Communications
                break;
              case 12:
                Utility.openPage(context, cosnt DocumnetsPage());//TODO Documents
                break;
            }
          },  child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, size: 40, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title2,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
  }
}
