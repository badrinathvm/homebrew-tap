class SwiftVersionMcp < Formula
    desc "Swift version MCP"
    homepage "https://github.com/badrinathvm/SwiftVersionMCP"
    url "https://github.com/badrinathvm/SwiftVersionMCP/archive/refs/heads/main.tar.gz"
    version "1.2.0"
    sha256 :no_check
  
    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release"
      bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
    end
  
    test do
      system "#{bin}/swift-version-mcp", "--help"
    end
  end