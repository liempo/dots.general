#!/bin/sh

STUDIO_PATH=/opt/android-studio
JVM_PATH=/usr/lib/jvm/default

if [[ ! -d $JVM_PATH ]]; then
    echo "Please install a JDK."
else
    if [[ $1 = "revert" ]]; then
        unlink $STUDIO_PATH/jre
        mv $STUDIO_PATH/jre_bundled $STUDIO_PATH/jre
    else
        # Back up bundled jre in studio
        mv $STUDIO_PATH/jre $STUDIO_PATH/jre_bundled
        ln -sf $JVM_PATH $STUDIO_PATH/jre
    fi
fi
