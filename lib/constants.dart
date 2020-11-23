import 'package:flutter/material.dart';

// App
const String APP_TITLE = "eRegistrator";
const String APP_NAME = "eRegistrator";
const String APP_VERSION = "v2.1";
const String APP_SHARED_PREFERENCE_KEY_PREFIX = "eReg_" ;

// translation, language picker
//const List<String> APP_SUPPORTED_LANGUAGES = ['en', 'hu', 'de'] ;
const List<String> APP_SUPPORTED_LANGUAGES = ['en', 'hu'] ;
//const List<String> APP_SUPPORTED_LANGUAGE_NAMES = ['English', 'magyar', 'Deutch'] ;
const List<String> APP_SUPPORTED_LANGUAGE_NAMES = ['English', 'magyar'] ;
//const List<Map<String, String>> APP_PICKER_LANGUAGE_LIST = [{"isoCode": "en", "name": "English"}, {"isoCode": "hu", "name": "magyar"}, {"isoCode": "de", "name": "Deutch"}] ;
const List<Map<String, String>> APP_PICKER_LANGUAGE_LIST = [{"isoCode": "en", "name": "English"}, {"isoCode": "hu", "name": "magyar"}] ;
const Color languagePickerSearchCursorColor = Colors.red ;
const Color languagePickerDataPrimaryColor = Colors.red ;

// http server, controller-actions
const String HTTP_URL_PROD_ROOT = "https://eregistrator.hu/6/index.php";
const String HTTP_URL_DEV_ROOT = "http://213.181.208.106/";

const String HTTP_BASE_URL_ROUTE_APP_GETMODULES = "r=mobilapp/app/getmodule";
const String HTTP_BASE_URL_ROUTE_APP_LOGIN = "r=mobilapp/app/login";
const String HTTP_BASE_URL_ROUTE_APP_LOGOUT = "r=mobilapp/app/logout";
const String HTTP_BASE_URL_ROUTE_GATE_GETPERIODGATEDIR = "r=mobilapp/gate/getperiodgatedir" ;
const String HTTP_BASE_URL_ROUTE_GATE_START = "r=mobilapp/gate/start" ;
const String HTTP_BASE_URL_ROUTE_GATE_GETACCESS = "r=mobilapp/gate/getaccess" ;

const String HTTP_BASE_URL_ROUTE_KIALLLISTA_KIALLLISTA1 = "r=mobilapp/kialllista/kialllista1";


const int START_METHOD_ERROR = -1 ;
const int START_METHOD_LOGIN = 1 ;
const int START_METHOD_STOP = 0 ;


const String HTTP_BASE_URL_STARTING_PARAMETER = "flutter1.php";
// const String HTTP_BASE_URL_STARTING_PARAMETER = "r=mobilapp/app/getinitparameters";
const String HTTP_STARTING_PARAMETER_FIELD_START_METHOD = "start_method";
const int HTTP_STARTING_PARAMETER_START_METHOD = 1;
const String HTTP_STARTING_PARAMETER_FIELD_STOP_MESSAGE = "stop_message";
const String HTTP_STARTING_PARAMETER_STOP_MESSAGE = "Application has been stopped";
const String HTTP_STARTING_PARAMETER_FIELD_LOGIN_METHOD = "login_method";
const int HTTP_STARTING_PARAMETER_LOGIN_METHOD = 1;

// Welcome screen
const String HTTP_WELCOME_FIELD_SECOND = "welcome_second";
const int HTTP_WELCOME_SECOND = 2;
const String HTTP_WELCOME_FIELD_IMAGE = "welcome_image";
const String HTTP_WELCOME_IMAGE = "assets/images/eregistrator.png";
const String HTTP_WELCOME_FIELD_TITLE = "welcome_title";
const String HTTP_WELCOME_TITLE = "Welcome to eRegistrator";
const String HTTP_WELCOME_FIELD_LOADINGTEXT = "welcome_loadingtext";
const String HTTP_WELCOME_LOADINGTEXT = "Enjoy...";

const double WELCOME_FOTOSIZE = 120.0;
const String WELCOME_ONCLICK_ROUTE = "/home";
const MaterialColor WELCOME_LG_COLOR_1 = Colors.cyan;
const MaterialColor WELCOME_LG_COLOR_2 = Colors.blue;
const Color WELCOME_BACKGROUND = Colors.white;
const MaterialColor WELCOME_LOADERCOLOR = Colors.red;


// Camera
const String flash_on = "FLASH ON";
const String flash_off = "FLASH OFF";
const String front_camera = "FRONT CAMERA";
const String back_camera = "BACK CAMERA";
const Color CAMERA_BORDERCOLOR = Colors.red;
const double CAMERA_BORDERRADIUS = 5;
const double CAMERA_BORDERLENGTH = 20;
const double CAMERA_BORDERWIDTH = 10;
const double CAMERA_CUTOUTSIZE = 220;

// login
const double login_login_icon_size = 32.0 ;
const double login_password_icon_size = 32.0 ;
const double login_password_visible_icon_size = 32.0 ;
