class SwiftVersionMcp < Formula
  desc "Swift version MCP"
  homepage "https://github.com/badrinathvm/SwiftVersionMCP"
  head "https://github.com/badrinathvm/SwiftVersionMCP.git", branch: "main"

  depends_on "swift"

  def install
    system "swift", "build", "--configuration", "release"
    bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
  end

  test do 
    system "#{bin}/swift-version-mcp", "--help"
  end
end