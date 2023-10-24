rentapp_init:
	flutter pub get packages && dart run build_runner build --delete-conflicting-outputs && dart run slang && dart run ./packages/rentapp_slang/bin/rentapp_slang.dart && cd packages/rentapp_ui && flutter pub get 

rentapp_build:
	dart run build_runner build --delete-conflicting-outputs
rentapp_slang:	
	dart run slang && dart run ./packages/rentapp_slang/bin/rentapp_slang.dart

flutter_gen:
	cd packages/rentapp_ui && fluttergen -c pubspec.yaml