Unit EExpr;
interface

uses Sysutils,translationunit;

Type
  THistory=array[1..200] of string;

const Charset:set of char=[')','(','*','+','-','/',' ','=','^','|','~'];

var Move:Array[0..28] of String=('Moving "','" to the right side with sign "','".','Enclosing with brackets and moving the minus on the other side','Enclosing the right side with brackets before multiplying or dividing.','Multiplying the right side by ','.','Dividing the right side by ','.','Multiplying the right side by ','.','Dividing ',' by the right side.','Enclosing the right side with brackets before powering,rooting or logarithming.','Powering the right side by ','.','Rooting the right side by ','.','Logarithming the right side by ','.','Powering the right side by ','.','Rooting the right side by ','.','Logarithming the right side by ','.','Removing the outer brackets on the left side.','The original formula is:','The final result is:');
procedure translate;

Procedure Express(variable:string;
                  var Formula:String;
                  var History:THistory);

function Inside(variable,formula:string;St,En:integer):boolean;

var History:THistory;

implementation



function Inside(variable,formula:string;St,En:integer):boolean;
var position,i,j:integer;
    TempStr:String;
    var f:boolean;

function Surrounded:boolean;
var lefty,righty:boolean;
begin
  if position =1 then lefty:=true
    else
      if TempStr[position-1]in CharSet
      then lefty:=true;

  if position+Length(Variable)-1=Length(TempStr) then righty:=true
    else
      if TempStr[position+Length(variable)] in CharSet
      then righty:=true;

Surrounded:=lefty and righty;
end;

begin
  i:=0;
  repeat
  TempStr:=copy(formula,St+i,En-St-i+1);


  if TempStr<>'' then
  if TempStr[length(TempStr)]='(' then
  begin
//    Edit This one too 
    inside:=false;
    exit;
  end;
//  for j:=1 to length(TempStr) do TempStr[j]:=UpCase(TempStr[j]);

  if i=0 then f:=true
  else f:=TempStr[i] in charset;

  position:=pos(variable,TempStr);
  if position=0 then
    begin
	 Inside:=false;
	 exit;
    end
  else
    if Surrounded and f then
		begin
      inside:=true;
      exit;
		end
  else
	  begin
		  inside:=false;
		  i:=i+1;
	 end;
  until i>=length(formula);
end;



Procedure Express(variable:string;
                  var Formula:String;
                  var History:THistory);
var Left,Right:String;
    Equal:integer;
    TempStr,sti:String;
    L,R:Boolean;
    i:integer;
    line:integer;


{====================== Scan for Bracket Group ==========================}

Function ScanBracket(  CurPos:integer;
				   var formula:string;
				   var St:integer;
				   var En:integer):byte;
var Counter:integer;
    i:integer;
begin
  ScanBracket:=0;
  St:=-1;
  En:=-1;
  counter:=0;
  i:=curpos;
  repeat
    if Formula[i]='(' then
	 begin
		 inc(counter);
	   if st=-1 then st:= i;
	    end;
    if (Formula[i]=')')and(st<>-1) then dec(counter);
    if (counter=0)and(not (st=-1)) then en:=i;
    inc(i);
  until (i-1>=length(formula))or(En<>-1);
  if counter<>0 then ScanBracket:=1;
end;

{================== Scan for Add and Substract ==========================}

Function ScanPlus(  CurPos:integer;
				var formula:string;
				var Pos:integer ):byte;
var i:integer;
    Sp:integer;

begin
  ScanPlus:=0;
  Pos:=-1;
  i:=curpos;
  ScanPlus:=0;
  repeat
    if Formula[i] in ['+','-'] then
	 begin
	   Pos:=i;
	   ScanPlus:=0;
	   exit;
	 end;

    if Formula[i]=')' then
	 begin
	   ScanPlus:=2;
	   Exit;
	 end;

    if Formula[i]='(' then
	 if ScanBracket(i,formula,sp,i)<>0 then
	   begin
		ScanPlus:=1;
		exit;
	   end;

    i:=i+1;
  until i>Length(formula);
  Pos:=0;
  ScanPlus:=0;
end;

{====================== Scaning for Multyply and Divide ===================}

Function ScanMulty( CurPos:integer;
		    var formula:string;
		    var Pos:integer ):byte;
var i:integer;
    Sp:integer;

