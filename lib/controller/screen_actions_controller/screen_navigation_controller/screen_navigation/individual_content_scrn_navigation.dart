import 'package:flutter/material.dart';
import 'package:nutflix/controller/screen_actions_controller/screen_navigation_controller/screen_transitions/right_to_left.dart';
import 'package:nutflix/model/movie.dart';
import 'package:nutflix/presentation/screens/individual_content_screen/individual_content_scrn.dart';

class IndividualContentScrnNavigation{
  _navigateToIndividualContentScrn(BuildContext context, Movie movie){
      Navigator.of(context).push(rightToLeft(IndividualContentScrn(movie: movie,)));
  }
  navigateToIndividualContentScrn(BuildContext context, Movie movie){
    _navigateToIndividualContentScrn(context, movie);
  }
}