import File
import Mustache

let package = [
	["parent": "Zewo",
	"name": "URLEncodedForm",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "UDP",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "TrieRouteMatcher",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "TCPSSL",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "TCP",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "POSIX",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "Stream",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "String",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "Router",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "RegexRouteMatcher",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "MySQL",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "MediaTypeSerializerCollection",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "MediaTypeParserCollection",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "JSON",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "MediaType",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "StructuredData",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "IP",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "HTTPServer",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "HTTPSServer",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "HTTPSClient",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "HTTPFile",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "File",
	"major": "0",
	"minor": "5"
	],[
	"parent": "VeniceX",
	"name": "HTTPClient",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "Examples",
	"major": "0",
	"minor": "5"
	],[
	"parent": "Zewo",
	"name": "DockerExamples",
	"major": "0",
	"minor": "5"
	],[
	"name": "Zewo",
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
    try File.createDirectoryAt("READMEs/\(package["parent"]!)\/(package["name"]!)")
    let readmeFile = try File(path: "READMEs/\(package["parent"]!)/\(package["name"]!)/README.md", mode: .TruncateWrite)

    let readme = try template.render(Box(boxable: package))
    try readmeFile.write(readme)
}
