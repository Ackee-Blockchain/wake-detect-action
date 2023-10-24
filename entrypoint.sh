#!/bin/sh -l


##################################
#   Woke environment variables   #
##################################

WORKING_DIRECTORY="${1}"
export WOKE_COMPILE_ALLOW_PATHS="${2}" # Example: "[/tmp:/tmp]"
export WOKE_COMPILE_EVM_VERSION="${3}" # Example: "prague"
export WOKE_COMPILE_IGNORE_PATHS="${4}" # Example: "[/tmp:/tmp]"
export WOKE_COMPILE_INCLUDE_PATHS="${5}" # Example: "[/tmp:/tmp]"
export WOKE_COMPILE_OPTIMIZER_ENABLED="${6}" # Example: "[false]"
export WOKE_COMPILE_OPTIMIZER_RUNS="${7}" # Example: "[0]"
export WOKE_COMPILE_REMAPPINGS="${8}" # Example: "[]"
export WOKE_COMPILE_TARGET_VERSION="${9}" # Example: "[0.8.9]"
export WOKE_COMPILE_VIA_IR="${10}" # Example: "[false]"
export WOKE_DETECT_MIN_IMPACT="${11}" # Example: "high"
export WOKE_DETECT_MIN_CONFIDENCE="${12}" # Example: "high"
export WOKE_DETECT_PATHS="${13}" # Example: "$1"
export WOKE_DETECT_ONLY="${14}" # Example: "[bruh1 bruh2]"
export WOKE_DETECT_EXCLUDE="${15}" # Example: "[bruh1 bruh2]"
export WOKE_DETECT_IGNORE_PATHS="${16}" # Example: "[/tmp:/tmp]"
export WOKE_DETECT_EXCLUDE_PATHS="${17}" # Example: "[/tmp:/tmp]"


######################
#   Execution part   #
######################

# change working directory
if [ -n "$WORKING_DIRECTORY" ]; then
  cd "$WORKING_DIRECTORY"
fi

woke detect all $WOKE_DETECT_PATHS # passed temporarily till ENV will be supported