# Descobrir computadores conectados

Dentro do AD rodar em um powershell adm

```powershell
cls;
$items = Get-ADComputer -Filter *;

foreach($item in $items)
{
    try
    {
        if (Test-Connection -Count 1 -Quiet -ComputerName $item.Name)
        {
            Write-Host $item.Name
        }
    }
    catch
    {
        Write-Host "...";
    }
}
```

# Executar a instalação em massa

Criar uma lista.txt com o os computadores (um por linha) e rodar os comandos abaixo

```cmd
psexec @lista.txt -s cmd /c "winrm quickconfig -quiet"
psexec @lista.txt -s cmd /c "dism /online /add-capability /capabilityname:SNMP.Client~~~~0.0.1.0"
psexec @lista.txt -s cmd /c "gpupdate /force"
psexec @lista.txt -s cmd /c "net stop snmp && net start snmp"
```

# Ferramentas

[PsExec v2.33](https://docs.microsoft.com/en-us/sysinternals/downloads/psexec)
