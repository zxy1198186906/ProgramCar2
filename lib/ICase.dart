import 'package:helloworld/IResult.dart';
import 'package:helloworld/ICondition.dart';
import 'package:helloworld/dbOperator.dart';
import 'package:helloworld/RegexHelper.dart';

class Case {
  var _mContext;
  String _mCaseName;
  List<ICondition> _mConditionList = new List();
  List<IResult> _mResultList = new List();

  Case(this._mContext, this._mCaseName);

  void addCondition(ICondition condition){
    _mConditionList.add(condition);
  }
  void removeCondition(){
    if(!_mConditionList.isEmpty)
      _mConditionList.removeLast();
  }

  void addResult(IResult result){
    _mResultList.add(result);
  }
  void removeResult(){
    if(!_mResultList.isEmpty)
      _mResultList.removeLast();
  }

  void initList(dbOperator operator) async{
    List<ICondition> tempList = await operator.query(this);
    _mConditionList.clear();
    _mResultList.clear();
    for(ICondition c in tempList){
      if(c.getRelation() == ICondition.NO)
        addResult(c);
      else
        addCondition(c);
    }
  }

  bool judgeCondition(List<ICondition> conditionList){
    int sum = 0;
    if(conditionList.isNotEmpty){
      for(ICondition c in conditionList){
        String tempStr = c.getDesText();
        int tempRelation = c.getRelation();
        int tempEquation = RegexHelper.regexFindEqual(tempStr);
        int tempNumber = RegexHelper.regexFindNum(tempStr);
        if(!c.find(tempEquation, tempNumber)){
          if(tempRelation > 0)
            sum--;
        }
      }
    }
    if(sum >= 0)
      return true;
    return false;
  }

  void promoteResult(){
    if(_mResultList.isNotEmpty && judgeCondition(_mConditionList)){
      for(IResult result in _mResultList) {
        if(RegexHelper.regexFindState(result.getDesText()))
          result.startAction();
        else
          result.stopAction();
      }
    }
  }

  dynamic getContext() => _mContext;
  List<ICondition> getConditionList() => _mConditionList;
  List<IResult> getResultList() => _mResultList;
  String getCaseName() => _mCaseName;

  bool getCaseRun() => _mConditionList[0].getState();
  void setCaseRun(bool state, [dbOperator operator]) {
    for(ICondition c in _mConditionList){
      if(null != operator)
        operator.updateState(this, state);
      c.setState(state);
    }
    for(IResult r in _mResultList){
      if(null != operator)
        operator.updateState(this, state);
      r.setState(state);
    }
  }
}

