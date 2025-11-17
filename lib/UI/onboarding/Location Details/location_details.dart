import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/onboarding/models/update_user_model/update_user_model.dart';
import 'package:wepay/UI/onboarding/viewmodel/auth_view_model.dart';
import 'package:wepay/UI/onboarding/widgets/background_view.dart';
import 'package:wepay/UI/widgets/ProfileFiller.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/common/Utils/Custom_widgets/custom_dropdown.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/services/others/countries.dart';

class LocationDetails extends ConsumerStatefulWidget {
  const LocationDetails(
    this.userId,
    this.email,
    this.occupation,
    this.education,
    this.religion,
    this.marital, {
    super.key,
  });
  final String userId;
  final String email, occupation, education, religion, marital;

  @override
  ConsumerState<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends ConsumerState<LocationDetails> {
  String? selectedState;
  String? selectedLGA;
  final Map<String, List<String>> stateToLGAs = {
    'Abia': [
      'Aba North',
      'Aba South',
      'Arochukwu',
      'Bende',
      'Ikwuano',
      'Isiala Ngwa North',
      'Isiala Ngwa South',
      'Isuikwuato',
      'Obi Ngwa',
      'Ohafia',
      'Osisioma',
      'Ugwunagbo',
      'Ukwa East',
      'Ukwa West',
      'Umuahia North',
      'Umuahia South',
      'Umu Nneochi',
    ],
    'Adamawa': [
      'Demsa',
      'Fufore',
      'Ganye',
      'Gayuk',
      'Gombi',
      'Grie',
      'Hong',
      'Jada',
      'Lamurde',
      'Madagali',
      'Maiha',
      'Mayo Belwa',
      'Michika',
      'Mubi North',
      'Mubi South',
      'Numan',
      'Shelleng',
      'Song',
      'Toungo',
      'Yola North',
      'Yola South',
    ],
    'Akwa Ibom': [
      'Abak',
      'Eastern Obolo',
      'Eket',
      'Esit Eket',
      'Essien Udim',
      'Etim Ekpo',
      'Etinan',
      'Ibeno',
      'Ibesikpo Asutan',
      'Ibiono-Ibom',
      'Ika',
      'Ikono',
      'Ikot Abasi',
      'Ikot Ekpene',
      'Ini',
      'Itu',
      'Mbo',
      'Mkpat-Enin',
      'Nsit-Atai',
      'Nsit-Ibom',
      'Nsit-Ubium',
      'Obot Akara',
      'Okobo',
      'Onna',
      'Oron',
      'Oro Ngwa',
      'Udung-Uko',
      'Ukanafun',
      'Uruan',
      'Urue-Offong/Oruko',
      'Uyo',
    ],
    'Anambra': [
      'Aguata',
      'Anambra East',
      'Anambra West',
      'Anaocha',
      'Awka North',
      'Awka South',
      'Ayamelum',
      'Dunukofia',
      'Ekwusigo',
      'Idemili North',
      'Idemili South',
      'Ihiala',
      'Njikoka',
      'Nnewi North',
      'Nnewi South',
      'Ogbaru',
      'Onitsha North',
      'Onitsha South',
      'Orumba North',
      'Orumba South',
      'Oyi',
    ],
    'Bauchi': [
      'Alkaleri',
      'Bauchi',
      'Bogoro',
      'Damban',
      'Darazo',
      'Dass',
      'Ganjuwa',
      'Giade',
      'Itas/Gadau',
      'Jama\'are',
      'Katagum',
      'Kirfi',
      'Misau',
      'Ningi',
      'Shira',
      'Tafawa Balewa',
      'Toro',
      'Warji',
      'Zaki',
    ],
    'Bayelsa': [
      'Brass',
      'Ekeremor',
      'Kolokuma/Opokuma',
      'Nembe',
      'Ogbia',
      'Sagbama',
      'Southern Ijaw',
      'Yenagoa',
    ],
    'Benue': [
      'Ado',
      'Agatu',
      'Apa',
      'Awe',
      'Buruku',
      'Gboko',
      'Gwer East',
      'Gwer West',
      'Katsina-Ala',
      'Konshisha',
      'Kwande',
      'Logo',
      'Makurdi',
      'Obi',
      'Ogbadibo',
      'Ohimini',
      'Oju',
      'Okpokwu',
      'Oturkpo',
      'Tarka',
      'Ukum',
      'Ushongo',
      'Vandeikya',
    ],
    'Borno': [
      'Abadam',
      'Askira/Uba',
      'Bama',
      'Bayo',
      'Biu',
      'Chibok',
      'Damboa',
      'Dikwa',
      'Gubio',
      'Guzamala',
      'Gwoza',
      'Hawul',
      'Jere',
      'Kaga',
      'Kala/Balge',
      'Konduga',
      'Kukawa',
      'Kwaya Kusar',
      'Mafa',
      'Magumeri',
      'Maiduguri',
      'Marte',
      'Mobbar',
      'Monguno',
      'Montogomeri',
      'Nganzai',
      'Ngala',
      'Shani',
    ],
    'Cross River': [
      'Abi',
      'Akamkpa',
      'Akpabuyo',
      'Bakassi',
      'Bekwarra',
      'Biase',
      'Boki',
      'Calabar Municipal',
      'Calabar South',
      'Etung',
      'Ikom',
      'Obanliku',
      'Obubra',
      'Obudu',
      'Odukpani',
      'Ogoja',
      'Yakuur',
      'Yala',
    ],
    'Delta': [
      'Aniocha North',
      'Aniocha South',
      'Bomadi',
      'Burutu',
      'Ethiope East',
      'Ethiope West',
      'Ika North East',
      'Ika South',
      'Isoko North',
      'Isoko South',
      'Ndokwa East',
      'Ndokwa West',
      'Okpe',
      'Oshimili North',
      'Oshimili South',
      'Patani',
      'Sapele',
      'Udu',
      'Ughelli North',
      'Ughelli South',
      'Ukwuani',
      'Uvwie',
      'Warri North',
      'Warri South',
      'Warri South West',
    ],
    'Ebonyi': [
      'Afikpo North',
      'Afikpo South',
      'Ezza North',
      'Ezza South',
      'Ikwo',
      'Ishielu',
      'Ivo',
      'Izzi',
      'Ohaozara',
      'Ohaukwu',
      'Onicha',
      'Soto Uma Ukwu',
    ],
    'Edo': [
      'Akoko-Edo',
      'Egor',
      'Esan Central',
      'Esan North-East',
      'Esan South-East',
      'Esan West',
      'Etsako Central',
      'Etsako East',
      'Etsako West',
      'Igueben',
      'Ikpoba Okha',
      'Orhionmwon',
      'Oredo',
      'Ovia North-East',
      'Ovia South-West',
      'Owan East',
      'Owan West',
      'Uhunmwonde',
    ],
    'Ekiti': [
      'Ado Ekiti',
      'Efon',
      'Ekiti East',
      'Ekiti South-West',
      'Ekiti West',
      'Emure',
      'Gbonyin',
      'Ido Osi',
      'Ijero',
      'Ikere',
      'Ilejemeje',
      'Irepodun/Ifelodun',
      'Ise/Orun',
      'Moba',
      'Oye',
    ],
    'Enugu': [
      'Aninri',
      'Awgu',
      'Enugu East',
      'Enugu North',
      'Enugu South',
      'Ezeagu',
      'Igbo Etiti',
      'Igbo Eze North',
      'Igbo Eze South',
      'Isi Uzo',
      'Nkanu East',
      'Nkanu West',
      'Nsukka',
      'Oji River',
      'Udenu',
      'Udi',
      'Uzo Uwani',
    ],
    'FCT': [
      'Abaji',
      'Bwari',
      'Gwagwalada',
      'Kuje',
      'Kwali',
      'Municipal Area Council',
    ],
    'Gombe': [
      'Akko',
      'Balanga',
      'Billiri',
      'Dukku',
      'Funakaye',
      'Gombe',
      'Kaltungo',
      'Kwami',
      'Nafada',
      'Shongom',
      'Yamaltu/Deba',
    ],
    'Imo': [
      'Aboh Mbaise',
      'Ahiazu Mbaise',
      'Ehime Mbano',
      'Ezinihitte',
      'Ideato North',
      'Ideato South',
      'Ihitte/Uboma',
      'Ikeduru',
      'Isiala Mbano',
      'Isu',
      'Mbaitoli',
      'Ngor Okpala',
      'Njaba',
      'Nkwerre',
      'Nwangele',
      'Obowo',
      'Oguta',
      'Ohaji/Egbema',
      'Okigwe',
      'Orlu',
      'Orsu',
      'Oru East',
      'Oru West',
      'Owerri Municipal',
      'Owerri North',
      'Owerri West',
      'Unuimo',
    ],
    'Jigawa': [
      'Babura',
      'Biriniwa',
      'Birnin Kudu',
      'Buji',
      'Dutse',
      'Gagarawa',
      'Garki',
      'Gumel',
      'Guri',
      'Gwaram',
      'Gwiwa',
      'Hadejia',
      'Jahun',
      'Kafin Hausa',
      'Kazaure',
      'Kiri Kasama',
      'Kiyawa',
      'Kaugama',
      'Maigatari',
      'Malam Madori',
      'Miga',
      'Roni',
      'Sule Tankarkar',
      'Taura',
      'Yankwashi',
    ],
    'Kaduna': [
      'Birnin Gwari',
      'Chikun',
      'Giwa',
      'Igabi',
      'Ikara',
      'Jaba',
      'Jema\'a',
      'Kachia',
      'Kaduna North',
      'Kaduna South',
      'Kagarko',
      'Kajuru',
      'Kaura',
      'Kauru',
      'Kubau',
      'Kudan',
      'Lere',
      'Makarfi',
      'Sabon Gari',
      'Sanga',
      'Soba',
      'Zangon Kataf',
      'Zaria',
    ],
    'Kano': [
      'Albasu',
      'Bagwai',
      'Bebeji',
      'Bichi',
      'Bunkure',
      'Dala',
      'Dambatta',
      'Dawakin Kudu',
      'Dawakin Tofa',
      'Doguwa',
      'Fagge',
      'Gabasawa',
      'Garko',
      'Garun Mallam',
      'Gaya',
      'Gezawa',
      'Gwale',
      'Gwarzo',
      'Kabo',
      'Kano Municipal',
      'Karaye',
      'Kibiya',
      'Kiru',
      'Kumbotso',
      'Kunchi',
      'Kura',
      'Madobi',
      'Makoda',
      'Minjibir',
      'Nasarawa',
      'Nipatse',
      'Rano',
      'Rimin Gado',
      'Rogo',
      'Shanono',
      'Sumaila',
      'Takai',
      'Tarabi',
      'Tarauni',
      'Tsanyawa',
      'Tudun Wada',
      'Ungogo',
      'Warawa',
      'Wudil',
    ],
    'Katsina': [
      'Bakori',
      'Batagarawa',
      'Batsari',
      'Bauchi',
      'Bingi',
      'Charanchi',
      'Dandume',
      'Danja',
      'Dan Musa',
      'Daura',
      'Dutsi',
      'Dutsin Ma',
      'Faskari',
      'Funtua',
      'Ingawa',
      'Jibia',
      'Kafur',
      'Kaita',
      'Kajola',
      'Kalambo',
      'Kankara',
      'Kankia',
      'Katsina',
      'Kurfi',
      'Kusada',
      'Mai\'Adua',
      'Malumfashi',
      'Mani',
      'Mashi',
      'Matazuwa',
      'Musawa',
      'Rimi',
      'Sabuwa',
      'Safana',
      'Sandamu',
      'Zango',
    ],
    'Kebbi': [
      'Aleiro',
      'Argungu',
      'Arewa Dandi',
      'Augie',
      'Bagudo',
      'Birnin Kebbi',
      'Bunza',
      'Dandi',
      'Fakai',
      'Gwandu',
      'Jega',
      'Kalgo',
      'Koko/Besse',
      'Maiyama',
      'Ngaski',
      'Sakaba',
      'Shanga',
      'Suru',
      'Wasagu/Danko',
      'Yauri',
      'Zuru',
    ],
    'Kogi': [
      'Ajaokuta',
      'Ankpa',
      'Bassa',
      'Dekina',
      'Ibaji',
      'Idah',
      'Igalamela Odolu',
      'Ijumu',
      'Kabba/Bunu',
      'Kogi',
      'Lokoja',
      'Mopa Muro',
      'Ofu',
      'Ogori/Magongo',
      'Okehi',
      'Okene',
      'Olamaboro',
      'Omala',
      'Yagba East',
      'Yagba West',
    ],
    'Kwara': [
      'Asa',
      'Baruten',
      'Edu',
      'Ekiti',
      'Ifelodun',
      'Ilorin East',
      'Ilorin South',
      'Ilorin West',
      'Irepodun',
      'Isin',
      'Kaiama',
      'Moro',
      'Offa',
      'Oke Ero',
      'Oyun',
      'Pategi',
    ],
    'Lagos': [
      'Agege',
      'Ajeromi-Ifelodun',
      'Alimosho',
      'Amuwo-Odofin',
      'Badagry',
      'Epe',
      'Eti Osa',
      'Ibeju-Lekki',
      'Ifako-Ijaiye',
      'Ikeja',
      'Ikorodu',
      'Kosofe',
      'Lagos Island',
      'Lagos Mainland',
      'Mushin',
      'Ojo',
      'Oshodi-Isolo',
      'Shomolu',
      'Surulere',
    ],
    'Nasarawa': [
      'Akwanga',
      'Doma',
      'Karu',
      'Keana',
      'Keffi',
      'Kokona',
      'Lafia',
      'Nasarawa',
      'Nasarawa Egon',
      'Obi',
      'Toto',
      'Wamba',
    ],
    'Niger': [
      'Agaie',
      'Agwara',
      'Bida',
      'Borgu',
      'Bosso',
      'Chanchaga',
      'Edati',
      'Gbako',
      'Gurara',
      'Katcha',
      'Kontagora',
      'Lapai',
      'Lavun',
      'Magama',
      'Mariga',
      'Mashegu',
      'Mokwa',
      'Moya',
      'Paikoro',
      'Rafi',
      'Rijau',
      'Shiroro',
      'Suleja',
      'Tafa',
      'Wushishi',
    ],
    'Ogun': [
      'Abeokuta North',
      'Abeokuta South',
      'Ado-Odo/Ota',
      'Egbado North',
      'Egbado South',
      'Egbeda',
      'Ifo',
      'Ijebu East',
      'Ijebu North',
      'Ijebu North East',
      'Ijebu Ode',
      'Ikenne',
      'Imeko Afon',
      'Ipokia',
      'Obafemi Owode',
      'Odeda',
      'Odogbolu',
      'Ogun Waterside',
      'Remo North',
      'Shagamu',
    ],
    'Ondo': [
      'Akoko North-East',
      'Akoko North-West',
      'Akoko South-West',
      'Akoko South-East',
      'Akure North',
      'Akure South',
      'Ese Odo',
      'Idanre',
      'Ifedore',
      'Ilaje',
      'Ile Oluji/Okeigbo',
      'Irele',
      'Laokoja',
      'Odigbo',
      'Okitipupa',
      'Ondo',
      'Ose',
      'Owo',
    ],
    'Osun': [
      'Aiyedaade',
      'Aiyedire',
      'Atakumosa East',
      'Atakumosa West',
      'Boluwaduro',
      'Boripe',
      'Ede North',
      'Ede South',
      'Egbedore',
      'Ejigbo',
      'Ifedayo',
      'Ifelodun',
      'Ife Central',
      'Ife East',
      'Ife North',
      'Ife South',
      'Ila',
      'Ilesa East',
      'Ilesa West',
      'Irepodun',
      'Irewole',
      'Isokan',
      'Iwo',
      'Obokun',
      'Odo Otin',
      'Ola Oluwa',
      'Olorunda',
      'Oriade',
      'Orolu',
      'Osogbo',
    ],
    'Oyo': [
      'Afijio',
      'Akinyele',
      'Atiba',
      'Atisbo',
      'Egbeda',
      'Ibadan North',
      'Ibadan North-East',
      'Ibadan North-West',
      'Ibadan South-East',
      'Ibadan South-West',
      'Ibarapa Central',
      'Ibarapa East',
      'Ibarapa North',
      'Ido',
      'Irepo',
      'Iseyin',
      'Itesiwaju',
      'Iwajowa',
      'Kajola',
      'Lagelu',
      'Ogbomosho North',
      'Ogbomosho South',
      'Ogo Oluwa',
      'Olorunsogo',
      'Oluyole',
      'Ona Ara',
      'Orelope',
      'Ori Ire',
      'Oyo',
      'Oyo East',
      'Saki East',
      'Saki West',
      'Surulere',
    ],
    'Plateau': [
      'Bokkos',
      'Barkin Ladi',
      'Bassa',
      'Bauchi',
      'Dankwo',
      'Jos East',
      'Jos North',
      'Jos South',
      'Kanam',
      'Kanke',
      'Langtang South',
      'Langtang North',
      'Mangu',
      'Mikang',
      'Pankshin',
      'Qua\'an Pan',
      'Riyom',
      'Shendam',
      'Wase',
    ],
    'Rivers': [
      'Abua/Odual',
      'Ahoada East',
      'Ahoada West',
      'Akuku Toru',
      'Andoni',
      'Asari Toru',
      'Bonny',
      'Degema',
      'Emuoha',
      'Eleme',
      'Etche',
      'Gokana',
      'Ikwerre',
      'Khana',
      'Obia/Akpor',
      'Ogba/Egbema/Ndoni',
      'Ogu/Bolo',
      'Okirika',
      'Omuma',
      'Opobo/Nkoro',
      'Oyigbo',
      'Port Harcourt',
      'Tai',
    ],
    'Sokoto': [
      'Binji',
      'Bodinga',
      'Dange Shuni',
      'Gada',
      'Goronyo',
      'Gudu',
      'Gwadabawa',
      'Illela',
      'Isa',
      'Kebbe',
      'Kware',
      'Rabah',
      'Sabon Birni',
      'Shagari',
      'Silame',
      'Sokoto North',
      'Sokoto South',
      'Tambuwal',
      'Tangaza',
      'Tureta',
      'Wamako',
      'Wurno',
      'Yabo',
    ],
    'Taraba': [
      'Ardo Kola',
      'Bali',
      'Donga',
      'Gashaka',
      'Gassol',
      'Ibi',
      'Jalingo',
      'Karim Lamido',
      'Kumi',
      'Lau',
      'Sardauna',
      'Takum',
      'Ussa',
      'Wukari',
      'Yorro',
      'Zing',
    ],
    'Yobe': [
      'Bade',
      'Bursari',
      'Damaturu',
      'Fika',
      'Fune',
      'Geidam',
      'Gujba',
      'Gulani',
      'Jakusko',
      'Karasuwa',
      'Machina',
      'Nangere',
      'Nguru',
      'Potiskum',
      'Tarmuwa',
      'Yunusari',
      'Yusufari',
    ],
    'Zamfara': [
      'Anka',
      'Bakura',
      'Birnin Magaji/Kiyaw',
      'Bukkuyum',
      'Bungudu',
      'Gummi',
      'Gusau',
      'Kaura Namoda',
      'Maradun',
      'Maru',
      'Shinkafi',
      'Talata Mafara',
      'Tsafe',
      'Zurmi',
    ],
  };
  String? selectedCountry;
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _currentAddressController = TextEditingController();
  final _officeAddressController = TextEditingController();

  void _showStatesBottomSheet() {
    final List<String> allStates =
        stateToLGAs.keys.toList()..sort(); // Ensure sorted
    String searchQuery = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.kcDarkGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            final filteredStates =
                allStates
                    .where(
                      (state) => state.toLowerCase().contains(
                        searchQuery.toLowerCase(),
                      ),
                    )
                    .toList();

            return FractionallySizedBox(
              heightFactor: 0.7,
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextView(
                      config: TextViewConfig(
                        text: "Select State",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      onChanged: (value) {
                        setModalState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search states...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  Gap(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredStates.length,
                      itemBuilder: (context, index) {
                        final state = filteredStates[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
                          child: TextView(
                            config: TextViewConfig(
                              text: state,
                              fontSize: 14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              onTap: () {
                                setState(() {
                                  selectedState = state;
                                  selectedLGA = null; // Reset LGA
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showLGAsBottomSheet() {
    if (selectedState == null) return;
    List<String> allLGAs = List.from(stateToLGAs[selectedState!] ?? [])
      ..sort(); // Sort LGAs
    String searchQuery = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.kcDarkGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            final filteredLGAs =
                allLGAs
                    .where(
                      (lga) =>
                          lga.toLowerCase().contains(searchQuery.toLowerCase()),
                    )
                    .toList();

            return FractionallySizedBox(
              heightFactor: 0.7,
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextView(
                      config: TextViewConfig(
                        text: "Select LGA in ${selectedState!}",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      onChanged: (value) {
                        setModalState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search LGAs...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                  ),
                  Gap(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredLGAs.length,
                      itemBuilder: (context, index) {
                        final lga = filteredLGAs[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
                          child: TextView(
                            config: TextViewConfig(
                              text: lga,
                              fontSize: 14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              onTap: () {
                                setState(() {
                                  selectedLGA = lga;
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      disposeViewModel: false,
      builder: (_, model, __) {
        return BackgroundView(
          child: BodyWidget(
            config: BodyConfig(
              loading: model.isBusy,
              backgroundColor: AppColors.kTransparent,
              childPadding: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(height: 42),
                    Center(
                      child: ImageView(
                        imageConfig: ImageConfig(
                          imageURL: AppImage.logo,
                          imageType: ImageType.asset,
                        ),
                      ),
                    ),
                    Gap(height: 32),
                    TextView(
                      config: TextViewConfig(
                        text: "Location Details",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Complete your ",
                        style: GoogleFonts.inter(
                          height: 1.5,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: "profile",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text: " to start enjoying\nWePay's services.",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white.withAlpha(
                                (0.70 * 225).toInt(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(height: 40),
                    CustomDropdownField<String>(
                      labelText: "COUNTRY ",
                      hintText: "Country",
                      value:
                          countries.contains(selectedCountry)
                              ? selectedCountry
                              : null,
                      items: countries,
                      onChanged: (selected) {
                        setState(() {
                          selectedCountry = selected;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "select country";
                        }
                        return null;
                      },
                    ),
                    // Gap(height: 10),
                    ProfileFiller(
                      caption: "STATE OF RESIDENCE",
                      widget: TextFormField(
                        readOnly: true,
                        onTap: _showStatesBottomSheet,
                        controller:
                            _stateController.text.isNotEmpty
                                ? _stateController
                                : TextEditingController(
                                  text: selectedState ?? '',
                                ),
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: AppColors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedState = value;
                            _stateController.text = selectedState ?? '';
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.textColor.withAlpha(
                              (0.40 * 225).toInt(),
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ProfileFiller(
                      caption: "CITY",
                      widget: TextFormField(
                        controller:
                            _cityController.text.isNotEmpty
                                ? _cityController
                                : TextEditingController(
                                  text: selectedLGA ?? '',
                                ),
                        readOnly: true,
                        onTap: _showLGAsBottomSheet,
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: AppColors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedLGA = value;
                            _cityController.text = selectedLGA ?? '';
                            print("This is your LGA ${_cityController.text}");
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.textColor.withAlpha(
                              (0.40 * 225).toInt(),
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ProfileFiller(
                      caption: "CURRENT ADDRESS",
                      widget: TextFormField(
                        controller: _currentAddressController,
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          color: AppColors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            "Enter your current address",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: AppColors.textColor.withAlpha(
                                (0.40 * 225).toInt(),
                              ),
                            ),
                          ),
                          labelStyle: GoogleFonts.inter(
                            fontSize: 15.sp,
                            color: AppColors.textColor.withAlpha(
                              (0.40 * 225).toInt(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ProfileFiller(
                      caption: "OFFICE ADDRESS (OPTIONAL)",
                      widget: TextFormField(
                        controller: _officeAddressController,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: AppColors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            "Enter your office address",
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              color: AppColors.textColor.withAlpha(
                                (0.40 * 225).toInt(),
                              ),
                            ),
                          ),
                          labelStyle: GoogleFonts.inter(
                            fontSize: 18,
                            color: AppColors.textColor.withAlpha(
                              (0.40 * 225).toInt(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(height: 15),
                    ButtonWidget(
                      config: ButtonConfig(
                        text: "Next",
                        radius: 50.r,
                        height: 54,
                        textColor: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () async {
                          if (selectedCountry == null ||
                              selectedState == null ||
                              selectedLGA == null ||
                              _currentAddressController.text.isEmpty) {
                            AppUiComponents.triggerNotification(
                              "Please fill all required fields",
                              error: true,
                            );
                            return;
                          }

                          // Update User Details
                          model.updateUserInfo(
                            UpdateUserModel(
                              email: widget.email,
                              occupation: widget.occupation,
                              education: widget.education,
                              religion: widget.religion,
                              maritalStatus: widget.marital,
                              address: Address(
                                country: selectedCountry,
                                state: selectedState,
                                city: selectedLGA,
                                streetLine: _currentAddressController.text,
                              ),
                            ),
                            widget.userId,
                          );
                        },
                      ),
                    ),

                    Gap(height: 70),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
