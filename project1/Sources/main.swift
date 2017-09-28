import KituraStencil
import Kitura
import LoggerAPI
import HeliumLogger

HeliumLogger.use()
let router = Router()

router.setDefault(templateEngine: StencilTemplateEngine())
router.all("/static", middleware: StaticFileServer())

router.get("/") {
    request, response, next in
    defer { next() }
    try response.render("home", context: [:])
}

router.get("/staff") {
    request, response, next in
    defer { next() }
    try response.render("staff", context: [:])
}

router.get("/staff/:name") {
    request, response, next in
    defer { next() }
    
    guard let name = request.parameters["name"] else { return }
    let bios = [
        "kirk" : "My name is James T. Kirk and I love bewbs.",
        "sisko" : "My name is Benjamin Sisko and I love baseball.",
        "janeway" : "My name is Kathryn Janeway and I love coffee.",
        "picard" : "My name is Jean-Luc Picard and I love tea, Earl Grey, Hot.",
        "archer" : "My name is Jonathan Archer and I love bad Canadian music."
    ]
    var context = [String: Any]()
    context["people"] = bios.keys.sorted()
    
    if let bio = bios[name] {
        context["name"] = name
        context["bio"] = bio
    }
    try response.render("staff", context: context)
}

router.get("/contact") {
    request, response, next in
    defer { next() }
    try response.render("contact", context: [:])
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
