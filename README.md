# vm-scripts

### vm/
The 'vm/' directory contains scripts used to create / start / stop / snapshot
virtual machines using bhyve. The main script is 'vm/runvm'. It receives
parameters either directly as short/long optargs -
e.g., `runvm [..] --vmname=vm`, or envirnonment variables -
e.g., `export VMNAME=vm`.

The 'vmrun' script calls other scripts that are located in subdirectories
from the same work directory (defaults to the directory where vmrun is put in).
The script default subdirectory names (those the script sets when receiving
short optargs for) are 'freebsd / linux / linux-gui / windows-cli / windows',
by using the '<none - default value> / -l / -L / -w / -W' arguments
respectively. Other values can be set through the '--guest-type' optarg, or the
'GUEST_TYPE' environment variables to specify the subdirectory name. Please
not that the relevant scripts must be created in the relevant subdirectory.
You can create those using the scripts in any of the existing directory.

An usage example that sets the parameters through the command line would be
`runvm --memsize 3G --cpus 2 --iso /path/to/installer.iso --guestimg-size 20G
-L -c` -> will start the virtual machine creation process, to create a Linux
(with GUI) using the ISO installer file specified by the '--iso' argument,
to a virtual disk file of size 20 GB, with 3 GB of RAM and 2 CPU cores.

The possible arguments, and descriptions of variables and default values for
these variables can be seen using `runvm -h`.

### usr/src/
The 'usr/src/' directory contains a script that can be used to [re]build the
kernel, (entire) userspace (with or without the relevant arguments to block
cleaning before building the variables), just the bhyve userspace utility, or
the cscope / ctags databases.

The script must be placed in the directory where the freebsd sources are
downloaded (usually '/usr/src/').

### Recommendations
We recommend using an alias for each of the scripts to allow running them from
anywhere.
