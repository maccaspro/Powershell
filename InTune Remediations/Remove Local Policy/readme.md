## Remove local policy from device
This remediation detects the presence of any local computer policy set on an endpoint, and on a positive detection, removes the file that sets it.  This results in any settings reverting to "Not Configured" state, though preferences will remain tattooed on device.

Changing the $path variable on remediation script to /user instead of /machine will clear local user policy.
