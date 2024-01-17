echo ------- CLEAN -------
 fvm flutter clean ./packages/base_project  
 fvm flutter clean    

echo ------- BUILD -------
 fvm flutter pub get ./packages/base_project/  
 fvm flutter pub get 

# echo ------- BUILDER -------

#  sh gen_builder.sh

# echo ------- RUN -------
#  fvm flutter run --target=lib/main_staging.dart

# echo ------- BUILD APK -------
# fvm flutter build apk --split-per-abi --release --target=lib/main_staging.dart    


# fvm flutter clean && fvm flutter pub get && fvm flutter run --target=lib/main_dev.dart -d AFE00041111

# fvm flutter clean && fvm flutter pub get && fvm flutter run --target=lib/main_dev.dart -d AFE00041265

# fvm flutter clean && fvm flutter pub get && fvm flutter pub get && fvm flutter pub run flutter_launcher_icons