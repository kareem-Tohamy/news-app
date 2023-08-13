abstract class ParentNews_engAppClass{}
class InitialStatesNews_engApp extends ParentNews_engAppClass{}

class English_News_state extends ParentNews_engAppClass{}
class BottomNavBarStatesNewsEngApp extends ParentNews_engAppClass{}

class NewGetBusinessSuccessStates_Eng extends ParentNews_engAppClass{}
class NewGetBusinessErrorStates_Eng extends ParentNews_engAppClass{
  final error;
  NewGetBusinessErrorStates_Eng(this.error);
}

class NewGetSportsSuccessStates_Eng extends ParentNews_engAppClass{}
class NewGetSportsErrorStates_Eng extends ParentNews_engAppClass{
  final error;
  NewGetSportsErrorStates_Eng(this.error);
}

class NewGetScienceSuccessStates_Eng extends ParentNews_engAppClass{}
class NewGetScienceErrorStates_Eng extends ParentNews_engAppClass{
  final error;
  NewGetScienceErrorStates_Eng(this.error);
}


