// ignore_for_file: constant_identifier_names

enum EConnectActivity { WIFI, MOBILE, NONE }

enum DateFormats {
  DEFAULT, //yyyy-MM-dd HH:mm:ss.SSS
  NORMAL, //yyyy-MM-dd HH:mm:ss
  YEAR_MONTH_DAY_HOUR_MINUTE, //yyyy-MM-dd HH:mm
  YEAR_MONTH_DAY, //yyyy-MM-dd
  YEAR_MONTH, //yyyy-MM
  MONTH_DAY, //MM-dd
  MONTH_DAY_HOUR_MINUTE, //MM-dd HH:mm
  HOUR_MINUTE_SECOND, //HH:mm:ss
  HOUR_MINUTE, //HH:mm
  dd_MM_YYYY, //dd-MM-yyyy
  dd_MM_YYYY2, //dd/mm/yyyy
  yyyy_MM_ddTHH_mm_ss,
  yyyy_MM_ddHHmmss,
  yyyyMMddHHmmss,
  MM_YYYY,
  YYYY_MM_dd,
  HHmm_ddMMyyyy_splash,
  ddMMyyyy_hmma
}

enum BlocLoadingStatus { show, hide, nothing }

enum UserType { LTG, GHE, OTHER_APP, ERR, USER_NGOAI }

enum EnumActionBack { reload, openTabReport }
