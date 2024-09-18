# aipack
![AIPACK Cat Mascot](img/cat-mascot.webp)

**Current Version: 1.4.0**

`aipack` is a versatile script packaging tool designed to bundle various files within a directory into a single, organized output file. It's perfect for optimizing code for AI processing, sharing across different environments, or creating compact project snapshots.

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Testing](#testing)
- [Compatibility](#compatibility)
- [Upgrading aipack](#upgrading-aipack)
- [Reducing Token Count for AI Processing](#reducing-token-count-for-ai-processing)
- [Contributing](#contributing)
- [License](#license)
- [Versioning](#versioning)

## Features

- **Customizable File Types**: Dynamically define file types to include or exclude.
- **Selective Include/Exclude Options**: Add or remove specific files or patterns.
- **Include Hidden Files**: Optionally include hidden system files and directories.
- **Include Files Without Extensions**: Capture all relevant files, regardless of extension.
- **Comment Removal**: Experimental feature to remove comments from code files.
- **Flexible Output**: Specify a custom output file name or use the default.
- **Directory Structure Output**: Includes a summary of the project structure.
- **Logging Levels**: Adjust the verbosity of the script's output.

## Installation

### Prerequisites

- Unix-like system (Ubuntu, Debian, Fedora, macOS, etc.)
- Git
- Bash

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/saintpetejackboy/aipack.git
   cd aipack
   ```

2. Make the script executable:
   ```bash
   chmod +x bin/aipack
   ```

3. Add to your PATH:
   ```bash
   echo 'export PATH="$PATH:/path/to/aipack/bin"' >> ~/.bashrc
   source ~/.bashrc
   ```

## Usage

```bash
aipack [options]
```

### Options

- `-d <dir>`: Directory to package (default: current directory)
- `-o <output>`: Output file name (default: `packaged_output.txt`)
- `-e <ext>`: File extension to include (can be used multiple times)
- `-r`: Remove comments from code files
- `-i <pattern>`: Include files matching pattern (can be used multiple times)
- `-x <pattern>`: Exclude files matching pattern (can be used multiple times)
- `-v <level>`: Log level (DEBUG, INFO, WARN, ERROR)
- `-H`: Include hidden files and directories
- `-h`: Show help message

## Examples

### Basic Usage
```bash
aipack
```

### Custom Directory and Output
```bash
aipack -d /path/to/project -o project_bundle.txt
```

### Include Specific Extensions
```bash
aipack -e py -e js -e html
```

### Exclude Patterns and Remove Comments
```bash
aipack -x "*.test.js" -x "vendor/*" -r
```

### Include Hidden Files
```bash
aipack -H
```

## Testing

We use [Bats](https://github.com/bats-core/bats-core) for testing. To run the tests:

1. Install Bats:
   ```bash
   git clone https://github.com/bats-core/bats-core.git
   cd bats-core
   ./install.sh /usr/local
   ```

2. Run the tests:
   ```bash
   bats tests/aipack_tests.bats
   ```

## Compatibility

`aipack` is compatible with Unix-like systems, including Ubuntu, Debian, Fedora, and macOS (with minor adjustments).

## Upgrading `aipack`

To upgrade to the latest version:

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

## Reducing Token Count for AI Processing

`aipack` optimizes output for AI processing by:

- Removing comments (optional)
- Selectively including files
- Optimizing whitespace
- Providing flexible output configuration

These techniques ensure that the output is concise and optimized for AI systems with token limits.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Versioning

`aipack` follows [Semantic Versioning](https://semver.org/). The version number format is MAJOR.MINOR.PATCH.

---

For the latest updates and more information, visit the [aipack GitHub repository](https://github.com/saintpetejackboy/aipack).