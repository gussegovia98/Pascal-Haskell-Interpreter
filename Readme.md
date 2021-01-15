## P3 By:
Gus Segovia, Hunter Jarrell
## Running the provided code
To run any of the tests and it will run them all.
```
cabal run Pascal tests/test#.pas
```
The tests can be ran indivually and will output the correct values onto the console.

## Situations/Assumptions

The new things implemented

While loops:

 We parsed out the begin and end blocks and a  statement block which we can then run multiple times given that it is iterating in the loop. 
```
while (a<5) do
  begin
   a := a + 1;
   writeln(a);
  end;
```

For loops:

Same idea with saving the block and storing for later, for the number of times We simply store the start value,the end value and run the code agan while increasing the start value on each call.
```
for a := 10 to 20 do
   begin
      writeln(a);
   end
```

Functions:

They can be declared and defined and it runs the code in them correctly, we also implemented the bonus for parameter passing where we can do things like ```ret := max(a, b);```
```
function max(num1, num2: real): real;
var
   result: real;

begin
   if (num1 > num2) then
      result := num1;

   else
      result := num2;
   max := result;
end.
```

Scoping:

We implemented scoping in a lot functions, the general idea was that there was a stack of variables which we can pull from at each scope. Corresponding haskell code below. 

```haskell
pushScope :: PrgmData -> PrgmData
pushScope (stdOut, stdErr, didErr, hd:tl, loopFlg,funcMap) = (stdOut, stdErr, didErr, [hd, hd] ++ tl, loopFlg,funcMap)
pushScope (stdOut, stdErr, didErr, stack, loopFlg,funcMap) = (stdOut, stdErr, didErr, stack ++ stack, loopFlg,funcMap)

popScope :: PrgmData -> PrgmData
popScope (stdOut, stdErr, didErr, _hd:tl, loopFlg,funcMap) = (stdOut, stdErr, didErr, tl, loopFlg,funcMap)
popScope (stdOut, stdErr, didErr, [], loopFlg,funcMap) = (stdOut, stdErr, didErr, [], loopFlg,funcMap)
```
This pushes scopes in and out when needed.