begin
  Pos:=-1;
  i:=curpos;
  repeat
    if Formula[i] in ['*','/'] then
	 begin
	   Pos:=i;
	   ScanMulty:=0;
	   exit;
	 end;

    if Formula[i] in ['+','-'] then
	 begin
	   Pos:=0;
	   ScanMulty:=3;
	   exit;
	 end;

    if Formula[i]=')' then
	 begin
	   ScanMulty:=2;
	   Exit;
	 end;

    if Formula[i]='(' then
	 if ScanBracket(i,formula,sp,i)<>0 then
	   begin
		ScanMulty:=1;
		exit;
	   end;

    i:=i+1;
  until i>=Length(formula);
  Pos:=0;
  ScanMulty:=0;
end;

{====================== Scaning for Power, Root and Log ===================}

Function ScanPow( CurPos:integer;
		    var formula:string;
		    var Pos:integer ):byte;
var i:integer;
    Sp:integer;

begin
  Pos:=-1;
  i:=curpos;
  repeat

    if Formula[i] in ['^','|','~'] then
	 begin
	   Pos:=i;
	   ScanPow:=0;
	   exit;
	 end;

    if Formula[i] in ['*','/'] then
	 begin
	   Pos:=0;
	   ScanPow:=4;
	   exit;
	 end;

    if Formula[i] in ['+','-'] then
	 begin
	   Pos:=0;
	   ScanPow:=3;
	   exit;
	 end;

    if Formula[i]=')' then
	 begin
	   ScanPow:=2;
	   Exit;
	 end;

    if Formula[i]='(' then
	 if ScanBracket(i,formula,sp,i)<>0 then
	   begin
		ScanPow:=1;
		exit;
	   end;

    i:=i+1;
  until i>=Length(formula);
  Pos:=0;
  ScanPow:=0;
end;

{=========================================================}

Procedure VarPos(variable,formula:string;var St,En:integer);
var position,i:integer;
    TempStr:String;
    BrL,BrR:Integer;
begin
  St:=-1;
  En:=-1;
  i:=0;
  repeat
  TempStr:=copy(formula,i,length(formula));
  position:=pos(variable,TempStr);
  if position=0 then
    begin
	 exit;
    end
  else
    if not(((TempStr[position-1] in ['(','*','+','-','/','^','|','~',' '])or(position=1))and
	   (TempStr[position+Length(variable)] in [')','*','+','-','/','^','|','~',' '])
	   or(position+Length(Variable)-1=Length(TempStr)))
	   then
		begin
		  i:=i+1;
		end
    else
	 begin
           BrL:=0;
           repeat
           ScanBracket(BrL+1,formula,BrL,BrR);
	   St:=position;
           En:=position+Length(Variable)-1;
           if (BrL<St)and(BrR>En) then
             begin
               St:=BrL;
               En:=BrR;
               BrR:=-1;
             end;
           until BrR=-1;
	   exit;
	 end;
  until i>=length(formula);
end;

{======================= Moves according to the +/- =============}

Procedure MovePlus( variable:string;
        	    Var Left,
	            Right:string);
var
  sign :char;      //The new sign
  TempStr:string;  //The piece that has to be moved
  St,En:integer;   //Start and end of +/- group
  i:integer;       //Current position in the formula
  temp:integer;
label Finish;

begin
  i:=0;       //starting from 0
  st:=0;      //same...
  repeat
    if ScanPlus(St+1,Left,En)<>0 then goto finish; //We've got a problem with the Problem brackets
    if En=0 then En:=Length(Left)+1;               //If there are no brackets
    if st=0 then st:=1;                            //then take the whole left side

    if Inside(variable,Left,St,En) then St:=En     //Don't move the group if there is an unknown inside
    else
  	  begin
	      if Left[st]='-' then sign:='+'             //If it is a positive number then it turns into negative
           	  		     else sign:='-';             //and vice versa
        if not(Left[st] in ['+','-']) then TempStr:=Copy(Left,st,En-St)      //Taking the group (regarding whether there is a sign in front)
                                  	  else TempStr:=Copy(Left,St+1,En-St-1);
    	  if TempStr='' then goto finish;            //If the signs follow one after another then no need to move a thing
        Delete(Left,St,En-St);                     //Rmove the group from the lft side
 	      Right:=Right+sign+TempStr;                 //And add it to the right with the nw sign

           History[line]:=Move[0]+tempstr+Move[1]+sign+Move[2];
           inc(line);
           History[line]:=Left+'='+Right;
           inc(line);

	    end;
    inc(i);                                        //Then move ahead
  until (i>length(Left)){or(TempStr='')};

