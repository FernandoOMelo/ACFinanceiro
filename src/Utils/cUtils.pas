unit cUtils;

interface

type
  TUtils = class
    class function GetID: String;
  end;
implementation

uses
  System.SysUtils;

{ TUtils }

class function TUtils.GetID: String;
begin
  Result := TGUID.NewGuid.ToString;
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

end.
