import File
import Mustache

let packages = [
    [
        "name": "Zewo",
        "description": "is a set of Open source libraries to help you build modern and blazing fast server software.",
        "major": "0",
        "minor": "2"
    ],
    [
        "name": "HTTPServer",
        "description": "is a Venice based HTTP server.",
        "major": "0",
        "minor": "2"
    ]
]

let templateFile = try File(path: "README.md")
let templateString = try String(data: templateFile.read())
let template = try Template(string: templateString)
try File.createDirectoryAt("READMEs")

for package in packages {
    try File.createDirectoryAt("READMEs/\(package["name"]!)")
    let readmeFile = try File(path: "READMEs/\(package["name"]!)/README.md", mode: .TruncateWrite)

    let readme = try template.render(Box(boxable: package))
    try readmeFile.write(readme)
}