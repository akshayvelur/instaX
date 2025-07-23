import 'dart:io';
import 'package:insta_x/widgets/post/caption_controller.dart';
import 'package:insta_x/widgets/post/image_container.dart';
import 'package:insta_x/widgets/post/post_appbar.dart' show PostAppBar;
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/screens/posts/bloc/post_bloc.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  File? img;
  TextEditingController caption = TextEditingController();
  @override
  void initState() {
    context.read<PostBloc>().add(ImagePickEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ImagePickState) {
          img = state.img;
        }
        if(state is PostUploadedState){
           showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                   backgroundColor: Colors.transparent,
                     
                    content: Padding(
                      padding: const EdgeInsets.only(left: 35,top: 35),
                      child:Lottie.asset("assets/Liquid 4 Dot Loader.json")
                    ),
                    actions: [
                     
                    ],
                  ),
            );
        }  if (state is UploadingCompleteState) {
          Navigator.of(context).pop();
        img=null;
        }
      },
      builder: (context, state) {
      
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: PostAppBar(img: img, caption: caption),
            ),
            body:
                img != null
                    ? SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            ImageContainer(img: img),
                            SizedBox(height: mediaQueryHeight(.05, context)),
                            CaptionController(caption: caption),
                          ],
                        ),
                      ),
                    )
                    : Center(child: IconButton(onPressed: (){ context.read<PostBloc>().add(ImagePickEvent());}, icon: Icon(Icons.add)),
          ),
        ));
      },
    );
  }
}
