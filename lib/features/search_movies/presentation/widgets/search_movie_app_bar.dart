import 'package:flutter/material.dart';
import 'package:lunii_homework/features/search_movies/presentation/stores/search_movies_store.dart';
import 'package:provider/provider.dart';

class SearchMovieAppBar extends StatefulWidget {
  const SearchMovieAppBar({super.key});

  @override
  State<SearchMovieAppBar> createState() => _SearchMovieAppBarState();
}

class _SearchMovieAppBarState extends State<SearchMovieAppBar> {

  final TextEditingController textController = TextEditingController();

  bool isWriting = false;

  late SearchMoviesStore store;

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        isWriting = textController.text.isNotEmpty;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<SearchMoviesStore>(context);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void search() {
    print("SEARCH");
    store.search(textController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      floating: true,
      title: TextFormField(
        controller: textController,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (_) => search(),
        decoration: InputDecoration(
          hintText: "Search movie",
          suffixIcon: isWriting
            ? IconButton(
                onPressed: textController.clear,
                icon: const Icon(Icons.close)
              )
            : null
        ),
      ),
      centerTitle: true,
    );
  }
}
