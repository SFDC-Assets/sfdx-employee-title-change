# sfdx-employee-title-change

This is a SFDX project that demonstrates using a combination of process automation features together to implement a Employee Title Change process. 

## Development

For this solution, employees are represented as PersonAccounts and the "Account" object label has been renamed to "Employee Account". 

To work on this project in a scratch org:

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
2. Run `cci flow run dev_org --org dev` to deploy this project.
3. Run `cci org browser dev` to open the org in your browser.