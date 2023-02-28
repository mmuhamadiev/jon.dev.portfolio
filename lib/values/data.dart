part of 'values.dart';

//https://api.github.com/repos/david-legend/itsolutions.team/stargazers
//https://api.github.com/repos/david-legend/itsolutions.team/forks
class MenuData {
  MenuData({
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;
}

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class ProjectDetails {
  ProjectDetails({
    required this.projectImage,
    required this.projectName,
    required this.projectDescription,
    this.technologyUsed,
    this.isPublic,
    this.isLive,
    this.isOnPlayStore,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectImage;
  final String projectName;
  final String projectDescription;
  final bool? isPublic;
  final bool? isOnPlayStore;
  final bool? isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class PortfolioData {
  PortfolioData({
    required this.title,
    required this.image,
    required this.imageSize,
    //required this.subtitle,
    required this.portfolioDescription,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
  });

  final String image;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  //final String subtitle;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    this.company,
    this.companyUrl,
  });

  final String? company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<MenuData> menuList = [
    MenuData(title: StringConst.HOME, routeName: HomePage.homePageRoute),
    MenuData(title: StringConst.ABOUT_ME, routeName: AboutPage.aboutPageRoute),
    MenuData(
      title: StringConst.PORTFOLIO,
      routeName: PortfolioPage.portfolioPageRoute,
    ),
//    MenuData(
//      title: StringConst.CONTACT,
//      routeName: ContactPage.contactPageRoute,
//    ),
    MenuData(
      title: StringConst.EXPERIENCE,
      routeName: ExperiencePage.experiencePageRoute,
    ),
    MenuData(
      title: StringConst.CERTIFICATIONS,
      routeName: CertificationPage.certificationPageRoute,
    ),
    MenuData(title: StringConst.RESUME, routeName: StringConst.RESUME),

  ];

  static List<SkillData> skillData = [
    SkillData(skillLevel: 82, skillName: StringConst.FLUTTER),
    SkillData(skillLevel: 81, skillName: StringConst.DART),
    SkillData(skillLevel:48, skillName: StringConst.IOS),
    SkillData(skillLevel: 58, skillName: StringConst.ANDROID),
    SkillData(skillLevel: 51, skillName: StringConst.PYTHON),
    SkillData(skillLevel: 55, skillName: StringConst.CSHARP),
    SkillData(skillLevel: 66, skillName: StringConst.UNITY),
    SkillData(skillLevel: 45, skillName: StringConst.PHP),
    SkillData(skillLevel: 67, skillName: StringConst.WORDPRESS),
    SkillData(skillLevel: 82, skillName: StringConst.FIREBASE),
    SkillData(skillLevel: 84, skillName: StringConst.SQL),
    SkillData(skillLevel: 85, skillName: StringConst.FIGMA),
    SkillData(skillLevel: 63, skillName: StringConst.LINUX),
    SkillData(skillLevel: 84, skillName: StringConst.ENGLISH),
    SkillData(skillLevel: 71, skillName: StringConst.CHINESE),
    SkillData(skillLevel: 92, skillName: StringConst.RUSSIAN),
  ];

  static List<SubMenuData> subMenuData = [
    SubMenuData(
      title: StringConst.KEY_SKILLS,
      isSelected: true,
      isAnimation: true,
      skillData: skillData,
    ),
    SubMenuData(
      title: StringConst.EDUCATION,
      isSelected: false,
      content: StringConst.EDUCATION_TEXT,
    ),
  ];
  static List<PortfolioData> portfolioData = [
    PortfolioData(
      title: StringConst.MONKEY_Name,
      //subtitle: StringConst.CRYPTO_DESCRIPTION,
      image: ImagePath.imageMonkey,
      portfolioDescription: StringConst.CRYPTO_DESCRIPTION,
      imageSize: 0.15,
      isPublic: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.MONKEY_URL,
    ),
    PortfolioData(
      title: StringConst.SHRINE_NAME,
      //subtitle: StringConst.SHRINE_DESCRIPTION,
      image: ImagePath.imageShrine,
      portfolioDescription: StringConst.SHRINE_DESCRIPTION,
      imageSize: 0.15,
      isPublic: true,
      isLive: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.SHRINE_URL,
    ),
    PortfolioData(
      title: StringConst.MEDICAL_NAME,
      //subtitle: StringConst.LOGIN_CATALOG_SUBTITLE,
      image: ImagePath.imageMedical,
      portfolioDescription: StringConst.MEDICAL_DESCRIPTION,
      imageSize: 0.3,
      isPublic: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.MEDICAL_URL,
    ),
    PortfolioData(
      title: StringConst.CRYPTO_NAME,
      //subtitle: StringConst.FOODY_BITE_SUBTITLE,
      image: ImagePath.imageCrypto,
      portfolioDescription: StringConst.CRYPTO_DESCRIPTION,
      imageSize: 0.45,
      isPublic: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.CRYPTO_URL,
    ),
    PortfolioData(
      title: StringConst.DOCTOR_NAME,
      //subtitle: StringConst.FINOPP_SUBTITLE,
      image: ImagePath.imageDoctor,
      portfolioDescription: StringConst.DOCTOR_DESCRIPTION,
      imageSize: 0.15,
      isPublic: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.DOCTOR_URL,
    ),
    PortfolioData(
      title: StringConst.POMODORO_NAME,
      //subtitle: StringConst.BEQUIP_LOGISTICS_SUBTITLE,
      image: ImagePath.imagePomodoro,
      portfolioDescription: StringConst.POMODORO_DESCRIPTION,
      imageSize: 0.3,
      isLive: true,
      technologyUsed: StringConst.FLUTTER,
      webUrl: StringConst.POMODORO_URL,
    ),
    PortfolioData(
      title: StringConst.HOTEL_NAME,
      //subtitle: StringConst.LEARN_UPP_SUBTITLE,
      image: ImagePath.imageHotel,
      portfolioDescription: StringConst.HOTEL_DESCRIPTION,
      imageSize: 0.3,
      isPublic: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.HOTEL_URL,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.BANGOR_TYPE,
      url: StringConst.BANGOR_UNIVERSITY_DIPLOMA,
      image: ImagePath.DIPLOMA_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.BANGOR,
    ),
    CertificationData(
      title: StringConst.FLUTTER_TYPE,
      url: StringConst.FLUTTER_DEVELOPER_CERTIFICATION,
      image: ImagePath.UDEMY_FLUTTER_DEV,
      imageSize: 0.30,
      awardedBy: StringConst.UDEMY,
    ),
    // CertificationData(
    //   title: StringConst.COMPANY_TYPE,
    //   url: StringConst.COMPANY_CERTIFICATION,
    //   image: ImagePath.ANDROID_BASICS_CERT,
    //   imageSize: 0.30,
    //   awardedBy: StringConst.UZB,
    // ),
  ];

  static List<ExperienceData> experienceData = [
    // ExperienceData(
    //   company: StringConst.COMPANY_4,
    //   position: StringConst.POSITION_4,
    //   companyUrl: StringConst.COMPANY_4_URL,
    //   roles: [
    //     StringConst.COMPANY_4_ROLE_1,
    //     StringConst.COMPANY_4_ROLE_2,
    //     StringConst.COMPANY_4_ROLE_3,
    //     StringConst.COMPANY_4_ROLE_4,
    //   ],
    //   location: StringConst.LOCATION_4,
    //   duration: StringConst.DURATION_4,
    // ),
    // ExperienceData(
    //   company: StringConst.COMPANY_3,
    //   position: StringConst.POSITION_3,
    //   companyUrl: StringConst.COMPANY_3_URL,
    //   roles: [
    //     StringConst.COMPANY_3_ROLE_1,
    //     StringConst.COMPANY_3_ROLE_2,
    //     StringConst.COMPANY_3_ROLE_3,
    //     StringConst.COMPANY_3_ROLE_4,
    //   ],
    //   location: StringConst.LOCATION_3,
    //   duration: StringConst.DURATION_3,
    // ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.COMPANY_1_URL,
      roles: [
        StringConst.COMPANY_1_ROLE_1,
        StringConst.COMPANY_1_ROLE_2,
        StringConst.COMPANY_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];

  static List<PlatformWebViewController> listOfWebControllers = [
    PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(StringConst.MONKEY_URL),
      ),
    ),
    PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(StringConst.SHRINE_URL),
      ),
    ),
    PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(StringConst.MEDICAL_URL),
      ),
    ),
    PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(StringConst.CRYPTO_URL),
      ),
    ),
    PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(StringConst.DOCTOR_URL),
      ),
    ),
    PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(StringConst.POMODORO_URL),
      ),
    ),
    PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(StringConst.HOTEL_URL),
      ),
    ),
  ];

}
