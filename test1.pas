program test21;

var n, f: real;
function factorial(n: real;): real;
var q, l: real;
begin
  if(n > 0) then
    begin
    q := n-1;
    writeln(q);
    l := factorial(q);
    factorial := n*l;
    writeln(factorial);
    end;
  else
    factorial:=1;
end;

begin
  n:= 5;
  f:=factorial(n);
  writeln(f);
end.