package com.okeicalm.scrumBoost

import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import com.okeicalm.plugins.*
import com.okeicalm.scrumBoost.plugins.configureDatabases
import com.okeicalm.scrumBoost.plugins.configureRouting
import com.okeicalm.scrumBoost.plugins.configureSecurity
import com.okeicalm.scrumBoost.plugins.configureSerialization

fun main() {
    embeddedServer(Netty, port = 8080, host = "0.0.0.0", module = Application::module)
        .start(wait = true)
}

fun Application.module() {
    configureSerialization()
    configureDatabases()
    configureSecurity()
    configureRouting()
}