finish:                                            //Some final adjustments

  if Right[1]='+' then delete(Right,1,1);          //like... +a=a
  if Left[1]='+' then delete(left,1,1)             //...
    else
	 if Left[1]='-' then                             //or -a=b => a=-(b)
	   begin
		Delete(left,1,1);
		Insert('-(',Right,1);
		Right:=Right+')';

                History[line]:=Move[3];
                inc(line);
                History[line]:=Left+'='+Right;
                inc(line);
	   end;

end;

Procedure MoveMulty( variable:string;
        	     Var Left,
	             Right:string);
var
  sign :char;
  TempStr:string;
  St,En:integer;
  i,j:integer;
  after:boolean;
label Back;
begin
  MovePlus(variable,Left,Right);
  ScanMulty(1,left,j);
 {ScanPlus(1,Left,i);
  if (i<>0)or(j=0) then exit;}
  if j>0 then
    begin
      Right:='('+Right+')';
//      Insert('(',Right,1);

      History[line]:=Move[4];
      inc(line);
      History[line]:=Left+'='+Right;
      inc(line);

    end
  else exit;

  VarPos(variable,Left,St,En);
  sign:=' ';
  if En<length(Left) then
    begin
      case Left[en+1] of
        '*':begin
              Sign:='/';
              after:=true;
            end;
        '/':begin
              Sign:='*';
              after:=true;
            end;
      end;
      TempStr:=copy(Left,En+2,Length(Left)-en-1);
      Delete(Left,En+1,Length(Left)-en);
      if after then
        Right:=Right+sign+'('+TempStr+')'
      else
        insert(TempStr+sign,Right,1);

        case sign of
             '*':History[line]:=Move[5]+TempStr+Move[6];
             '/':History[line]:=Move[7]+TempStr+Move[8];
        end;
        inc(line);
        History[line]:=Left+'='+Right;
        inc(line);
    end;


  VarPos(variable,Left,St,En);
Back:
  if St>1 then
    begin
      case Left[st-1] of
        '*':begin
              Sign:='/';
              after:=true;
            end;
        '/':begin
              Sign:='/';
              after:=false;
            end;
      end;
      TempStr:=copy(Left,1,st-2);
      Delete(Left,1,st-1);
      if after then
          Right:=Right+sign+'('+TempStr+')'
      else
        begin
          insert(TempStr+sign+'(',Right,1);
          Right:=Right+')';
        end;

        case sign of
             '*':History[line]:=Move[9]+TempStr+Move[10];
             '/':History[line]:=Move[11]+TempStr+Move[12];
        end;
        inc(line);
        History[line]:=Left+'='+Right;
        inc(line);
    end;
end;

Procedure MovePow( variable:string;
        	     Var Left,
	             Right:string);
var
  sign :char;
  TempStr:string;
  St,En:integer;
  i,j:integer;
  after:boolean;
label Back;
begin
  MoveMulty(variable,Left,Right);
  ScanPow(1,left,j);
 {ScanPlus(1,Left,i);
  if (i<>0)or(j=0) then exit;}
  if j>0 then
    begin
      Right:='('+Right+')';
//      Insert('(',Right,1);

      History[line]:=Move[13];
      inc(line);
      History[line]:=Left+'='+Right;
      inc(line);

    end;

  VarPos(variable,Left,St,En);
  sign:=' ';
  if En<length(Left) then
    begin
      case Left[en+1] of
        '^':begin
              Sign:='|';
              after:=true;
            end;
        '|':begin
              Sign:='^';
              after:=true;
            end;
        '~':begin
              Sign:='^';
              after:=false;
            end;
      end;
      TempStr:=copy(Left,En+2,Length(Left)-en-1);
      Delete(Left,En+1,Length(Left)-en);
      if after then
        Right:=Right+sign+'('+TempStr+')'
      else
        insert(TempStr+sign,Right,1);

        case sign of
             '^':History[line]:=Move[14]+TempStr+Move[15];
             '|':History[line]:=Move[16]+TempStr+Move[17];
             '~':History[line]:=Move[18]+TempStr+Move[19];
        end;
        inc(line);
        History[line]:=Left+'='+Right;
        inc(line);
    end;


  VarPos(variable,Left,St,En);
