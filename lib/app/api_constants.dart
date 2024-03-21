class ApiConstants {
  ///// App Base Url
  static const String stagingBaseUrl = "https://pmwani.nevrio.tech";
  static const String liveBaseUrl = "https://app.pmwani.net";

  static const String baseUrl = liveBaseUrl;

  /// *******************************************************************

  ///// Provider List Url
  static const String liveProviderListUrl = // Old Data List
      "https://pmwani.gov.in/wani/registry/wani_providers.xml";

  static const String stagingProviderListUrl = //  Staging Data List
      "https://waniregistry.cdot.in/wani/registry/wani_providers.xml";

  static const String newStagingProviderListUrl = // New Staging Data List
      "https://pdoab.cdot.in/wani/registry/wani_providers.xml";

  static const String providerListUrl = newStagingProviderListUrl;

  // static const String razorPayKey = 'rzp_test_XMRTmme0WAD0nC'; // Staging
  static const String razorPayKey = 'rzp_live_MThYpO72j4C7SK'; // Live

  static const String cpxAppIdStaging = "18701"; // staging
  // static const String cpxAppIdLive = "19532"; // live

  static const String admobIdStaging = 'ca-app-pub-3940256099942544/5224354917';
  static const String admobIdLive = 'ca-app-pub-7669540669149141/1836439234';

  ///// Router redirect url for connection
  static const String routerConnectionUrl =
      "https://testlogin.pmwani.net/redirect_url";

  /// *******************************************************************

  /// Api Endpoints
  static const String loginApi = "/api/auth/customer/login";
  static const String logoutApi = "/api/auth/customer/logout";
  static const String signUpApi = "/api/auth/customer/customer-signup";
  static const String getUserProfileApi = "$baseUrl/api/auth/customer/profile";
  static const String uploadMediaApi = "$baseUrl/api/media";
  static const String imageUploadApi =
      "$baseUrl/api/auth/customer/image_upload";
  static const String updateUserProfileApi =
      "$baseUrl/api/auth/customer/profileUpdate";
  static const String completeProfileApi =
      "$baseUrl/api/auth/customer/completeProfile";
  static const String verifyOtpApi =
      "$baseUrl/api/wifilogin/customer/verify-otp";
  static const String forgotPasswordApi = "$baseUrl/api/auth/forgot_password";
  static const String changePasswordApi =
      "$baseUrl/api/auth/customer/change-password";

  static const String immunityRoutersApi = "$baseUrl/api/wifirouter/list";
  static const String homeScreenApi = "$baseUrl/api/userAccountDetails";
  static const String userPetalDetailApi =
      "$baseUrl/api/userpetals/userPetalsDetails";
  static const String notificationDataApi = "$baseUrl/api/notification/list";
  static const String notificationReadAllApi =
      "$baseUrl/api/notification/readall";
  static const String petalsPlanListApi = "$baseUrl/api/petalplans/list";
  static const String paymentTransactionHistoryApi =
      "$baseUrl/api/customer/wifi/payments";
  static const String petalsTransactionHistoryApi =
      "$baseUrl/api/userpetals/transaction-history";

  static const String initialPaymentApi =
      "$baseUrl/api/userpetals/payment/initiate";
  static const String paymentVerifyApi =
      "$baseUrl/api/userpetals/payment/verify";

  static const String addPetalsApi = "$baseUrl/api/userpetals/ad/add-petals";
  static const String getPetalsApi = "$baseUrl/api/userpetals/get-petals";
  static const String giftPetalsApi = "$baseUrl/api/userpetals/gift-petals";

  static const String getRoutersApi = "$baseUrl/api/routers/list";
  static const String getBannerApi = "$baseUrl/api/getBanner";
  static const String getCheckoutDetailsApi =
      "$baseUrl/api/userpetals/orderSummary";
  static const String getInternetPlansApi = "$baseUrl/api/internetplans/list";
  static const String getWifiSessionsApi = "$baseUrl/api/wifisessions";
  static const String getChallengeApi = "$baseUrl/api/challenge";
}
