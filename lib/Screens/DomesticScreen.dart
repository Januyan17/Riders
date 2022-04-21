import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newriders/ReusableWidget/reusabletextfield.dart';

import '../Constraints/constants.dart';

class DomesticScreen extends StatefulWidget {
  const DomesticScreen({Key? key}) : super(key: key);

  @override
  State<DomesticScreen> createState() => _DomesticScreenState();
}

class _DomesticScreenState extends State<DomesticScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController correctownernamecontroller = TextEditingController();
  TextEditingController ownertelnocontroller = TextEditingController();
  TextEditingController tenantnamecontroller = TextEditingController();
  TextEditingController remark = TextEditingController();
  TextEditingController remarkcontroller = TextEditingController();

  TextEditingController tenanttelnocontroller = TextEditingController();

  String occupierinitvalue = 'Vacant';
  final occupiertype = ['Owner', 'Tenant', 'Vacant', 'Closed'];

  String ownernamecorrectinitvalue = 'Choose';
  final ownernamecorrect = ['Choose', 'Yes', 'No'];

  String propertyusageinitvalue = 'Choose';
  final propertyusagetype = [
    'Choose',
    '(D)Domestic',
    '(C)Commercial',
    '(I)Industrial',
    '(GQ)Government Quaters',
    '(GP)Government Premise'
  ];

  String typeofbusinessinitvalue = "choose";
  final typeofbusinesstype = [
    'choose',
    'NB13 24 HRS SUNDRY SHOP (7 ELEVEN)',
    'NB28 ACCESSORIES SHOP',
    'NB89	BAKERY',
    'NB27	BANK',
    'NB46	BARBER SHOP',
    'NB96	BEAUTY CENTRE',
    'NB24	BICYCLE SHOP / REPAIR',
    'NB44	BOOK STORE / STATIONERY SHOP',
    'NB76	BOUTIQUE',
    'NB36	BRIDAL SHOP',
    'NB85	BUS STATION',
    'NB139 CAFE',
    'NB40	CANDY SHOP',
    'NB14	CANTEEN',
    'NB21	CAR ACCESSORIES SHOP',
    'NB23	CAR PARK',
    'NB20	CAR SERVICE CENTRE',
    'NB22	CAR WASH',
    'NB39	CARPET SHOP',
    'NB100 CASKET & FUNERAL SERVICES',
    'NB107 CHALET',
    'NB101 CHARITY HOME',
    'NB80	CHINESE MEDICAL HALL',
    'NB05	CHINESE RESTAURANT',
    'NB18	CHURCH',
    'NB78	CINEMA',
    'NB145 CLEANING SERVICES',
    'NB87	COMMERCIAL COMPLEX',
    'NB132 COURIER SERVICE SHOP',
    'NB79	CUSTOMER SERVICE CENTRE',
    'NB83	DANCING SCHOOL',
    'NB94	DAY CARE CENTRE',
    'NB129 DEPARTMENTAL STORE (JAYA JUSCO,SOGO,ETC)',
    'NB68	DRIVING SCHOOL',
    'NB30	ELECTRICAL SHOP',
    'NB124 ENGINEERING FACTORY',
    'NB126 ENTERTAINMENT OUTLET (I.E.KAROAKE)',
    'B123	FACTORY',
    'NB12	FAST FOOD RESTAURANT',
    'NB81	FISHING EQUIPMENT',
    'NB120 FITNESS CENTRE / GYMNASIUM',
    'NB72	FLORIST',
    'NB13	FOOD COURT',
    'NB47	FRAME SHOP',
    'NB55	FROZEN FOOD SHOP',
    'NB82	FRUIT SHOP',
    'NB98	FURNITURE SHOP / HOME FURNISHING',
    'NB71	GALLERY',
    'NB130 GAMING OUTLET (SPORTS TOTO,MAGNUM,ETC)',
    'NB140 GAS SHOP',
    'NB74	GOLDSMITH',
    'NB99	GOLF CLUB',
    'NB136 GOVT BODIES',
    'NB115 GOVT CLINIC',
    'NB117 GOVT HOSPITAL',
    'NB110 GOVT SCHOOL',
    'NB42	HANDICRAFT SHOP',
    'NB45	HANDPHONE / TELECOMMUNICATION SHOP',
    'NB01	HARDWARE SHOP',
    'NB92	HEALTHCARE CENTRE',
    'NB125 HOME DÉCOR',
    'NB106 HOSTEL',
    'NB105 HOTEL',
    'NB128 HYPERMARKET',
    'NB143 ICE SUPPLIER',
    'NB06	INDIAN RESTAURANT',
    'NB90	INSURANCE COMPANY',
    'NB118 INTERNET CAFÉ',
    'NB50	IT RELATED SHOP',
    'NB09	JAPANESE RESTAURANT',
    'NB60	JOB PLACEMENT AGENCY',
    'NB112 KINDERGARTEN',
    'NB10	KOREAN RESTAURANT',
    'NB03	LAUNDRY / DRY CLEANING',
    'NB61	LIBRARY',
    'NB29	LIGHTING SHOP',
    'NB31	LIQUORS SHOP',
    'NB77	LOCKSMITH',
    'NB137 LOGISTICS (SHIPPING/FLIGHT)',
    'NB59	MAID AGENCY',
    'NB04	MALAY RESTAURANT',
    'NB65	MARKET',
    'NB17	MASJID',
    'NB08	MIDDLE EAST RESTAURANT',
    'NB25	MOTORBIKE SHOP / REPAIR',
    'NB135 MUSEUM',
    'NB52	MUSIC CD SHOP',
    'NB84	MUSIC SCHOOL',
    'NB91	NATIONAL SECURITY',
    'NB133 NEW CAR DEALER',
    'NB26	OFFICE',
    'NB102 OLD FOLK HOME',
    'NB67	OPTICIAN',
    'NB41	PAWN SHOP',
    'NB48	PET SHOP',
    'NB103 PETROL STATION',
    'NB66	PHARMACY',
    'NB51	PHOTO SHOP',
    'NB63	PLANT NURSERY',
    'NB70	POST OFFICE',
    'NB33	POULTRY SHOP',
    'NB34	PRAYER SHOP',
    'NB37	PRINTING SHOP',
    'NB114 PRIVATE CLINIC',
    'NB73	PRIVATE CLUB',
    'NB122 PRIVATE COLLEGE',
    'NB116 PRIVATE HOSPITAL',
    'NB109 PRIVATE SCHOOL',
    'NB35	PROVISION SHOP',
    'NB62	PUBLIC HALL',
    'NB64	PUBLIC TOILET',
    'NB119 PUBS / DISCO',
    'NB121 RECORDING STUDIO',
    'NB93	REHABILITATION CENTRE',
    'NB111 RELIGIOUS SCHOOL',
    'NB108 RESORT',
    'NB138 SALOON / SPA CENTRE',
    'NB53	SCRAP SHOP',
    'NB49	SHOES SHOP',
    'NB88	SHOWROOM',
    'NB142 SNACK SHOP',
    'NB57	SOUVENIR SHOP',
    'NB141 SPICE SHOP',
    'NB95	SPORTS CENTRE',
    'NB75	STORE',
    'NB32	SUNDRY SHOP',
    'NB127 SUPERMARKET / MINIMARKET',
    'NB15	SURAU',
    'NB02	TAILOR SHOP',
    'NB16	TEMPLE',
    'NB43	TEXTILE / GARMENT SHOP',
    'NB11	THAI RESTAURANT',
    'NB146 THEME PARK',
    'NB144 TODLER ITEMS SHOP',
    'NB56	TOYS SHOP',
    'NB104 TRANSPORTATION SERVICES',
    'NB58	TRAVEL AGENCY',
    'NB97	TUITION CENTRE',
    'NB113 UNIVERSITY',
    'NB69	USED CAR DEALER',
    'NB54	VIDEO SHOP',
    'NB134 WAREHOUSE',
    'NB38	WATCH / CLOCK SHOP',
    'NB07	WESTERN RESTAURANT',
    'NB86	WHOLESALE OUTLET',
    'NB19	WORKSHOP'
  ];

  String propertydomestictypeinitvalue = 'Choose';
  final propertydomestictype = [
    'Choose',
    'D1 LC Single Storey Terrace House',
    'D2 LC Double Storey Terrace House',
    'D3 Low Cost Flat',
    'D4 LMC Single Storey Terrace Hse',
    'D5 LMC Double Storey Terrace Hse',
    'D6 Low Medium Cost  Flat',
    'D7 Low Medium Cost Apartment',
    'D8 Single Storey Terrace House',
    'D9 Double Storey Terrace House',
    'D10 Triple Storey Terrace House',
    'D11 1 1/2 Storey Terrace House',
    'D12 2 1/2 Storey Terrace House',
    'D13 3 1/2 Storey Terrace House',
    'D14 Single Storey Bungalow',
    'D15 Double Storey Bungalow',
    'D16 Triple Storey Bungalow',
    'D17 Single Storey Semi-D House',
    'D18 Double Storey Semi-D House',
    'D19 Triple Storey Semi-D House',
    'D20 Town House',
    'D21 Flat',
    'D22 Apartment',
    'D23 Service Apartment',
    'D24 Condominium',
    'D25 Villa',
    'D26 Water house ',
    'D27 Warden House',
    'D28 Shop Lot Used as Domestic',
    'D29 Kampung House',
    'D30 Temporary Settlement',
    'D31 Cluster House',
    'D32 Dormitory/Hostel',
    'D33 Squatters',
    'D36 GUARD HOUSE',
    'D37 LC Single Storey Semi-D House',
    'D38 2 1/2 Storey Detached House',
    'D39 2 1/2 Storey Bungalow',
    'D40 Low Cost Townhouse',
    'D41 Low Medium Cost Townhouse',
    'D42 Low Cost Cluster House',
    'D43 4 Storey Bungalow',
    'D44 One and Half Storey Bungalow'
  ];

  String drcodeinitvalue = 'Choose';

  final drcodetype = [
    'Choose',
    '1 DR01 PAYMENT MADE AFTER DCA VISIT',
    '2 DR02 PROMISED TO PAY',
    '3 DR03 REFUSE TO PAY',
    '4 DR04 UNABLE TO PAY',
    '5 DR05 VACANT PREMISE',
    '6 DR06 VACANT LAND',
    '7 DR07 ABANDON',
    '8 DR08 NO TOILET',
    '9 DR09 DEMOLISHED',
    '10 DR10 BUILDING BURNT',
    '11 DR11 UNDER RENOVATION',
    '12 DR12 PROP CANNOT BE LOCATED',
    '13 DR13 UNDER LIQUIDATION',
    '14 DR14 FURTHER EXPLANATION ',
    '15 DR15 BUSINESS ONLY OPERATED IN THE EVENING',
    '16 DR16 REQUESTED FOR INSTALLMENT PLAN',
    '17 DR17 REQUESTED FOR STATEMENT OF ACCOUNT (SOA)',
    '18 DR18 REQUESTED FOR COPY BILL',
    '19 DR19 COLLECTED POSTDATED CHEQUES',
    '20 DR20 OTHER REMARKS, PLEASE SPECIFY IN REMARK COLUMN',
    '21 DR21 DOMESTIC USAGE (FOR COMMERCIAL ASSIGNMENT ONLY)',
    '22 DR22 CLOSED (PLEASE INSERT TOTAL OF VISITATION INTO COLUMN "NUMBER OF VISITATION")',
    '23 DR23 LEAVE MESSAGE TO CALL',
    '24 DR25 TENANT CLAIM OWNER TO PAY',
    '25 DR26 TENANT PAID TO OWNER',
    '26 DR27 NEW TENANT/SAME OWNER',
    '27 DR28 PAYMENT IS OUSTANDING BUT CLAIM PAID',
    '28 DR29 STORE, WITHOUT SIGNBOARD',
    '29 DR32 NO WATER METER',
    '30 DR33 UNDER RECEIVERSHIP',
    '31 DR34 COOLING TOWER USAGE  (FOR COMMERCIAL ASSIGNMENT ONLY)',
    '32 DR35 OWNER CLAIM TENANT TO PAY',
    '33 DR36 COMMERCIAL USAGE (FOR DOMESTIC ASSIGNMENT ONLY)',
    '34 DR37 CUSTOMER DISPUTE ON CHARGES',
    '35 DR38 NOBODY IN THE AREA TO REFER',
    '36 DR39 CLAIM NO SERVICE PROVIDED',
    '37 DR40 MANAGEMENT REFUSE TO COOPERATE',
    '38 DR41 NEW OWNER REFUSE TO PAY PREVIOUS OWNER OUTSTANDING',
    '39 DR42 CUSTOMER REFUSE TO MEET DCA',
    '40 DR43 PROPERTY AGENT REFUSE TO COOPERATE',
    '41 DR45 POLITICAL PARTIES ADVISE CUSTOMER NOT TO PAY IWK CHARGE',
    '42 DR46 NOT RECEIVED BILL',
    '43 DR47 CLAIM PAYED TO IST TANKER',
    '44 DR48 PREMISE OCCUPY BY FOREIGNER-COMMUNICATION ISSUES',
    '45 DR49 OWNER IS IN OVERSEAS',
    '46 DR50 WELFARE SOCIETY-CANT AFFORD TO PAY',
  ];

  actionsheetTakePhoto(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {},
                child: const Align(
                    alignment: Alignment.topLeft, child: Text("Camera"))),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  String? _selectedNationality = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: kPrimaryPurpleColor,
            size: 25.0,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => DeptAssignID()),
            // );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_sharp),
            color: kPrimaryPurpleColor,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_box),
            color: kPrimaryPurpleColor,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.download_sharp),
            color: kPrimaryPurpleColor,
            onPressed: () {},
          )
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            // ignore: deprecated_member_use
            overscroll.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ID :1",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Bill:X6356185",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "SAN:41898081",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Owner1:NEO HOO @ NEW HOW .",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "(Address) 4 JALAN TIMOR 12,TAMAN TIMOR,81300 JOHOR BAHRU,JOHOR",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Range5: >120 months",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Arrears:1,226.25",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Total Payable Amount:1,317.85",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Take Photo DropDown
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Take Photo",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 9),
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(fontSize: 12),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          actionsheetTakePhoto(context);
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: kPrimaryPurpleColor,
                                        ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Occupier DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Occupier(Owner/Tenant )",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryPurpleColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimaryPurpleColor,
                              ),
                              value: occupierinitvalue,
                              isExpanded: true,
                              items: occupiertype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  occupierinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      // Type of Business DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Type Of Business",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryPurpleColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimaryPurpleColor,
                              ),
                              value: typeofbusinessinitvalue,
                              isExpanded: true,
                              items: typeofbusinesstype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  typeofbusinessinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      // Occupier DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Owner Name Correct (Yes/No)",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryPurpleColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimaryPurpleColor,
                              ),
                              value: ownernamecorrectinitvalue,
                              isExpanded: true,
                              items: ownernamecorrect.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  ownernamecorrectinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Please specify correct ownername",
                          correctownernamecontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Owner's tel no", ownertelnocontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Tenant's name", tenantnamecontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Tenant's tel no", tenanttelnocontroller),

                      const SizedBox(
                        height: 20,
                      ),
                      // Radio Button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Occupier Nationality:',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Malaysian",
                                  groupValue: _selectedNationality,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedNationality = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("Malaysian")
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Foreigner",
                                  groupValue: _selectedNationality,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedNationality = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Foreigner")
                            ],
                          )
                          // const Text(
                          //   'Occupier Nationality:',
                          //   style: const TextStyle(
                          //       fontSize: 12, color: Colors.grey),
                          // ),
                          // ListTile(
                          //   leading: Radio<String>(
                          //     value: 'Malaysian',
                          //     groupValue: _selectedNationality,
                          //     onChanged: (value) {
                          //       setState(() {
                          //         _selectedNationality = value!;
                          //       });
                          //     },
                          //   ),
                          //   title: const Text('Malaysian'),
                          // ),
                          // ListTile(
                          //   leading: Radio<String>(
                          //     value: 'Foreigner',
                          //     groupValue: _selectedNationality,
                          //     onChanged: (value) {
                          //       setState(() {
                          //         _selectedNationality = value!;
                          //       });
                          //     },
                          //   ),
                          //   title: const Text('Foreigner'),
                          // ),
                          // const SizedBox(height: 20),
                        ],
                      ),
                      // Property Usage DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Property usage (D or C)",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryPurpleColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimaryPurpleColor,
                              ),
                              value: ownernamecorrectinitvalue,
                              isExpanded: true,
                              items: ownernamecorrect.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  ownernamecorrectinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
// Drop Down
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Property Domestic",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryPurpleColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimaryPurpleColor,
                              ),
                              value: propertydomestictypeinitvalue,
                              isExpanded: true,
                              items: propertydomestictype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  propertydomestictypeinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Drop Down

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dr Code",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryPurpleColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimaryPurpleColor,
                              ),
                              value: drcodeinitvalue,
                              isExpanded: true,
                              items: drcodetype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  drcodeinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Remark",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                            cursorColor: kPrimaryPurpleColor,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field Required';
                              }
                            },
                            controller: remarkcontroller,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide:
                                      BorderSide(color: kPrimaryPurpleColor)),
                              contentPadding:
                                  EdgeInsets.fromLTRB(25, 10, 10, 80),
                              fillColor: kPrimaryWhiteColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide:
                                      BorderSide(color: kPrimaryPurpleColor)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: kPrimaryPurpleColor),
                                gapPadding: 0,
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: RaisedButton(
                          color: kPrimaryPurpleColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Submiting')),
                              );
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
