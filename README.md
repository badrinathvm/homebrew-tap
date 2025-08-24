# homebrew-tap
Custom home brew commands

# create a new tag after the changes
git tag -a v1.0.0 -m "Renamed the Formula"

git push origin v1.0.0

#Calculate 256 SHA HASH

 curl -L "https://github.com/badrinathvm/SwiftVersionMCP/archive/1.0.0.tar.gz"|shasum -a 256


# Users can install with
brew tap badrinathvm/tap
brew install swift-version-mcp