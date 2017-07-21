#!/bin/sh

set -e

# Place the new binaries if the directory is writable.
if [ -w "/host/opt/cni/bin/" ]; then
	# Copy over the 3rd party CNI binaries, but do not overwrite if they exist
	for f in /opt/cni/bin/*; do
		if [ ! -f /host/opt/cni/bin/$(basename $f) ] || [ "$OVERWRITE" = "true" ]; then
			cp $f /host/opt/cni/bin/$(basename $f)
			echo "wrote '$(basename $f)' binary out"
		else
			echo "did not write '$(basename $f)' binary out"
		fi
	done
else
	echo "could not write CNI binaries, directory not writable"
	exit 2
fi