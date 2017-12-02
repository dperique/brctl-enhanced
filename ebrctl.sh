#!/bin/bash
if [ "$2" == "" ]; then
  echo "./ebrctl.sh <anIface> <aBridge>"
  echo ""
  echo "Find <anIface>, remove it from any bridge, create <aBridge>"
  echo "unless it's already there, put <anIface> into <aBridge>."
  echo ""
  echo "If <aBridge> is none, then remove <anIface> from any bridge." 
  echo "If <anIface> is none, then delete the bridge."
  echo ""
  exit 0
fi

iface=$1
bridge=$2

if [ "$iface" == "none" ]; then
  brctl show $bridge
  echo "INFO Setting $bridge to down state"
  ifconfig $bridge down
  echo "INFO Deleting $bridge"
  brctl delbr $bridge
  exit $?
fi

# Example.
#
# iface=ge-0.0.0-vmx01
# bridge=br77a

# Find the bridge our interface resides in.
#

# Loop through all bridges and remove this interface
# We brctl show, get the first column, get rid of blanks, remove first line.
#
found=0
found_iface=0
for i in $(brctl show| cut -f1| awk NF | sed -n '1!p'); do
  if [ "$i" == "$bridge" ]; then
    found=1
    echo "INFO $bridge already exists"
  fi

  # If there's an error, silently ignore.
  #
  brctl delif $i $iface 2> /dev/null
  if [ $? -eq 0 ]; then
    echo "INFO Interface $iface was on $bridge"
    found_iface=1
    break
  fi
done
  
if [ $found -eq 0 ]; then
  echo "INFO Adding bridge $bridge"
  if [ "$bride" == "none" ]; then
    echo ""
  else
    brctl addbr $bridge
  fi
fi
if [ $found_iface -eq 0 ]; then
  echo "INFO Interface $iface was not on any bridge"
fi
if [ "$bridge" == "none" ]; then
  echo "INFO Leaving $iface out of a bridge"
  brctl show $i
else
  echo "INFO Adding $iface to $bridge"
  brctl addif $bridge $iface
  brctl show $bridge
fi
