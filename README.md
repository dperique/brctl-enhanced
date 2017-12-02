# A Script to Enhance the 'brctl' Command

If you have to do work with VMs and hooking them together into networks for
various purposes, you will undoubtedly have to use bridges and the brctl command.

The brctl command is useful but, sometimes, it can be cumbersome to use.

For example:

* removing an interface from a bridge requires you to first find that
bridge
* deleting a bridge requires the bridge to be down.

This script attempts to make things a little better.


