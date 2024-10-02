#!/bin/bash
set -e

flutter clean
flutter pub get
dart fix --apply
flutter pub run import_sorter:main
flutter build appbundle
flutter build ipa