TPgCSV component V 1.31
By: Khashayar Sadjadi (khashi@pragena.8m.com)
http://pragena.8m.com 

Licnese and copyright:
----------------------
TPgCSV compoent is a freeware software, you can use it in your commercial or non-commercial applications for free.
You can freely re-distibute the component if you notice writer in credits.

Summary:
--------
TPgCSV is a component to import and export Delphi Tables to Comma or other Seprated Value files.

Installation:
-------------
Remove old TCSV or TPgCSV component from your Delphi.
Install .bpl file in "Installed packages" of your Delphi. or use source code to install.


Usage:
------
1. Place the component of your Form or DataModule.
2. Set the proprties (See properties section in this readme)
3. Call CSVToDataSet or DataSetToCSV methods.

Properties:
-----------
AutoOpen 	: if you set AutoOpen True, TPgCSV will open the linked table automatically before
		  operation and closes it after that.

BufferSize      : CSV file buffer. This buffer helps you to increase import and export speed.
		  The value is in bytes.

CSVFile		: CSV file. A Text file. Each record in a seperate line, seperated by CR.

CSVMap		: Mapping of CSV file and table fields. A List of field names, started bt value of
		  FieldIndicator value and seprated by Seprator value. Ex: $Name,$Age,$BirthDate

DateFormat	: Format of date type values in CSV. TPgCSV uses this property value to convert date
		  values of CSV file and write them to a dataset. The property value can be like MM/DD/YY

DefaultInt	: Default integer value for CSV integer/real values with wrong characters.

Delimiter	: Character which identifies strings in some CSV files. i.e. " character in 
                  "John","Boy",12 
		  In this case, TPgCSV will ignore Delimiter character of string fields (if any)

EmptyTable	: It will create a new CSV file in case of DataSetToCSV.
		  Nothing changes in case of CSVToDataSet.	

FieldIndicator  : Special character for identifing field names in CSVMap. See CSVMap example.

IgnoreString    : Sepcial string which is used to force TPgCSV ignore some fields in CSVMap.
		  For example: 
		  IgnoreString:='(ignore)';
		  CSVMap:='$Name,(ignore),$Age';
		  In this case, CSVToDataSet will ignore the second field in CSV records.

Seprator	: Seprator character. Offten ,

Dataset		: TDataset in Delphi forms or DataModules to link with TPgCSV for Import and Export.

SilentExport    : Setting this property to True forces TPgCSV to do not raise exceptions and call ExportError event

TrimData	: Setting this property to true, forces TPgCSV to trim CSV values leading and trailing spaces.

UseDelimiter    : By setting this property to True, TPgCSV will know that the importing or exporting CSV file has Delimiter in records

Events:
-------
AfterCloseTable  : Fires after TPgCSV closed dataset.

AfterEmptyTable  : Fires after TPgCSV emptied dataset. This will occure when EmptyTable property is true.

AfterExport      : Fires after export process of a CSV to a dataset finishes.

AfterImport	 : Fires after import process of a dataset to a CSV finishes.

AfterOpenTable   : Fires after TPgCSV opens the dataset. This will occure if AutoOpen property is true.

BeforeCloseTable : Fires before TPgCSV closes the database. This will occure if AutoOpen property is true.

BeforeEmptyTable : Fires before TPgCSV empties the database. This will occure if EmptyTable property is true.

BeforeExport	 : Fires before export process starts from a CSV to a dataset.

BeforeImport     : Fires before import process starts from a dataset to a CSV.

BeforeOpenTable  : Fires before TPgCSV opens dataset. This will occure if AutoOpen property is true.

ExportError	 : Firest each time an exception occures in exporting a CSV to a dataset. 
		   You can force TPgCSV to handle ignore error or abort the process.
		   This event will be fired only if SilentExport property is setted to True.

ExportProgress	 : Fires each time a new record added to a dataset during exporting a CSV to a dataset.
		   You can Stop export progress by setting StopIt parameter to True.

ImportProgress	 : Fires each time a new record added to a CSV during importing a dataset to a CSV.
		   You can Stop import progress by setting StopIt parameter to True.

OnAddRecord	 : Fires each time a new record added to dataset during exporting a CSV to a dataset.

Constant exporting:
-------------------
If you want to export a table to a CSV file and fill one or more record in CSV file with a specific
string, do not put FieldIndicator before the string in CSVMap. For Example:
CSVMap:='$Name,$Age,Student';
This will genrate such a CSV file:
John,12,Student
Mike,15,Student
Bob,13,Student

AutoMapping feature:
----------------------------------------------
If you leave the CSVMap property blank, TPgCSV will use all Dataset fields to generate CSV file
in DataSetToCSV method.

Exception handling:
----------------------------------------------
By setting SilentExport property to True, if an exception occure in CSVToDataset method, TPgCSV will
not raise exception and will call ExportError event with exception message and record number.
You can set the Response parameter to pgcsvIgnore or pgcsvAbort to make TPgCSV handle the exception.
Setting Response to pgcsvIgnore will make TPgCSV ignore current record and it will continue exporting, but
pgcsvAbort will terminate export process at the currect record.
Default value of Response parameter is pgcsvIgnore.

Progress monitoring:
----------------------------------------------
By writing event handlers for ExportProgress and ImportProgress events, you can monitor Import and/or
Export progress during the process. You can also stop process by setting StopIt parameter to True within
event handler.

Important note for coverting programs to V1.1:
----------------------------------------------
Your Delphi may tell you that Table property does not exist. Click Ignore
and set the Dataset property to old Table value.

Important note for coverting programs to V1.2:
----------------------------------------------
Component name has been changed to TPgCSV to avoid name confilicts.
ExportToTable and ImportFromTable has been changed to CSVToDataSet and DataSetToCSV.

Important note for coverting programs to V1.3:
----------------------------------------------
A new parameter added to ExportProgress and ImportProgress events. So, you had to copy old event
handlers to new events.

What's new?
-----------
V1.31 (Current version) A minor bug in DatasetToCSV and CSVToDataset fixed.
V 1.3 			Disable controls and enable controls added to import and export progress
                        Setting default values on creation
                        ShortDateFormat for Date fields
                        TrimData property for Import and Export added (string values)
                        DefaultInt property for defulat value of fault integer fields
                        BufferSize property for buffered read/write from/to CSV files
                        Faster process using cached field names and map items pre-calculating
                        Stop feature in progress events
V 1.2                   Components renamed to TPgCSV to avoid name confilicts.
                        ImportFromTable and ExportToTable renamed to DataSetToCSV and CSVToDataSet
                        UseDelimiter property, for Import and Export.
                        No need to Rx StrUtils.
                        Bug in "two separators without space" solved.
                        Some bugs in using Seprator within a quted (Demlimited) field fixed
                        Some bugs in using Delimiter within a delimited field fixed
                        Exception handling with error event added

V 1.1			TDataset replaces TTable
			Auto map builder for empty map srings
			Note: EmptyTable does not affect on CSVToDataSet

v 1.0			First release.


I would like to thank 
Paul Linehan (plinehan@transaer.ie), 
Poul Dige (poul.dige@tabulex.dk), 
Stevigny Geoffroy (geoffroy.stevigny.918@b-rail.be) 
P. Doland (pdoland@flash.net) 
and all who helped me making this component better.


Please send me emails in case of bugs or problems to:
khashi@pragena.8m.com