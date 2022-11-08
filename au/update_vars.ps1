# AU Packages Template: https://github.com/majkinetor/au-packages-template
# Copy this file to update_vars.ps1 and set the variables there. Do not include it in the repository.

if(!(Test-Path Env:mail_user)) {
    $Env:mail_user        = $Mail_user
    $Env:mail_pass        = $Mail_pass
    $Env:mail_server      = 'smtp.gmail.com'
    $Env:mail_port        = '587'
    $Env:mail_enablessl   = 'true'
}