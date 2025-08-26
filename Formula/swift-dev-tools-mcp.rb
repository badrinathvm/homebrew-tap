class SwiftDevToolsMcp < Formula
    desc "Swift Dev Tools MCP"
    homepage "https://github.com/badrinathvm/swift-dev-tools-mcp.git"
    url "https://github.com/badrinathvm/swift-dev-tools-mcp/archive/refs/heads/main.tar.gz"
    version "1.0.0" 
    sha256 "c6c0912b3fb8e3a4a750465be7d7be51b9f8826992deff71a48fbc90e5025940"
  
    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/swift-dev-tools-mcp"
    end
  
    test do
      system "#{bin}/swift-dev-tools-mcp", "--help"
    end
  end