abstract class NewsAppStates {}

class InitialAppState extends NewsAppStates {}

class BottomNavState extends NewsAppStates {}

class BusinessState extends NewsAppStates {}

class NewsBusinessLoadingState extends NewsAppStates {}

class GetNewsBusinessState extends NewsAppStates {}

class NewsBusinessErrorState extends NewsAppStates {
  final String error;
  NewsBusinessErrorState(this.error);
}

class NewsSportsLoadingState extends NewsAppStates {}

class GetNewsSportsState extends NewsAppStates {}

class NewsSportsErrorState extends NewsAppStates {
  final String error;
  NewsSportsErrorState(this.error);
}

class NewsSearchLoadingState extends NewsAppStates {}

class GetSearchState extends NewsAppStates {}

class NewsSearchErrorState extends NewsAppStates {
  final String error;
  NewsSearchErrorState(this.error);
}

class NewsScinceLoadingState extends NewsAppStates {}

class DarkState extends NewsAppStates {}

class GetNewsScinceState extends NewsAppStates {}

class NewsScinceErrorState extends NewsAppStates {
  final String error;
  NewsScinceErrorState(this.error);
}
