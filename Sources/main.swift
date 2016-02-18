import Vapor
import VaporStencil
import PostgreSQL

//set the stencil renderer
//for all .stencil files
View.renderers[".stencil"] = StencilRenderer()

Route.get("/") { request in
	do {
		return try View(path: "welcome.html")
	} catch _ {
		return "Something went wrong."
	}
}

Route.get("json") { request in 
	let response: [String: Any] = [
		"number": 123,
		"string": "test",
		"array": [
			0, 1, 2, 3
		],
		"dict": [
			"name": "Vapor",
			"lang": "Swift"
		]
	]

	return response
}

Route.any("email/:email") { request in
    
    guard let email = request.parameters["email"] else {
        return "Error: no email"
    }
    
    
    
    return "Entered email"
}

Route.get("session") { request in
	let response: Response
	do {
		let json: [String: Any] = [
                        "session.data": request.session.data,
                        "request.cookies": request.cookies,
                        "instructions": "Refresh to see cookie and session get set."
                ];
		response = try Response(status: .OK, json: json)
	} catch {
		response = Response(error: "Invalid JSON")
	}

	request.session.data["name"] = "Vapor"
	response.cookies["test"] = "123"

	return response
}

Route.get("heartbeat", closure: HeartbeatController().index)

Route.get("stencil") { request in
	return try View(path: "template.stencil", context: [
		"greeting": "Hello, world!"
	])
}

//print what link to visit for default port
print("Visit http://localhost:8080")

let server = Server()
server.run(port: 8080)

let parameters = ConnectionParameters(
    host: "localhost",
    port: "5432",
    databaseName: "swift",
    login: "swift",
    password: ""
)

let connection = try! Database.connect(parameters: parameters)
