program test9;
var a,b : real;
begin
  a := 1;
  while (a<3) do
  begin
  a := a + 1;
  writeln(a);
  break;
  a:=3;
  end;
end.