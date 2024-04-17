Unit HexMath; 
interface 
function HexCalc(number1,sign,number2:string):string;
function hextoint(number: string): biginteger;
function IntToHex(number:biginteger):string;  


implementation  

function IntToHex(number:biginteger):string; 
  begin 
  var hex:='0123456789ABCDEF'; 
  while number >0 do 
    begin 
      result:= hex[integer((number mod 16) +1)] + result; 
      number:= number div 16;
    end; 
end;  

function hextoint(number: string): biginteger;
var
  hex := '0123456789ABCDEF';
  power16: bigInteger;
begin
  for var i := 1 to Length(number) do
  begin
    power16 := 1;
    for var j := 1 to Length(number) - i do
      power16 := power16 * 16;
    result := result + biginteger(pos(number[i], hex) - 1) * power16;
  end;
end;


function HexCalc(number1,sign,number2:string):string; 
begin 
var a:biginteger;
a:=1;
var b:=0;
case sign of 
'+': result := IntToHex(HexToInt(number1) + HexToInt(number2)); 
'-': result := IntToHex(HexToInt(number1) - HexToInt(number2)); 
'*': result := IntToHex(HexToInt(number1) * HexToInt(number2)); 
'/': result := IntToHex((HexToInt(number1) / HexToInt(number2))); 
'**': 
  begin
    while b<>HexToInt(number2) do
      begin
      a := a*(HexToInt(number1));
      b+=1;
      end;
      result := inttohex(a);
  end; 
end; 

end;
end.