abstract class NewsStates {}
class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewGetBusinessErrorState extends NewsStates {
  final String error;

  NewGetBusinessErrorState(this.error);
}



class NewGetSportsSuccessState extends NewsStates {}

class NewsGetSportsLoadingState extends NewsStates {}

class NewGetSportsErrorState extends NewsStates {
  final String error;

  NewGetSportsErrorState(this.error);
}



class NewGetScienceSuccessState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewGetScienceErrorState extends NewsStates {
  final String error;

  NewGetScienceErrorState(this.error);
}

class NewsChangeMod extends NewsStates {}