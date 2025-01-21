## Stale Computers List Export
Exports CSV of all machines whose last login date is equal or older than today's date minus the number of days in the $day variable.  Default is set to -365, so any machine's that haven't logged on in a year will be listed.  Ignores machines in any "Disabled" OUs.

Any machines not seen by your DC for over 6 months will have lost trust and will need to be rejoined to the domain regardless so can be deleted, however if your bitlocker keys are stored in AD, deleting the computer object will orphan or delete the bitlocker key object, making recovery impossible, even after rejoining the domain.  For bitlockered machines, disabling is always preferable.
