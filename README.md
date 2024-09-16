# aipack

`aipack` is a versatile script packaging tool designed to bundle various script files within a directory into a single output file. It offers customizable file type definitions, preset groups, exclusion options, and flexible output naming.

## Features

- **Customizable File Types**: Define different file types at runtime.
- **Preset Extension Groups**: Use predefined groups like `default` and `web`.
- **Exclude Extensions**: Exclude specific file extensions during packaging.
- **Flexible Output Naming**: Specify a custom output file name or use the default.
- **Comprehensive Documentation**: Easy installation and usage instructions.
- **GitHub Integration**: Version control with GitHub.

## Installation

### Prerequisites

- **Ubuntu System**
- **Git Installed and Configured**
- **jq**: For parsing JSON presets.

Install `jq` if not already installed:

```bash
sudo apt-get update
sudo apt-get install jq
