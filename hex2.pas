 Unit hex2; 
interface 
function addition(hex1,hex2:string):string;


implementation  
function symtohex(digit: integer): string;
begin
  case digit of
    0..9: Result := Chr(digit + 48);
    10..15: Result := Chr(digit + 55);
  end;
end;

function addition(hex1,hex2:string):string;
  var
  vume, sum, d1, d2: integer;
begin
    while Length(hex1) < Length(hex2) do
    hex1 := '0' + hex1;
  while Length(hex2) < Length(hex1) do
    hex2 := '0' + hex2;
     for var i := Length(hex1) downto 1 do
  begin
    d1 := Pos(hex1[i], '0123456789ABCDEF') - 1;
    d2 := Pos(hex2[i], '0123456789ABCDEF') - 1;
    sum := d1 + d2 + vume;
    vume := sum div 16;
    sum := sum mod 16;
    result := symtohex(sum) + result;
  end;
  if vume > 0 then
    result := symtohex(vume) + result;
end;


end.