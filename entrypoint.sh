#!/bin/sh -l


##################################
#   Wake environment variables   #
##################################

WORKING_DIRECTORY="${1}"
EXPORT_SARIF="${2}"
export WAKE_CONFIG="${3}"
export WAKE_COMPILE_ALLOW_PATHS="${4}" # Example: "[/tmp:/tmp]"
export WAKE_COMPILE_EVM_VERSION="${5}" # Example: "prague"
export WAKE_COMPILE_IGNORE_PATHS="${6}" # Example: "[/tmp:/tmp]"
export WAKE_COMPILE_INCLUDE_PATHS="${7}" # Example: "[/tmp:/tmp]"
export WAKE_COMPILE_OPTIMIZER_ENABLED="${8}" # Example: "[false]"
export WAKE_COMPILE_OPTIMIZER_RUNS="${9}" # Example: "[0]"
export WAKE_COMPILE_REMAPPINGS="${10}" # Example: "[]"
export WAKE_COMPILE_TARGET_VERSION="${11}" # Example: "[0.8.9]"
export WAKE_COMPILE_VIA_IR="${12}" # Example: "[false]"
export WAKE_DETECT_MIN_IMPACT="${13}" # Example: "high"
export WAKE_DETECT_MIN_CONFIDENCE="${14}" # Example: "high"
export WAKE_DETECT_PATHS="${15}" # Example: "$1"
export WAKE_DETECT_ONLY="${16}" # Example: "[bruh1 bruh2]"
export WAKE_DETECT_EXCLUDE="${17}" # Example: "[bruh1 bruh2]"
export WAKE_DETECT_IGNORE_PATHS="${18}" # Example: "[/tmp:/tmp]"
export WAKE_DETECT_EXCLUDE_PATHS="${19}" # Example: "[/tmp:/tmp]"


######################
#   Execution part   #
######################

# Change working directory
if [ -n "$WORKING_DIRECTORY" ]; then
  cd "$WORKING_DIRECTORY"
else
  WORKING_DIRECTORY="."
fi

# Check for enabled SARIF export
EXPORT=""
if [ -n "$EXPORT_SARIF" ]; then
  EXPORT="--export=sarif"
  echo "sarif=$WORKING_DIRECTORY/wake-detections.sarif" >> $GITHUB_OUTPUT
fi

# 🌊️🌊️ Run analysis
wake detect ${EXPORT} all ${WAKE_DETECT_PATHS}

# Exit 0 if SARIF export enabled
STATUS=$?
if [ "$EXPORT_SARIF" = true -a ${STATUS} -eq 3 ]; then
  exit 0
else
  exit ${STATUS}
fi