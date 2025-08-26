# homebrew-tap

Custom Homebrew formulas for easy installation of Swift-based tools and utilities.

## Available Formulas

### Swift Version MCP Server

A Model Context Protocol (MCP) server that provides Swift version information and toolchain management capabilities.

## Installation

### Prerequisites

- macOS with Homebrew installed
- Swift toolchain (Xcode or Swift.org toolchain)

### Install via Homebrew

```bash
# Add the custom tap
brew tap badrinathvm/tap

# Install the Swift Version MCP server
brew install swift-dev-tools-mcp
```

### Verify Installation

```bash
# Check if installed correctly
swift-version-mcp --help

# Verify location
which swift-version-mcp
```

## MCP Configuration

### For Claude Desktop or other MCP clients

Add the following configuration to your `mcp.json` file:

```json
{
  "mcpServers": {
    "swift-version-server": {
      "type": "stdio",
      "command": "swift-version-mcp"
    }
  }
}
```

<img width="440" height="479" alt="Screenshot 2025-08-24 at 2 07 30 PM" src="https://github.com/user-attachments/assets/7452eb28-6fc7-45a6-916e-080f1dafd511" />


### Local Development Configuration

If you're building from source locally, use:

```json
{
  "mcpServers": {
    "swift-version-server": {
      "type": "stdio",
      "command": "/path/to/your/project/.build/release/swift-version-mcp"
    }
  }
}
```

## Features

- 🔍 Swift version detection and reporting
- 🛠️ Toolchain information and management
- 🔧 Integration with MCP-compatible clients
- 📊 System Swift configuration analysis

## Usage

Once installed and configured in your MCP client, the Swift Version MCP server provides:

- Current Swift version information
- Available Swift toolchains
- Xcode version compatibility
- Swift Package Manager details

## Development

### Contributing to this Tap

1. **Fork this repository**
2. **Create a feature branch**: `git checkout -b feature/new-formula`
3. **Add your formula** to the `Formula/` directory
4. **Test your formula**: `brew install --build-from-source ./Formula/your-formula.rb`
5. **Submit a pull request**

### Creating a New Release

When updating the Swift Version MCP server:

1. **Create and push a new tag**:
   ```bash
   git tag -a v1.2.0 -m "Release version 1.2.0"
   git push origin v1.2.0
   ```

2. **Calculate SHA256 hash**:
   ```bash
   curl -L "https://github.com/badrinathvm/SwiftVersionMCP/archive/v1.2.0.tar.gz" | shasum -a 256
   ```

3. **Update the formula** with new version and SHA256

4. **Test the updated formula**:
   ```bash
   brew uninstall swift-version-mcp
   brew install swift-version-mcp
   ```

### Formula Structure

Our formulas follow standard Homebrew conventions:

```ruby
class SwiftVersionMcp < Formula
  desc "Swift version MCP server"
  homepage "https://github.com/badrinathvm/SwiftVersionMCP"
  url "https://github.com/badrinathvm/SwiftVersionMCP/archive/v1.2.0.tar.gz"
  sha256 "your-calculated-sha256-hash"

  depends_on "swift"

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/swift-version-mcp"
  end

  test do
    system "#{bin}/swift-version-mcp", "--help"
  end
end
```

## Troubleshooting

### Common Issues

**Command not found after installation**:
```bash
# Check if Homebrew's bin is in your PATH
echo $PATH | grep -o '/opt/homebrew/bin'

# If not, add to your shell profile
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Permission issues during build**:
```bash
# Ensure you have proper Xcode/Swift setup
xcode-select --install
swift --version
```

**MCP client can't find the server**:
- Verify the executable path: `which swift-version-mcp`
- Check your `mcp.json` configuration
- Restart your MCP client after configuration changes

### Getting Help

- **Issues with the tap**: [Create an issue](https://github.com/badrinathvm/homebrew-tap/issues)
- **Issues with Swift Version MCP**: [Report here](https://github.com/badrinathvm/SwiftVersionMCP/issues)

## License

This tap is available under the [MIT License](LICENSE).

## Related Projects

- [Swift Version MCP Server](https://github.com/badrinathvm/SwiftVersionMCP) - The main project
- [Model Context Protocol](https://github.com/modelcontextprotocol) - MCP specification and tools

---

**Note**: This tap provides convenient installation of Swift-based MCP servers. For development or contributing to the actual servers, please visit their respective repositories.
