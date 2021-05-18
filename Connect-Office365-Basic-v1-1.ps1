############################################################################################################################
###                                                                                                                      ###
###  	Script by Terry Munro -                                                                                          ###
###     Technical Blog -               http://365admin.com.au                                                            ###
###     Webpage -                      https://www.linkedin.com/in/terry-munro/                                          ###
###     GitHub Scripts -               https://github.com/TeamTerry                                                      ###
###                                                                                                                      ###
###     GitHub Download link -         https://github.com/TeamTerry/Office-365-Connection-Script---Basic                 ###
###                                                                                                                      ###
###     Support -                      http://www.365admin.com.au/2017/01/how-to-connect-to-office-365-via.html          ###
###                                                                                                                      ###
###     Version 1.0 - 07/02/2017                                                                                         ###
###     Version 1.1 - 04/06/2017       Minor updates and updated name to show that it is a basic connection script       ### 
###                                                                                                                      ###
###                                                                                                                      ###
############################################################################################################################

###   Notes
###
###   This PowerShell connection script only connects to the following Office 365 Services
###   - Exchange Online
###   - Azure AD v1.0 - MSOL
###   - Azure AD v2.0 - Azure AD

###   For a PowerShell connection script that connects to ALL Office 365 Services, download my script for TechNet Gallery 
###   Download link - https://gallery.technet.microsoft.com/office/Office-365-and-Azure-e36eabeb


#####################################################################################################

###                      Edit the variable below with your details                                ###

$Cred = Get-credential "admin@tenant.onmicrosoft.com"

#####################################################################################################



###   Exchange Online
$cred
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection
Import-PSSession $Session –AllowClobber


###   Azure Active Directory v1.0
Import-Module MsOnline
Connect-MsolService -Credential $cred


### Azure AD v2.0
Connect-AzureAD -Credential $cred
