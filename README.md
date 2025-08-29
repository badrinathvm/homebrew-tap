# 🍺 homebrew-tap

> 🚀 **Custom Homebrew formulas** for easy installation of Swift-based tools and utilities. One command, infinite possibilities!

## 📦 Available Formulas

### 🛠️ Swift Dev Tools MCP Server

🌟 A Model Context Protocol (MCP) server that bridges your AI assistants with Swift development environment - providing version info, toolchain management, and more!

## ⚡ Quick Installation

### 🔧 Prerequisites

🍎 macOS with Homebrew installed  
🐦 Swift toolchain (Xcode or Swift.org toolchain)

### 🚀 Install via Homebrew

```bash
# 🔗 Add the custom tap
brew tap badrinathvm/tap

# 📦 Install the Swift Dev Tools MCP server
brew install swift-dev-tools-mcp
```

### ✅ Verify Installation

```bash
# 🔍 Check if installed correctly
swift-dev-tools-mcp --help

# 📍 Verify location
which swift-dev-tools-mcp
```

**To get upgrade to latest one**

```bash
 brew update && brew upgrade swift-dev-tools-mcp
```

## 🔌 MCP Configuration

### 🤖 For Claude Desktop or other MCP clients

Add this configuration to your `mcp.json` file:

```json
{
  "mcpServers": {
    "swift-version-server": {
      "type": "stdio",
      "command": "swift-dev-tools-mcp"
    }
  }
}
```

<img width="440" height="479" alt="Screenshot 2025-08-24 at 2 07 30 PM" src="https://github.com/user-attachments/assets/7452eb28-6fc7-45a6-916e-080f1dafd511" />

### 🏗️ Local Development Configuration

If you're building from source locally:

```json
{
  "mcpServers": {
    "swift-version-server": {
      "type": "stdio",
      "command": "/path/to/your/project/.build/release/swift-dev-tools-mcp"
    }
  }
}
```

## ✨ Features

🔍 **Swift version detection** and reporting  
🛠️ **Toolchain information** and management  
🔧 **MCP client integration** - seamless AI assistant connection  
📊 **System Swift configuration** analysis  
📱 **iOS/macOS simulators** listing  
🔨 **Xcode version compatibility** checks  

## 🎯 Usage

Once installed and configured in your MCP client, the Swift Dev Tools MCP server provides:

📋 Current Swift version information  
🔗 Available Swift toolchains  
🍎 Xcode version compatibility  
📦 Swift Package Manager details  
📱 Connected iOS/macOS devices  
⚙️ System architecture information  

## 👨‍💻 Development

### 🤝 Contributing to this Tap

1️⃣ **Fork this repository**  
2️⃣ **Create a feature branch**: `git checkout -b feature/new-formula`  
3️⃣ **Add your formula** to the `Formula/` directory  
4️⃣ **Test your formula**: `brew install --build-from-source ./Formula/your-formula.rb`  
5️⃣ **Submit a pull request**  

### 🏷️ Creating a New Release

When updating the Swift Dev Tools MCP server:

**1️⃣ Create and push a new tag:**
```bash
git tag -a v1.2.0 -m "Release version 1.2.0"
git push origin v1.2.0
```

**2️⃣ Calculate SHA256 hash:**
```bash
curl -L "https://github.com/badrinathvm/swift-dev-tools-mcp/archive/refs/heads/main.tar.gz"|shasum -a 256
```

**3️⃣ Update the formula** with new version and SHA256

**4️⃣ Test the updated formula:**
```bash
brew uninstall swift-dev-tools-mcp
brew install swift-dev-tools-mcp
```

### 🏗️ Formula Structure

Our formulas follow standard Homebrew conventions:

```ruby
class SwiftDevToolsMcp < Formula
    desc "Swift Dev Tools MCP"
    homepage "https://github.com/badrinathvm/swift-dev-tools-mcp.git"
    url "https://github.com/badrinathvm/swift-dev-tools-mcp/archive/refs/heads/main.tar.gz"
    version "1.0.0" 
    sha256 "your-calculated-sha256-hash"
  
    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/swift-dev-tools-mcp"
    end
  
    test do
      system "#{bin}/swift-dev-tools-mcp", "--help"
    end
  end
```

## 🚨 Troubleshooting

### ⚠️ Common Issues

**🔍 Command not found after installation:**
```bash
# Check if Homebrew's bin is in your PATH
echo $PATH | grep -o '/opt/homebrew/bin'

# If not, add to your shell profile
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**🔐 Permission issues during build:**
```bash
# Ensure you have proper Xcode/Swift setup
xcode-select --install
swift --version
```

**🔌 MCP client can't find the server:**
🎯 Verify the executable path: `which swift-version-mcp`  
⚙️ Check your `mcp.json` configuration  
🔄 Restart your MCP client after configuration changes  

### 🆘 Getting Help

🐛 **Issues with the tap**: [Create an issue](https://github.com/badrinathvm/homebrew-tap/issues)  
🛠️ **Issues with Swift Dev Tools MCP**: [Report here](https://github.com/badrinathvm/swift-dev-tools-mcp/issues)  

## 📄 License

This tap is available under the [MIT License](LICENSE).

## 🔗 Related Projects

🛠️ [Swift Dev Tools MCP Server](https://github.com/badrinathvm/swift-dev-tools-mcp) - The main project  
🌐 [Model Context Protocol](https://github.com/modelcontextprotocol) - MCP specification and tools  

---

💡 **Pro Tip**: This tap provides convenient installation of Swift-based MCP servers, making your development workflow more intelligent and automated!

🎉 **Happy Brewing!** 🍺✨
