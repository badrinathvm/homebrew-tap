class SwiftDevToolsMcp < Formula
    desc "Swift Dev Tools MCP"
    homepage "https://github.com/badrinathvm/swift-dev-tools-mcp.git"
    url "https://github.com/badrinathvm/swift-dev-tools-mcp/archive/refs/heads/main.tar.gz"
    version "1.0.0" 
    sha256 "a957de1a45d209bea1bf03caf66e871284cbfc9d8575c3d55f0550aadd262ea8"
  
    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/swift-dev-tools-mcp"
    end
  
    test do
      system "#{bin}/swift-dev-tools-mcp", "--help"
    end
  end