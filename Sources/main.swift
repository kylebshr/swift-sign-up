import Vapor
import VaporStencil
import PostgreSQL

//set the stencil renderer
//for all .stencil files
View.renderers[".stencil"] = StencilRenderer()


let parameters = ConnectionParameters(
    host: "localhost",
    port: "5432",
    databaseName: "swift",
    options: "",
    user: "swift",
    password: "swift123"
)
let connection = try! Database.connect(parameters: parameters)

Route.get("/") { request in
	do {
		return try View(path: "welcome.html")
	} catch _ {
		return "Something went wrong."
	}
}

Route.any("email/:email") { request in
    
    guard let email = request.parameters["email"] else {
        return "Error: no email"
    }
    
    let cleanEmail = SanitizedString(email)
    
    let query = Query("INSERT INTO email (email) VALUES ('\(cleanEmail.value)')")
    
    do {
        let result = try connection.execute(query)
    }
    catch QueryError.InvalidQuery(let errorMessage) {
        return "Database error: \(errorMessage)"
    }
    
    return "Entered email"
}

let server = Server()
server.run(port: 8080)
