#!/bin/sh -l


##################################
#   Woke environment variables   #
##################################

WORKING_DIRECTORY="${1}"
EXPORT_SHARIF="${2}"
WOKE_CONFIG_PATH="${3}"
export WOKE_COMPILE_ALLOW_PATHS="${4}" # Example: "[/tmp:/tmp]"
export WOKE_COMPILE_EVM_VERSION="${5}" # Example: "prague"
export WOKE_COMPILE_IGNORE_PATHS="${6}" # Example: "[/tmp:/tmp]"
export WOKE_COMPILE_INCLUDE_PATHS="${7}" # Example: "[/tmp:/tmp]"
export WOKE_COMPILE_OPTIMIZER_ENABLED="${8}" # Example: "[false]"
export WOKE_COMPILE_OPTIMIZER_RUNS="${9}" # Example: "[0]"
export WOKE_COMPILE_REMAPPINGS="${10}" # Example: "[]"
export WOKE_COMPILE_TARGET_VERSION="${11}" # Example: "[0.8.9]"
export WOKE_COMPILE_VIA_IR="${12}" # Example: "[false]"
export WOKE_DETECT_MIN_IMPACT="${13}" # Example: "high"
export WOKE_DETECT_MIN_CONFIDENCE="${14}" # Example: "high"
export WOKE_DETECT_PATHS="${15}" # Example: "$1"
export WOKE_DETECT_ONLY="${16}" # Example: "[bruh1 bruh2]"
export WOKE_DETECT_EXCLUDE="${17}" # Example: "[bruh1 bruh2]"
export WOKE_DETECT_IGNORE_PATHS="${18}" # Example: "[/tmp:/tmp]"
export WOKE_DETECT_EXCLUDE_PATHS="${19}" # Example: "[/tmp:/tmp]"


######################
#   Execution part   #
######################

CONFIG=""

if [ -n "$WOKE_CONFIG_PATH" ]; then
  CONFIG="--config $WOKE_CONFIG_PATH"
fi

# change working directory
if [ -n "$WORKING_DIRECTORY" ]; then
  cd "$WORKING_DIRECTORY"
fi

EXPORT=""

if [ -n "$EXPORT_SHARIF" ]; then
  EXPORT="--export=sharif"
  echo "sarif=$WORKING_DIRECTORY/woke-detections.sarif" >> $GITHUB_ENV
fi

woke "$CONFIG" detect all $WOKE_DETECT_PATHS $EXPORT