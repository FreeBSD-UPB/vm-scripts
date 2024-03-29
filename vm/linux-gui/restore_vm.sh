##
# Restore virtual machine from checkpoint
#

set -e
set -u

if [ $# -lt 3 ]
then
	echo "Usage: sh $0 <guest.img> <file.ckp> <machine>"
	exit 1
fi

[ ${VERBOSE} -eq 1 ] && set -x

bhyve \
	-H \
	-P \
	-c ${CPUS} \
	-m ${MEMSIZE} \
	-s 0:0,hostbridge  \
	-s 31,lpc  \
	-l com1,stdio  \
	-l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd  \
	-s 29,fbuf,tcp=0.0.0.0:5901,w=800,h=600,wait,vga=off  \
	-s 30,xhci,tablet  \
	-s 4,${BLKDEV},$1  \
	-r $2 \
	-s 5,${NETDEV},tap0  \
	$3
