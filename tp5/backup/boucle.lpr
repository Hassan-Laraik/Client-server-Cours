program boucle;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes ,sysutils
  { you can add units after this };
 var
   i       :integer;
   Message : string ;
   Notes  : Array[1..20] of Integer ;
begin
   Writeln('Remplissage De La Liste Des Notes');
   i := 1;
   while i <= 20 do
   begin
     Write('Donnez La Note N° ' + IntToStr(i) + ' : ');
     ReadLn(Notes[i]);
     i := i+1;
   end;
   Writeln('#############################################');
   Writeln('Lister Les Notes Des Eleves ..');
   i := 1;
   while i <= 20 do
   begin

     if Notes[i] < 10 then
        begin
             Write('La Note De Eleve N° ' + IntToStr(i) + ' : ' + IntToStr(Notes[i]));
        end;
     i := i+1;
   end;
end.

{
{for i := 1 to 10 do
   begin
      message := 'Compte' +  IntToStr(i);
      WriteLn(message);

   end;
   }
    i := 1;
    while  i <= 10 do
   begin
      message := 'Compte' +  IntToStr(i);
      WriteLn(message);
      i:=i+1;
   end;
    readln();
}
