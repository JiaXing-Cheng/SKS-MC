


  function dateToRelative(localTime){
    var diff=new Date().getTime()-localTime;
    var ret="";

    var min=60000;
    var hour=3600000;
    var day=86400000;
    var wee=604800000;
    var mon=2629800000;
    var yea=31557600000;

    if (diff<-yea*2)
      ret ="in ## years".replace("##",(-diff/yea).toFixed(0));

    else if (diff<-mon*9)
      ret ="in ## months".replace("##",(-diff/mon).toFixed(0));

    else if (diff<-wee*5)
      ret ="in ## weeks".replace("##",(-diff/wee).toFixed(0));

    else if (diff<-day*2)
      ret ="in ## days".replace("##",(-diff/day).toFixed(0));

    else if (diff<-hour)
      ret ="in ## hours".replace("##",(-diff/hour).toFixed(0));

    else if (diff<-min*35)
      ret ="in about one hour";

    else if (diff<-min*25)
      ret ="in about half hour";

    else if (diff<-min*10)
      ret ="in some minutes";

    else if (diff<-min*2)
      ret ="in few minutes";

    else if (diff<=min)
      ret ="just now";

    else if (diff<=min*5)
      ret ="few minutes ago";

    else if (diff<=min*15)
      ret ="some minutes ago";

    else if (diff<=min*35)
      ret ="about half hour ago";

    else if (diff<=min*75)
      ret ="about an hour ago";

    else if (diff<=hour*5)
      ret ="few hours ago";

    else if (diff<=hour*24)
      ret ="## hours ago".replace("##",(diff/hour).toFixed(0));

    else if (diff<=day*7)
      ret ="## days ago".replace("##",(diff/day).toFixed(0));

    else if (diff<=wee*5)
      ret ="## weeks ago".replace("##",(diff/wee).toFixed(0));

    else if (diff<=mon*12)
      ret ="## months ago".replace("##",(diff/mon).toFixed(0));

    else
      ret ="## years ago".replace("##",(diff/yea).toFixed(0));

    return ret;
  }

  //override date format i18n
  
  Date.monthNames = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  // Month abbreviations. Change this for local month names
  Date.monthAbbreviations = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
  // Full day names. Change this for local month names
  Date.dayNames =["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
  // Day abbreviations. Change this for local month names
  Date.dayAbbreviations = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
  // Used for parsing ambiguous dates like 1/2/2000 - default to preferring 'American' format meaning Jan 2.
  // Set to false to prefer 'European' format meaning Feb 1
  Date.preferAmericanFormat = false;

  Date.firstDayOfWeek =1;
  Date.defaultFormat = "dd/MM/yyyy";


  Number.decimalSeparator = ".";
  Number.groupingSeparator = ",";
  Number.minusSign = "-";
  Number.currencyFormat = "##0.00";



  var millisInWorkingDay =36000000;
  var workingDaysPerWeek =5;

  function isHoliday(date) {
    if(isOpenHolyday)	  
    {
	    var friIsHoly =false;
	    var satIsHoly =true;
	    var sunIsHoly =true;
	
	    pad = function (val) {
	      val = "0" + val;
	      return val.substr(val.length - 2);
	    };
	
	    var holidays = "#01_01#04_25#08_15#11_01#12_25#12_26#06_02#12_08#05_01#2010_04_05#2010_10_19#2010_05_15#2011_04_04#";
	
	    var ymd = "#" + date.getFullYear() + "_" + pad(date.getMonth() + 1) + "_" + pad(date.getDate()) + "#";
	    var md = "#" + pad(date.getMonth() + 1) + "_" + pad(date.getDate()) + "#";
	    var day = date.getDay();
	
	    return  (day == 5 && friIsHoly) || (day == 6 && satIsHoly) || (day == 0 && sunIsHoly) || holidays.indexOf(ymd) > -1 || holidays.indexOf(md) > -1;
    }
    else return false;
  }

  //��ǰʱ����Ƿ�Ϊ�ض�ʱ���(Date) 2018-04-20 by cc
  var innerSpecial=[];
  //��ǰʱ����Ƿ�Ϊ�ض�ʱ���(TimeSpan) 2018-04-20 by cc
  function isSpecialTime(time,areaSn){
    try{
       var specialCheck=checkSpecialDate(new Date(time),areaSn);
       if(specialRestType.indexOf(specialCheck.type)>=0){
    	   return true;
       }
       else {
    	   return false;
       }
    }
    catch(error){
        console.error(error);
        return false;
    }
  }

//�ж���ǰʱ�����������������ʱ����ǹ���ʱ��㣬�����س����ķ�����(Date) 2018-04-20 by cc
  //����ʱ�����ȼ���A-����ʱ�䣺1-����ʱ�� 2-����ʱ���ڵ���Ϣʱ�� 3-����ʱ��; B-��Ϣʱ�䣺1-����ʱ�� 2-��Ϣʱ��
  /*var specialCheck={
    type:null,//���ͣ�
              //1-�����ϰ�ʱ��
              //2-�����ϰ�ʱ���ڵ���Ϣʱ��
              //3-������Ϣʱ��
              //4-��ĩ��Ϣʱ��(��ĩ�ϰ��ʶΪ"N")
              //5-����Ӱ�ʱ��
              //6-������Ϣʱ��
              //7-��ĩ�ϰ�ʱ��(��ĩ�ϰ��ʶΪ"Y")
              //8-δʶ���ʱ��
    date:new Date(),
    duration:0, //����ʱ��(����min)
    endDate:null
  };*/
  function checkSpecialDate(date,areaSn,isException){
    try{
      //��ʼ��specialCheck
      var specialCheck={
        type:null,//���ͣ�
                  //1-�����ϰ�ʱ��
                  //2-�����ϰ�ʱ���ڵ���Ϣʱ��
                  //3-������Ϣʱ��
                  //4-��ĩ��Ϣʱ��(��ĩ�ϰ��ʶΪ"N")
                  //5-����Ӱ�ʱ��
                  //6-������Ϣʱ��
                  //7-��ĩ�ϰ�ʱ��(��ĩ�ϰ��ʶΪ"Y")
                  //8-δʶ���ʱ��
        date:new Date(date.getTime()),
        duration:0, //����ʱ��(����min)
        endDate:null
      };
      specialCheck.date.setMinutes(specialCheck.date.getMinutes(),0,0);
      //�ж��Ƿ���������ʱ���У��
      if(!isActiveSpecialTime){
        specialCheck.type=1;
        specialCheck.duration=1;
        return specialCheck;
      }
      //�ж���ǰ�߱��Ƿ��������ʱ���
      if(!(areaSn in innerSpecial)){
        specialCheck.type=1;
        specialCheck.duration=1;
        return specialCheck;
      }
      //��ȡ��������ʱ�����Ϣ
      var specialTime=innerSpecial[areaSn];
      //У�����
      var day=specialCheck.date.getDay();//��ȡ��ǰʱ������ܼ�
      var workTime=specialTime.workTime;//��������ʱ��
      var restTime=specialTime.restTime;//��������Ϣʱ��
      var exceptionTime=specialTime.exceptionTime;//����ʱ��
      var restTimeWithoutWork=specialTime.restTimeWithoutWork;//������Ϣʱ��

      var workStart,restStart,expStart,restWorkStart;
      var workEnd,restEnd,expEnd,restWorkEnd;
      var dateformat=specialCheck.date.format("yyyy-MM-dd ");
      var weekDay=new Date(date.getTime());
      var errorDate=new Date(date.getTime());//�쳣ʱ��
      var isCheckException=typeof(isException)=="undefined"?true:isException;//�Ƿ�У������ʱ��
      //�ض�����
      var restTimeIn={start:null};//ĳ��ʱ���ڵ���Ϣʱ��
      var expTimeWorkIn={start:null};//ĳ��ʱ������Ϣʱ�������Ӱ�ʱ��
      var expTimeRestIn={start:null};//ĳ��ʱ���ڵ�������Ϣʱ��
      /////////////////////////////////////////////////////////////////////////У����ĩ���ϰࣨ��ĩ���ϰ಻�߹���ʱ�����Ϣʱ�����̣�����ǰ��У�飩
      if((day==0 && !specialTime.isSun) || (day==6 && !specialTime.isSat)){
          //��ʼ���ض�����
          expTimeWorkIn.start=null;
          weekDay.setDate(weekDay.getDate()+1);
          weekDay.setHours(0,0,0);
          //****************************************************************************��Ŀ��ʱ�䴦���ض�ʱ����ʱ
          //�ж��Ƿ�����ĩ����Ӱ�ʱ����
          for(var i=0,ilen=exceptionTime.length;i<ilen && null==specialCheck.type && isCheckException;i++){
            if(exceptionTime[i].type!="1"){
              continue;
            }
            expStart=new Date(exceptionTime[i].start);
            expEnd=new Date(exceptionTime[i].end);
            if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
              //��ֵ=����Ӱ�ʱ��
              if(null==specialCheck.type){
                specialCheck=dateSet(specialCheck,5,new Date(expEnd));
              }
              break;
            }
            //�ռ���Чʱ���ڵ��ض�����(<��Чʱ��=Ŀ��ʱ���~��Ч����ʱ��㣬ֻУ�鿪ʼʱ�䴦����Ч����>ȡ��ӽ�Ŀ��ʱ����ʱ��)=����Ӱ�
            if(expStart>=specialCheck.date.getTime() && expStart<=weekDay.getTime()){
              if(null==expTimeWorkIn.start){
                expTimeWorkIn.start=expStart;
              }
              else {
                if(expTimeWorkIn.start>expStart){
                  expTimeWorkIn.start=expStart;
                }
              }
            }
          }
          //****************************************************************************
          //****************************************************************************��Ŀ��ʱ�䲻�����ض�ʱ����ʱ(�ж��ض�����)
          //�Ƚ��ض�����
          if(null==specialCheck.type && null!=expTimeWorkIn.start){
            specialCheck=dateSet(specialCheck,4,new Date(expTimeWorkIn.start));
          }
          //****************************************************************************
          //��ֵ=��ĩ��Ϣʱ��
          if(null==specialCheck.type){
            specialCheck=dateSet(specialCheck,4,weekDay);
          }
      }
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////У�鹤��ʱ�䣨��ĩ���ϰ���⣩
      for(var i=0,ilen=workTime.length;i<ilen && null==specialCheck.type;i++){
        //�ж���ĩ�Ƿ��ϰࣨ����ĩ���ϰ࣬���߸����̣�
        if((day==0 && !specialTime.isSun) || (day==6 && !specialTime.isSat)){
          break;
        }
        //��ʼ���ض�����
        restTimeIn.start=null;
        expTimeWorkIn.start=null;
        expTimeRestIn.start=null;
        //��ʼ�ж�
        workStart=new Date(dateformat+workTime[i].start);
        workEnd=new Date(dateformat+workTime[i].end);
        //��Ϊ���죬���ж���ʼʱ��ͽ���ʱ��
        if(workTime[i].isInerDay=="Y"){
            if(specialCheck.date.getTime()>=workStart.getTime()){
              workEnd.setDate(workEnd.getDate()+1);
            }
            else {
              workStart.setDate(workStart.getDate()-1);
            }
          }
        if(specialCheck.date.getTime()>=workStart.getTime() && specialCheck.date.getTime()<=workEnd.getTime()){
          //****************************************************************************��Ŀ��ʱ�䴦���ض�ʱ����ʱ
          //�ж��Ƿ��ڹ���ʱ���ڵ�������Ϣʱ�� ���ȼ�1
          for(var z=0,zlen=exceptionTime.length;z<zlen && null==specialCheck.type && isCheckException;z++){
            if(exceptionTime[z].type=="1"){
              continue;
            }
            expStart=new Date(exceptionTime[z].start);
            expEnd=new Date(exceptionTime[z].end);
            if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
              //��ֵ=������Ϣʱ��
              if(null==specialCheck.type){
                specialCheck=dateSet(specialCheck,6,new Date(expEnd));
              }
              break;
            }
            //�ռ���Чʱ���ڵ��ض�����(<��Чʱ��=Ŀ��ʱ���~��Ч����ʱ��㣬ֻУ�鿪ʼʱ�䴦����Ч����>ȡ��ӽ�Ŀ��ʱ����ʱ��)=������Ϣ
            if(expStart>=specialCheck.date.getTime() && expStart<=workEnd.getTime()){
              if(null==expTimeRestIn.start){
                expTimeRestIn.start=expStart;
              }
              else {
                if(expTimeRestIn.start>expStart){
                  expTimeRestIn.start=expStart;
                }
              }
            }
          }
          //�ж��Ƿ��ڹ���ʱ�����Ϣʱ���� ���ȼ�2
          for(var j=0,jlen=restTime.length;j<jlen && null==specialCheck.type;j++){
            restStart=new Date(dateformat+restTime[j].start);
            restEnd=new Date(dateformat+restTime[j].end);
            //������ʱ��δ��ڿ��첢����Ϣʱ��Ľ���ʱ��С�ڿ�ʼʱ�䣬���ж�Ϊ��Ϣʱ����죬����Ϣ����ʱ������+1
            if(workTime[i].isInerDay=="Y" && restEnd<restStart){
              if(specialCheck.date.getTime()>=restStart.getTime()){
                restEnd.setDate(restEnd.getDate()+1);
              }
              else {
                restStart.setDate(restStart.getDate()-1);
              }
            }
            if(specialCheck.date.getTime()>=restStart.getTime() && specialCheck.date.getTime()<=restEnd.getTime()){
              //�ж��Ƿ��ڹ���ʱ�����Ϣʱ���ڵ�����Ӱ�ʱ����
              for(var k=0,klen=exceptionTime.length;k<klen && null==specialCheck.type && isCheckException;k++){
                if(exceptionTime[k].type!="1"){
                  continue;
                }
                expStart=new Date(exceptionTime[k].start);
                expEnd=new Date(exceptionTime[k].end);
                if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
                  //��ֵ=����Ӱ�ʱ��
                  if(null==specialCheck.type){
                    specialCheck=dateSet(specialCheck,5,new Date(expEnd));
                  }
                  break;
                }
                //�ռ���Чʱ���ڵ��ض�����(<��Чʱ��=Ŀ��ʱ���~��Ч����ʱ��㣬ֻУ�鿪ʼʱ�䴦����Ч����>ȡ��ӽ�Ŀ��ʱ����ʱ��)=����Ӱ�
                if(expStart>=specialCheck.date.getTime() && expStart<=restEnd.getTime()){
                  if(null==expTimeWorkIn.start){
                    expTimeWorkIn.start=expStart;
                  }
                  else {
                    if(expTimeWorkIn.start>expStart){
                      expTimeWorkIn.start=expStart;
                    }
                  }
                }
              }
              //��ֵ=����ʱ���ڵ���Ϣʱ��
              if(null==specialCheck.type){
                specialCheck=dateSet(specialCheck,2,restEnd);
              }
              break;
            }
            //�ռ���Чʱ���ڵ��ض�����(<��Чʱ��=Ŀ��ʱ���~��Ч����ʱ��㣬ֻУ�鿪ʼʱ�䴦����Ч����>ȡ��ӽ�Ŀ��ʱ����ʱ��)=����ʱ���ڵ���Ϣʱ��
            if(restStart.getTime()>=specialCheck.date.getTime() && restStart.getTime()<=workEnd.getTime()){
              if(null==restTimeIn.start){
                restTimeIn.start=restStart;
              }
              else {
                if(restTimeIn.start>restStart){
                  restTimeIn.start=restStart;
                }
              }
            }
          }
          //****************************************************************************
          //****************************************************************************��Ŀ��ʱ�䲻�����ض�ʱ����ʱ
          //�Ƚ��ض�����
          if(null==specialCheck.type && (null!=restTimeIn.start || null!=expTimeWorkIn.start || null!=expTimeRestIn.start)){
            var timeArray=[];
            if(null!=restTimeIn.start){
              timeArray.push(restTimeIn.start.getTime());
            }
            if(null!=expTimeWorkIn.start){
              timeArray.push(expTimeWorkIn.start);
            }
            if(null!=expTimeRestIn.start){
              timeArray.push(expTimeRestIn.start);
            }

            var finalend=Math.min.apply(null,timeArray);
            specialCheck=dateSet(specialCheck,1,new Date(finalend));
          }
          //****************************************************************************
          //��ֵ=����ʱ��
          if(null==specialCheck.type){
            //��ֵ����ʱ����Ҫ�ж����ռ����Ľ���ʱ���Ƿ��ڲ��ϰ����ĩ�ڡ������ڲ��ϰ����ĩ�ڣ���Ҫ���¶�λ����ʱ���
            if((workEnd.getDay()==0 && !specialTime.isSun) || (workEnd.getDay()==6 && !specialTime.isSat)){
              workEnd.setDate(workEnd.getDate()-1);
              workEnd.setHours(23,59,0);
            }
            specialCheck=dateSet(specialCheck,1,workEnd);
          }
          break;
        }
      }
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////У��������Ϣʱ�䣨��ĩ���ϰ���⣩
      for(var i=0,ilen=restTimeWithoutWork.length;i<ilen && null==specialCheck.type;i++){
        //�ж���ĩ�Ƿ��ϰࣨ����ĩ���ϰ࣬���߸����̣�
        if((day==0 && !specialTime.isSun) || (day==6 && !specialTime.isSat)){
          break;
        }
        //��ʼ���ض�����
        expTimeWorkIn.start=null;
        //��ʼ�ж�
        restWorkStart=new Date(dateformat+restTimeWithoutWork[i].start);
        restWorkEnd=new Date(dateformat+restTimeWithoutWork[i].end);
        //��δ���죬�����ʱ������+1
        if(restTimeWithoutWork[i].isInerDay=="Y"){
          if(specialCheck.date.getTime()>=restWorkStart.getTime()){
            restWorkEnd.setDate(restWorkEnd.getDate()+1);
          }
          else {
            restWorkStart.setDate(restWorkStart.getDate()-1);
          }
        }
        if(specialCheck.date.getTime()>=restWorkStart.getTime() && specialCheck.date.getTime()<=restWorkEnd.getTime()){
            //****************************************************************************��Ŀ��ʱ�䴦���ض�ʱ����ʱ
            //�ж��Ƿ�����Ϣʱ���ڵ�����Ӱ�ʱ��
            for(var j=0,jlen=exceptionTime.length;j<jlen && null==specialCheck.type && isCheckException;j++){
              if(exceptionTime[j].type!="1"){
                continue;
              }
              expStart=new Date(exceptionTime[j].start);
              expEnd=new Date(exceptionTime[j].end);
              if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
                //��ֵ=����Ӱ�ʱ��
                if(null==specialCheck.type){
                  specialCheck=dateSet(specialCheck,5,new Date(expEnd));
                }
                break;
              }
              //�ռ���Чʱ���ڵ��ض�����(<��Чʱ��=Ŀ��ʱ���~��Ч����ʱ��㣬ֻУ�鿪ʼʱ�䴦����Ч����>ȡ��ӽ�Ŀ��ʱ����ʱ��)=����Ӱ�
              if(expStart>=specialCheck.date.getTime() && expStart<=restWorkEnd.getTime()){
                if(null==expTimeWorkIn.start){
                  expTimeWorkIn.start=expStart;
                }
                else {
                  if(expTimeWorkIn.start>expStart){
                    expTimeWorkIn.start=expStart;
                  }
                }
              }
            }
            //****************************************************************************
            //****************************************************************************��Ŀ��ʱ�䲻�����ض�ʱ����ʱ
            //�Ƚ��ض�����
            if(null==specialCheck.type && null!=expTimeWorkIn.start){
              specialCheck=dateSet(specialCheck,3,new Date(expTimeWorkIn.start));
            }
            //****************************************************************************
            //��ֵ=������Ϣʱ��
            if(null==specialCheck.type){
              specialCheck=dateSet(specialCheck,3,restWorkEnd);
            }
            break;
        }
      }
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////δʶ���κ�ʱ�䴦��
      if(null==specialCheck.type){
        specialCheck=dateSet(specialCheck,8,new Date(errorDate.setMinutes(errorDate.getMinutes()+1)));
      }
      /////////////////////////////////////////////////////////////////////////
      return specialCheck;
    }
    catch(error){
      console.error(error);
    }
  }

  //����ʱ��㸳ֵ
  function dateSet(specialCheck,type,endDate){
      specialCheck.type=type;
      specialCheck.endDate=endDate;
      specialCheck.duration=parseInt(((endDate.getTime()-specialCheck.date.getTime())/(1000*60)+1).toFixed(0));
      return specialCheck;
  }
  
  //�����ض�ʱ���
  function setInnerSpecial(lineSpecial){
	  if(!isActiveSpecialTime){
		  return;
	  }
	  try{
		  //�ռ��ض�ʱ���
		  innerSpecial[lineSpecial.areaSn]={
				  workTime:typeof(lineSpecial.workTime)=="undefined"?[]:lineSpecial.workTime,
				  restTime:typeof(lineSpecial.restTime)=="undefined"?[]:lineSpecial.restTime,//����ʱ���ڵ���Ϣʱ��
				  exceptionTime:typeof(lineSpecial.exceptionTime)=="undefined"?[]:lineSpecial.exceptionTime,
          overTime:[],
          restTimeWithoutWork:[],//����ʱ�������Ϣʱ��
          isSat:typeof(lineSpecial.isSat)=="undefined"?false:lineSpecial.isSat,
          isSun:typeof(lineSpecial.isSun)=="undefined"?false:lineSpecial.isSun
		  };
		  //�ռ�����Ӱ���Ϣ
		  var vTime=innerSpecial[lineSpecial.areaSn].exceptionTime;
		  var vStartDate;
		  var vEndDate;
		  for(var i=0,len=vTime.length;i<len;i++){
        vStartDate=new Date(vTime[i].start);
        vEndDate=new Date(vTime[i].end);
        if(vTime[i].type=="1"){
          //��¼�Ӱ�ʱ���
          innerSpecial[lineSpecial.areaSn].overTime.push({
            start:vStartDate.getTime(),
            end:vEndDate.getTime()
          });
        }
      }
      //�ռ�����ʱ�������Ϣʱ�䣬��restTime��ͬ��restTimeΪ����ʱ���ڵ���Ϣʱ��
      innerSpecial[lineSpecial.areaSn].workTime.forEach(function(item,index,array){
    	  if(item.end==(array[(index+1)>=array.length?0:(index+1)].start)){
    		  return;
    	  }
          innerSpecial[lineSpecial.areaSn].restTimeWithoutWork.push({
            start:item.end,
            end:array[(index+1)>=array.length?0:(index+1)].start,
            isInerDay:(index+1)>=array.length?"Y":"N"
          });
      });
	  }
	  catch(error){}
  }

  //�ı�����ʱ��㼯���еĶ�Ӧ�������ĩ�ϰ��ʶ
  function setWeekDayFlag(areaSn,isSat,isSun){
    try{
      var specialTime=innerSpecial[areaSn];
      if(null!=specialTime && typeof(specialTime)!="undefined"){
        innerSpecial[areaSn].isSat=isSat;
        innerSpecial[areaSn].isSun=isSun;
      }
    }
    catch(error){
      console.error(error);
    }
  }

  var i18n = {
    FORM_IS_CHANGED:"You have some unsaved data on the page!",
    YES:"yes",
    NO:"no",
    FLD_CONFIRM_DELETE:"confirm the deletion?",
    INVALID_DATA:"The data inserted are invalid for the field format.",
    ERROR_ON_FIELD:"Error on field",
    CLOSE_ALL_CONTAINERS:"close all?",



    DO_YOU_CONFIRM:"Do you confirm?"
  };

  