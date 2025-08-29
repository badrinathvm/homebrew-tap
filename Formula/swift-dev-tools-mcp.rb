class SwiftDevToolsMcp < Formula
    desc "Swift Dev Tools MCP"
    homepage "https://github.com/badrinathvm/swift-dev-tools-mcp.git"
    url "https://github.com/badrinathvm/swift-dev-tools-mcp/archive/refs/tags/v2.0.0.tar.gz"
    version "2.0.0" 
    sha256 "83fa08dce0839c3f182ad97b1369786eaaa0b9f833395ea2a1f1508a75a744c5"

    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/swift-dev-tools-mcp"
    end
  
    test do
      system "#{bin}/swift-dev-tools-mcp", "--help"
    end
  end
