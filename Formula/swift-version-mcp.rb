class SwiftVersionMcp < Formula
    desc "Swift version MCP"
    homepage "https://github.com/badrinathvm/SwiftVersionMCP"
    url "https://github.com/badrinathvm/SwiftVersionMCP/archive/refs/heads/main.tar.gz"
    version "1.2.0"
    sha256 "2764bc07cb037169c1180de354760d8c0f9548fe2f17fa0cb520ba6f7bb188c9"
  
    depends_on "swift"
  
    def install
      # Debug what's actually there
      puts "=== Current directory: ==="
      system "pwd"
      system "ls", "-la"
      
      # Find all directories
      dirs = Dir.glob("*").select { |f| File.directory?(f) }
      puts "=== Found directories: #{dirs} ==="
      
      # Look for SwiftVersionMCP-related directories
      swift_dirs = dirs.select { |d| d.include?("SwiftVersionMCP") }
      puts "=== SwiftVersionMCP directories: #{swift_dirs} ==="
      
      if swift_dirs.any?
        target_dir = swift_dirs.first
        puts "=== Using directory: #{target_dir} ==="
        cd target_dir do
          system "swift", "build", "--configuration", "release", "--disable-sandbox"
          bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
        end
      else
        # Build in current directory if no subdirectory found
        puts "=== Building in current directory ==="
        system "swift", "build", "--configuration", "release", "--disable-sandbox"
        bin.install ".build/release/SwiftVersionMCP" => "swift-version-mcp"
      end
    end
  
    test do
      system "#{bin}/swift-version-mcp", "--help"
    end
  end