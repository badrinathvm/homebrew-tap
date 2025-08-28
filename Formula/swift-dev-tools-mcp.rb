class SwiftDevToolsMcp < Formula
    desc "Swift Dev Tools MCP"
    homepage "https://github.com/badrinathvm/swift-dev-tools-mcp.git"
    url "https://github.com/badrinathvm/swift-dev-tools-mcp/archive/refs/tags/v1.0.0.tar.gz"
    version "1.0.0" 
    sha256 "5885776a42cee23772b1227657306607d5da9b22c0bd0dbaeb08aff0897d8c00"

    depends_on "swift"
  
    def install
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/swift-dev-tools-mcp"
    end
  
    test do
      system "#{bin}/swift-dev-tools-mcp", "--help"
    end
  end
