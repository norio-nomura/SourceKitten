import PackageDescription

let package = Package(
  name: "SourceKitten",
  targets: [
    Target(name: "SourceKittenFramework"),
    Target(name: "sourcekitten",
      dependencies: [.Target(name: "SourceKittenFramework")]),
  ],
  dependencies: [
    .Package(url: "https://github.com/norio-nomura/Commandant.git", "0.11.0-alpha.1"),
    .Package(url: "https://github.com/norio-nomura/SWXMLHash.git", "2.6.0-alpha.1"),
    .Package(url: "https://github.com/jpsim/YamlSwift.git", Version(1, 6, 2)),
    .Package(url: "https://github.com/norio-nomura/Clang_C.git", majorVersion: 1),
    .Package(url: "https://github.com/norio-nomura/SourceKit.git", majorVersion: 1),
  ],
  exclude: ["Tests/SourceKittenFrameworkTests/Fixtures"]
)
