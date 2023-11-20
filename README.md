# Wake Detect GitHub Action 🌊️🌊️

This GitHub Action runs the Wake static analysis tool. It's configurable via several inputs and outputs a SARIF file if specified.

## Inputs

- `working-directory`: The working directory for the action. Not required.
- `export-sarif`: If set, the action will export a SARIF file. Not required.
- `config-path`: Path to the configuration file relative to the working directory. Not required.
- `compile-allow-paths`: Paths that are allowed for the compiler. Not required.
- `compile-evm-version`: EVM version to compile for. Not required.
- `compile-ignore-paths`: Paths that the compiler should ignore. Not required.
- `compile-include-paths`: Paths that should be included in the compilation. Not required.
- `compile-optimizer-enabled`: Enable the optimizer during compilation. Not required.
- `compile-optimizer-runs`: Number of runs for the optimizer. Not required.
- `compile-remappings`: Remappings for the compiler. Not required.
- `compile-target-version`: Target version for the compiler. Not required.
- `compile-via-ir`: Compile via IR. Not required.
- `detect-min-impact`: Minimum impact level for detection. Not required.
- `detect-min-confidence`: Minimum confidence level for detection. Not required.
- `detect-paths`: Paths for detection. Not required.
- `detect-only`: Only detect these items. Not required.
- `detect-exclude`: Exclude these items from detection. Not required.
- `detect-ignore-paths`: Paths to ignore during detection. Not required.
- `detect-exclude-paths`: Paths to exclude during detection. Not required.

## Outputs

- `sarif`: Exported SARIF file path relative to the repository root.

## Usage

The action is used in a workflow file with the `uses` keyword. Here's an example:

```
steps:
  - name: Run Static Analysis
    uses: Ackee-Blockchain/wake-detect@0.0.1
    with:
      compile-include-paths: "node_modules"
      export-sarif: true
```