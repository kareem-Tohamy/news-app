abstract class ParentNewsAppClass{}
class InitialStatesNewsApp extends ParentNewsAppClass{}

class BottomNavBarStatesNewsApp extends ParentNewsAppClass{}

class NewsGetBusinessLoadingStates extends ParentNewsAppClass{}
class NewGetBusinessSuccessStates extends ParentNewsAppClass{}
class NewGetBusinessErrorStates extends ParentNewsAppClass{
  final error;
  NewGetBusinessErrorStates(this.error);
}

class NewsGetSportsLoadingStates extends ParentNewsAppClass{}
class NewGetSportsSuccessStates extends ParentNewsAppClass{}
class NewGetSportsErrorStates extends ParentNewsAppClass{
  final error;
  NewGetSportsErrorStates(this.error);
}

class NewsGetScienceLoadingStates extends ParentNewsAppClass{}
class NewGetScienceSuccessStates extends ParentNewsAppClass{}
class NewGetScienceErrorStates extends ParentNewsAppClass{
  final error;
  NewGetScienceErrorStates(this.error);

}

class NewsGetSearchLoadingStates extends ParentNewsAppClass{}
class NewGetSearchSuccessStates extends ParentNewsAppClass{}
class NewGetSearchErrorStates extends ParentNewsAppClass{
  final error;
  NewGetSearchErrorStates(this.error);

}

class ArabicNewsState extends ParentNewsAppClass{}
class EnglishNewsstate extends ParentNewsAppClass{}