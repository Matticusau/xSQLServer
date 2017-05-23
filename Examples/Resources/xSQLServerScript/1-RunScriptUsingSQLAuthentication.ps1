<#
.EXAMPLE
    This example shows how to run SQL script using SQL Authentication.
#>

Configuration Example
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $SqlCredential
    )

    Import-DscResource -ModuleName xSQLServer

    Node localhost
    {
        xSQLServerScript 'RunSQLScript'
        {
            ServerInstance = 'localhost\SQL2016'
            Credential = $SqlCredential

            SetFilePath = 'C:\DSCTemp\SQLScripts\Set-RunSQLScript.sql'
            TestFilePath = 'C:\DSCTemp\SQLScripts\Test-RunSQLScript.sql'
            GetFilePath = 'C:\DSCTemp\SQLScripts\Get-RunSQLScript.sql'
            Variable = @("FilePath=C:\temp\log\AuditFiles")
        }
    }
}
