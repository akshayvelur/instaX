import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfilePicEvent>(profilePicEvent);
  }

  FutureOr<void> profilePicEvent(ProfilePicEvent event, Emitter<ProfileState> emit) async{
      final supabase = Supabase.instance.client;
         File?_imageFile ;
    final XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;
  try {
    
    if (img==null) return;

    final file = img;
    final fileName = 'post_${DateTime.now().microsecondsSinceEpoch}.jpg';
    final fileBytes = await file.readAsBytes();

    // ✅ Upload to Supabase (use uploadBinary, not updateBinary)
    final response = await supabase.storage
        .from('instaax')
        .uploadBinary(fileName, fileBytes, fileOptions: const FileOptions(upsert: false));

    if (response != null) {
      final publicUrl = supabase.storage.from("instaax").getPublicUrl(fileName);
      log(publicUrl);

    }
   
  } catch (e) {
    log("Upload Error: $e.");

  }
  }
}
