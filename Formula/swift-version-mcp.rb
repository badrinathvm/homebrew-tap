class SwiftVersionMcp < Formula
    desc "Swift version MCP"
    homepage "https://github.com/badrinathvm/SwiftVersionMCP"
    url "https://github.com/badrinathvm/SwiftVersionMCP/archive/refs/heads/main.tar.gz"
    version "1.2.0"
    sha256 "2764bc07cb037169c1180de354760d8c0f9548fe2f17fa0cb520ba6f7bb188c9"
  
    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/swift-version-mcp"
    end
  
    test do
      system "#{bin}/swift-version-mcp", "--help"
    end
  end