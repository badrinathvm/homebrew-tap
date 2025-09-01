# Homebrew formula for Swift Dev Tools MCP
class SwiftDevToolsMcp < Formula
    # Brief description of the package
    desc "Swift Dev Tools MCP"
    
    # Project homepage URL
    homepage "https://github.com/badrinathvm/swift-dev-tools-mcp.git"
    
    # Source archive URL for the specified version
    url "https://github.com/badrinathvm/swift-dev-tools-mcp/archive/refs/tags/v2.0.0.tar.gz"
    version "2.0.0" 
    
    # SHA256 checksum for the source archive to ensure integrity
    sha256 "83fa08dce0839c3f182ad97b1369786eaaa0b9f833395ea2a1f1508a75a744c5"

    # Require Swift runtime for building and running
    depends_on "swift"
  
    # Installation process
    def install
      # Build the Swift package in release mode with sandbox disabled
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      
      # Install the compiled binary to the bin directory
      bin.install ".build/release/swift-dev-tools-mcp"
    end
  
    # Test to verify the installation works correctly
    test do
      # Run the help command to ensure the binary is functional
      system "#{bin}/swift-dev-tools-mcp", "--help"
    end
  end
