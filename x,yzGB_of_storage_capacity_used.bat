:: Mit dieser Batch Datei kann die Größe alle Ordner im angegebenen Pfad(siehe 
:: Zeile 39 und 112) ermittelt werden. Hierzu einfach auf die Datei doppelklicken 
:: und der Dateiname verändert sich entsprechend

:: Info:    http://blogs.it-nonstop.de/jd/windows-datei-offnen-sicherheitswarnung-richtig-deaktivieren/
:: Wer auf seinem NAS-Netzwerklaufwerk eine Datei startet, bekommt die folgende
:: Meldung zu sehen:
::Leider ist diese Meldung im lokalen Intranet nicht immer erwünscht.
::Im Internet gibt es viele Tipps dazu wie man mit secpol.msc oder gpedit.msc 
::irgendwelche Dateierweiterungen generell zulassen oder den Schutz ganz 
::deaktivieren soll. Solche Tipps sind nicht nur falsch, sondern auch 
::gefährlich!
::Der richtige Weg ist, seinem Computer klar zu machen, das dieser Ort ein 
::vertrauenswürdiger Ort ist! Der Weg dazu, führt über die 
::Internet Explorer – Internetoptionen – Sicherheit – Lokales Intranet – Sites
::Dort wählt man “Intranet automatisch ermitteln” ab und klickt auf erweitert.
::Jetzt fügt man sein Laufwerk oder Freigabe dem lokalen Intranet manuell hinzu
:: (in diesem Beispiel mein komplettes NAS mit dem Namen jdnas)
::Ab sofort und ohne Neustart kann man Programme von diesem Ort ohne 
::Sicherheitsbestätigung starten :-)
::P.S. Gilt auf allen Windows System ab Windows XP SP2

:: Wenn die ganze Sache nicht funktioniert und die CMD Exe etwas von "UNC Pfade
:: werden nicht unterstützt" ausgibt, dann wie efolgt vorrgehen
::(Registrierungseditor ist ausführbar mit Eingabe von regedit in der Suchzeile
:: (bei Klick auf die Windows Taste))
::Unter dem folgenden Registrierungspfad:  
::
::   HKEY_CURRENT_USER
::      \Software
::         \Microsoft
::            \Command Processor
::				
:: fügen Sie den Wert DisableUNCCheck REG_DWORD hinzu und setzen den Wert auf
:: 0 x 1 (Hexadezimal). 
:: https://support.microsoft.com/en-us/kb/156276/de

echo off
::in der Variable %cd% steht das aktuelle Verzeichnis "werkseitig" schon drinnen
set "folder=%cd%" 
set "size=%temp%\GetFolderSize.vbs 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
:: echo                                  Bitte warten
echo                                  Please wait
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo WScript.Echo Int(CreateObject("Scripting.FileSystemObject").GetFolder(WScript.Arguments(0)).Size/1024/1024+.99)>%size% 
for /f %%i in ('cscript //nologo %size% "%folder%"') do set folder_size=%%i 
echo %folder_size%
del %size%
set bu=1000
set Stellen=3
set R=%temp%\Rechne.vbs 
echo Set a=WScript.Arguments:WScript.Echo FormatNumber(Eval(Replace(a(0),",",".")),a(1))>%R% 
for /f %%i in ('cscript //nologo %R% "%folder_size%/%bu%" %Stellen%') do set Ergebnis=%%i 
echo %Ergebnis%
del %R%
:: Im Folgenden eine kleine Korrekturberechnung ??? k.A. wieso weshalb warum
:: Faktor 1,025   ~oder 1024/1000  ???? einfach durch ausprobieren --> stimmt
:: immer noch nicht wirklich
set buzwei=1025
set Stellenzwei=3
set F=%temp%\Rechnezwei.vbs 
echo Set b=WScript.Arguments:WScript.Echo FormatNumber(Eval(Replace(b(0),",",".")),b(1))>%F% 
for /f %%o in ('cscript //nologo %F% "%Ergebnis%/(%buzwei%/%bu%)" %Stellenzwei%') do set Ergebniszwei=%%o 
echo %Ergebniszwei%
del %F%
::
::cd /d C:\Users\[User]\Dropbox
set "var100=%Ergebniszwei%" 
echo #%var100%# 
:loop1 
if "%var100:~0,1%"==" " set "var100=%var100:~1%" & goto :loop1 
:loop2 
if "%var100:~-1%"==" " set "var100=%var100:~0,-1%" & goto :loop2 
echo "%var100%"
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
:: echo                Speicherkapazitaet %var100%GB belegt
echo                 %var100%GB of storage capacity used
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
:: Falls die Batch Datei woanders liegt als der zu untersuchende Ordner, so 
::müsste der folgende Befehl noch eingefügt werden
:: cd /d C:\Users\Tim\Desktop\fuhg
::rename "Speicherkapazitaet*.bat" "Speicherkapazitaet %var100%GB belegt.bat"
rename "*GB_of_storage_capacity_used.bat" "%var100%GB_of_storage_capacity_used.bat"
pause
exit