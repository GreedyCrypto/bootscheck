program CheckHTML;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function check(var f1: textfile; var f2: textfile): integer;
var
  FSize1: smallint;
  FSize2: smallint;

  changed: boolean;

begin
  AssignFile(f1, 'new.txt');
  AssignFile(f2, './old/new.txt');
  writeln('checking for new Event..');

  try
    reset(f1);
    FSize1 := filesize(f1);
    closefile(f1);

  except
    on EInOutError do
      writeln('Fehler bei der Dateioperation');
    else
      writeln('Laufzeitfehler aufgetreten.');
  end;

  try

    reset(f2);
    FSize2 := filesize(f2);
    closefile(f2);
  except
    on EInOutError do
      writeln('Fehler bei der Dateioperation');
    else
      writeln('Laufzeitfehler aufgetreten.');
  end;

  if FSize1 <> FSize2 then
  begin
    changed := true;
    writeln('FileSize Changed.');
  end;

  case changed of
    true:
      writeln('<------- NEUES EVENT VERFÜGBAR! ------->');
    false:
      writeln('<------- KEIN NEUES EVENT VERFÜGBAR! ------->');
  end;

end;

var
  value1: integer;
  value2: integer;
  checktrigger: boolean;
  f1: textfile;
  f2: textfile;

  /// Hauptprogramm //
begin
  repeat
    // Trigger Check..
    writeln('Starting the Check..');
    check(f1, f2);
  until (checktrigger <> true);

end.
