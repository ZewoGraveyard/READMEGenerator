import File
import Mustache

let packages = [
	["organization": "Zewo",
	"name": "URLEncodedForm",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "UDP",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "TrieRouteMatcher",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "TCPSSL",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "TCP",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "POSIX",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "String",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "Router",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "RegexRouteMatcher",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "MySQL",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "JSON",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "MediaType",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "StructuredData",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "IP",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "HTTPServer",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "HTTPSServer",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "HTTPSClient",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "HTTPFile",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "File",
	"major": "0",
	"minor": "5"
	],[
	"organization": "VeniceX",
	"name": "HTTPClient",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "Examples",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "DockerExamples",
	"major": "0",
	"minor": "5"
	],[
	"organization": "Zewo",
	"name": "ContentNegotiationMiddleware",
	"major": "0",
	"minor": "5"
	]
]

let templateFile = try File(path: "README.md")
let templateString = try String(data: templateFile.read())
let template = try Template(string: templateString)
try File.createDirectoryAt("READMEs")

for package in packages {
    try File.createDirectoryAt("READMEs/\(package["organization"]!)/\(package["name"]!)")
    let readmeFile = try File(path: "READMEs/\(package["organization"]!)/\(package["name"]!)/README.md", mode: .TruncateWrite)

    let readme = try template.render(Box(boxable: package))
    try readmeFile.write(readme)
}
