# aipack

**Current Version: 1.1.4**

`aipack` is a customizable script packaging tool that bundles various files within a directory into a single, minified output file. It supports file type filtering, preset extension groups, exclusion options, flexible output configurations, and even compression and summary generation, making it ideal for optimizing code for AI processing or sharing across environments.

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Compatibility](#compatibility)
- [Upgrading aipack](#upgrading-aipack)
- [Reducing Token Count for AI Processing](#reducing-token-count-for-ai-processing)
- [Contributing](#contributing)
- [License](#license)
- [Versioning](#versioning)

## Features

- **Customizable File Types**: Dynamically define file types to include or exclude during packaging.
- **Preset Extension Groups**: Use predefined groups such as `default`, `web`, `python`, and more.
- **Selective Include/Exclude Options**: Add or remove specific extensions during packaging.
- **Minified Output**: Automatically compress and minify code for efficient use and easy pasting into AI tools.
- **Flexible Output**: Specify a custom output file name or use the default (`packaged_output.txt`).
- **Directory Structure Output**: Outputs a summary of the project structure along with file contents.
- **Comment Removal**: Experimental feature to remove comments from code, further reducing file size.
- **Output Compression**: Automatically compresses the output file using gzip.
- **Project Summary**: Generates a summary file with project statistics.
- **Multiple Output Formats**: Choose between `txt` (default), `json`, or `xml` formats for the packaged output.
- **Default Behavior**: Running `aipack` without any arguments packages the current directory using default settings.

## Installation

### Prerequisites

- **Ubuntu or other Unix-like System**
- **Git**: Version control system
- **jq**: JSON parsing utility
- **tree**: Directory listing program
- **gzip**: Compression utility

To install the required dependencies:

```bash
sudo apt-get update
sudo apt-get install git jq tree gzip
```

### Clone the Repository

```bash
git clone https://github.com/saintpetejackboy/aipack.git
cd aipack
```

### Make the Script Executable

```bash
chmod +x bin/aipack
```

### Add `aipack` to Your PATH

Add the `bin` directory to your system's PATH to easily run `aipack` from any location:

```bash
echo 'export PATH="$PATH:/path/to/aipack/bin"' >> ~/.bashrc
source ~/.bashrc
```

*Replace `/path/to/aipack/bin` with the actual path where `aipack` is located.*

## Usage

```bash
aipack [options]
```

### Options

- `-d DIR`       Directory to package (default: current directory)
- `-o FILE`      Output file (default: `packaged_output.txt`)
- `-g GROUP`     Preset group (default: `default`)
- `-e EXTS`      Exclude extensions (comma-separated)
- `-r`           Remove comments (experimental)
- `-c`           Compress output using gzip (optional)
- `-s`           Generate project summary (optional)
- `-i PATTERN`   Include files matching pattern
- `-x PATTERN`   Exclude files matching pattern
- `-f FORMAT`    Output format: `txt` (default), `json`, `xml`
- `-v LEVEL`     Log level: `DEBUG`, `INFO`, `WARN`, `ERROR` (default: `INFO`)
- `-l`           Include LICENSE file in output
- `-m`           Include README.md file in output
- `-h`           Display help message

## Examples

### Package Current Directory with Default Settings

```bash
aipack
```

This will package the current directory using all default settings and create `packaged_output.txt`.

### Package Specific Directory with Default Settings

```bash
aipack -d /path/to/project
```

This will package the specified directory using default settings.

### Package with Web Preset and Custom Output Name

```bash
aipack -d /path/to/project -g web -o web_bundle.txt
```

This uses the `web` preset and outputs to `web_bundle.txt`.

### Exclude Specific Extensions and Remove Comments

```bash
aipack -d /path/to/project -e js,css -r
```

This excludes `js` and `css` files and removes comments from the packaged code.

### Package and Compress Output

```bash
aipack -c
```

This will package the current directory and compress the output using gzip.

### Package and Generate Summary

```bash
aipack -s
```

This will generate a project summary alongside the packaged output.

### Include and Exclude Files Using Patterns

```bash
aipack -i "*.test.js" -x "*.spec.js"
```

This includes files matching `*.test.js` and excludes files matching `*.spec.js`.

### Change Output Format to JSON

```bash
aipack -f json
```

This will output the packaged code in JSON format.

## Compatibility

`aipack` is compatible with Unix-like systems, including:

- Ubuntu
- Debian
- Fedora
- macOS (with minor adjustments)

## Upgrading `aipack`

To upgrade to the latest version of `aipack`:

1. Navigate to the `aipack` directory:
   ```bash
   cd /path/to/aipack
   ```

2. Pull the latest changes:
   ```bash
   git pull origin main
   ```

3. Ensure the script is executable:
   ```bash
   chmod +x bin/aipack
   ```

4. Reload your PATH:
   ```bash
   source ~/.bashrc
   ```

5. Verify the installation:
   ```bash
   aipack -h
   ```

## Reducing Token Count for AI Processing

`aipack` employs several strategies to optimize output for AI processing:

- Comment minimization
- Whitespace optimization
- Code simplification
- Optional comment removal

These techniques ensure that the output is concise and optimized for input into AI systems with token limits.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Versioning

`aipack` follows [Semantic Versioning](https://semver.org/). The version number is in the format MAJOR.MINOR.PATCH.

- MAJOR version increments indicate incompatible API changes,
- MINOR version increments indicate added functionality in a backwards-compatible manner, and
- PATCH version increments indicate backwards-compatible bug fixes.

---

For the latest updates and more information, visit the [aipack GitHub repository](https://github.com/saintpetejackboy/aipack).
```
