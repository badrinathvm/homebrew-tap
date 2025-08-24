class SwiftVersionMcp < Formula
    desc "Swift version MCP"
    homepage "https://github.com/badrinathvm/SwiftVersionMCP"
    url "https://github.com/badrinathvm/SwiftVersionMCP/archive/refs/heads/main.tar.gz"
    version "1.2.0"
    sha256 "70583451155641a75fb3f54d0ef8616200ec985f56e71ef3757affd24ad4659f"
  
    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release"
      bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
    end
  
    test do
      system "#{bin}/swift-version-mcp", "--help"
    end
  end