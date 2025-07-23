import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_x/services/authentication.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<ImagePickEvent>(imagePickEvent);
    on<PostingEvent>(postingEvent);
  }

 FutureOr<void> imagePickEvent(ImagePickEvent event, Emitter<PostState> emit) async {
    log("imagepic....");
  final supabase = Supabase.instance.client;
  File?_imageFile ;
    final XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
       _imageFile = File(img!.path); 
emit(ImagePickState(img: _imageFile));
    }
 }

  FutureOr<void> postingEvent(PostingEvent event, Emitter<PostState> emit)async {
      log("posting....");
     final supabase = Supabase.instance.client;
  try {
    emit(PostUploadedState());
    if (event.img==null) return;

    final file = event.img;
    final fileName = 'post_${DateTime.now().microsecondsSinceEpoch}.jpg';
    final fileBytes = await file.readAsBytes();

    // ✅ Upload to Supabase (use uploadBinary, not updateBinary)
    final response = await supabase.storage
        .from('instaax')
        .uploadBinary(fileName, fileBytes, fileOptions: const FileOptions(upsert: false));

    if (response != null) {
      final publicUrl = supabase.storage.from("instaax").getPublicUrl(fileName);
      log(publicUrl);
    createPost(publicUrl, event.caption??"");
    emit(UploadingCompleteState());
    }
   
  } catch (e) {
    log("Upload Error: $e.");

  }
}}

 
