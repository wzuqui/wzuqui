param (
  [Parameter(Mandatory=$true)][string]$xml,
  [Parameter(Mandatory=$true)][string]$xdt,
  [Parameter(Mandatory=$true)][string]$output
)
if (!$xml -or !(Test-Path -path $xml -PathType Leaf)) {
    throw "File not found. $xml";
}
if (!$xdt -or !(Test-Path -path $xdt -PathType Leaf)) {
    throw "File not found. $xdt";
}

$transformDll = ""
if(Test-Path "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v12.0\Web\Microsoft.Web.XmlTransform.dll"){
    $transformDll = "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v12.0\Web\Microsoft.Web.XmlTransform.dll"
}
if(($transformDll -eq "")-and(Test-Path "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v11.0\Web\Microsoft.Web.XmlTransform.dll")){
    $transformDll = "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v11.0\Web\Microsoft.Web.XmlTransform.dll"
}
if(($transformDll -eq "")-and(Test-Path "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v10.0\Web\Microsoft.Web.XmlTransform.dll")){
    $transformDll = "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v10.0\Web\Microsoft.Web.XmlTransform.dll"
}
if($transformDll -eq ""){
    $scriptPath = (Get-Variable MyInvocation -Scope 0).Value.InvocationName | split-path -parent
    $transformDll = [IO.Path]::Combine($scriptPath, '.\Microsoft.Web.XmlTransform.dll')
}
if(!(Test-Path -path $transformDll)){
    throw "Microsoft.Web.XmlTransform.dll not found";
}

Add-Type -Path $transformDll

$xmldoc = New-Object Microsoft.Web.XmlTransform.XmlTransformableDocument;
$xmldoc.PreserveWhitespace = $true
$xmldoc.Load($xml);

$transf = New-Object Microsoft.Web.XmlTransform.XmlTransformation($xdt);
if ($transf.Apply($xmldoc) -eq $false)
{
    throw "Transformation failed."
}
$xmldoc.Save($output);