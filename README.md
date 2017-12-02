# A Script to Enhance the 'brctl' Command

If you have to do work with VMs and hooking them together into networks for
various purposes, you will undoubtedly have to use bridges and the brctl command.

The brctl command is useful but, sometimes, it can be cumbersome to use.

For example:

* removing an interface from a bridge requires you to first find that
bridge
* deleting a bridge requires the bridge to be down.

This script attempts to make things a little better.

Examples:

```
# Show help.
#
$ ./ebrctl.sh
./ebrctl.sh <anIface> <aBridge>

Find <anIface>, remove it from any bridge, create <aBridge>
unless it's already there, put <anIface> into <aBridge>.

If <aBridge> is none, then remove <anIface> from any bridge.
If <anIface> is none, then delete the bridge.

# Remove the interface eth1 from any bridge.
#
./ebrctl.sh eth1 none

# Delete a bridge called my_bridge.
#
./ebrctl.sh none my_bridge

# Create a bridge called 'my_br' and put interface 'ens3' in it.
# Note that we print out the bridge and its contents so you can quickly
# verify the script did what you want.
#
$ ./ebrctl.sh ens3 my_br
INFO Adding bridge my_br
INFO Interface ens3 was not on any bridge
INFO Adding ens3 to my_br
bridge name	bridge id		STP enabled	interfaces
my_br		8000.fa163e759166	no		ens3

```