Back:
  if St>1 then
    begin
      case Left[st-1] of
        '^':begin
              Sign:='~';
              after:=true;
            end;
        '|':begin
              Sign:='~';
              after:=false;
            end;
        '~':begin
              Sign:='|';
              after:=false;
            end;
      end;
      TempStr:=copy(Left,1,st-2);
      Delete(Left,1,st-1);
      if after then
          Right:=Right+sign+'('+TempStr+')'
      else
        begin
          insert(TempStr+sign+'(',Right,1);
          Right:=Right+')';
        end;

        case sign of
             '^':History[line]:=Move[20]+TempStr+Move[21];
             '|':History[line]:=Move[22]+TempStr+Move[23];
             '~':History[line]:=Move[24]+TempStr+Move[25];
        end;
        inc(line);
        History[line]:=Left+'='+Right;
        inc(line);
    end;
end;

Procedure MoveBracket( variable:string;
        	        Var Left,
	                Right:string);
begin
  MovePow(variable,Left,Right);
  if (Left[1]='(')and(left[length(left)]=')') then
    begin
      Delete(left,1,1);
      Delete(left,length(Left),1);

      History[line]:=Move[26];
      inc(line);
      History[line]:=Left+'='+Right;
      inc(line);

      MoveBracket(variable,Left,Right);
    end;
end;


begin
  for i:=1 to 200 do
    History[i]:='';
//  for i:=1 to Length(Formula) do
//      Formula[i]:=UpCase(Formula[i]);

//  for i:=1 to Length(Variable) do
//    Variable[i]:=UpCase(Variable[i]);

  l:=false;
  r:=False;
  Equal:=pos('=',Formula);
  if Equal=0 then
    begin
      Exit;
    end;

  line:=1;
  History[line]:=Move[27];
  inc(line);
  History[line]:=Formula;
  inc(line);

  TempStr:=Copy(Formula,1,Equal-1);
  if Inside(variable,TempStr,1,length(TempStr)) then
    begin
      l:=true;
      Left:=TempStr;
      sti:=TempStr;
    end
  else
    begin
      l:=false;
      Right:=TempStr;
    end;

  TempStr:=Copy(Formula,Equal+1,Length(formula)-Equal);
  if Inside(variable,TempStr,1,length(TempStr)) then
    begin
      r:=true;
      Left:=TempStr;
    end
  else
    begin
      r:=false;
      Right:=TempStr;
    end;

  if not(l or r) then
    begin
      Exit;
    end;

  if l and r then 
  begin
    Left:=Left+'-'+sti;
    Right:='0';
  end;

  MoveBracket(variable,Left,Right);
  History[line]:=Move[28];
  inc(line);
  History[line]:=Left+'='+Right;
  formula:=Left+'='+Right;

end;

procedure translate;
begin
  Move[0]:=GetWord('Express0','Moving "');
  Move[1]:=GetWord('Express1','" to the right side with sign "');
  Move[2]:=GetWord('Express2','".');
  Move[3]:=GetWord('Express3','Enclosing with brackets and moving the minus on the other side.');
  Move[4]:=GetWord('Express4','Enclosing the right side with brackets before multiplying or dividing.');
  Move[5]:=GetWord('Express5','Multiplying the right side by ');
  Move[6]:=GetWord('Express6','.');
  Move[7]:=GetWord('Express7','Dividing the right side by ');
  Move[8]:=GetWord('Express8','.');
  Move[9]:=GetWord('Express9','Multiplying the right side by ');
  Move[10]:=GetWord('Express10','.');
  Move[11]:=GetWord('Express11','Dividing ');
  Move[12]:=GetWord('Express12',' by the right side.');
  Move[13]:=GetWord('Express13','Enclosing the right side with brackets before powering,rooting or logarithming.');
  Move[14]:=GetWord('Express14','Powering the right side by ');
  Move[15]:=GetWord('Express15','.');
  Move[16]:=GetWord('Express16','Rooting the right side by ');
  Move[17]:=GetWord('Express17','.');
  Move[18]:=GetWord('Express18','Logarithming the right side by ');
  Move[19]:=GetWord('Express19','.');
  Move[20]:=GetWord('Express20','Powering the right side by ');
  Move[21]:=GetWord('Express21','.');
  Move[22]:=GetWord('Express22','Rooting the right side by ');
  Move[23]:=GetWord('Express23','.');
  Move[24]:=GetWord('Express24','Logarithming the right side by ');
  Move[25]:=GetWord('Express25','.');
  Move[26]:=GetWord('Express26','Removing the outer brackets on the left side.');
  Move[27]:=GetWord('Express27','The original formula is:');
  Move[28]:=GetWord('Express28','The final result is:');
//,,'.',,'.',,'.',,'.',,,);
end;

end.
