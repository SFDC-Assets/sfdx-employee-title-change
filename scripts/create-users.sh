USER_ALIAS="${USER_ALIAS:-sfdx-employee-title-change__dev}"
echo creating user w/ USER_ALIAS = $USER_ALIAS
sfdx force:user:create -u $USER_ALIAS -f ../users/employee-def.json 