## Disabled Users Sweep & Delete script
This script is designed to be run on a regular schedule, most commonly daily.  It will sweep all disabled users across AD into the OU specified in the DisabledOU variable, set today's date in the attribute specified in the ADAttribute variable, and then finally delete any users whose ADAttribute date is older than the age specified in the MaxAge variable.
