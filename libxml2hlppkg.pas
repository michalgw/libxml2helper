{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit libxml2hlppkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  xml2helpers, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('libxml2hlppkg', @Register);
end.
