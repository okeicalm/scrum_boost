package com.okeicalm.scrumBoost

import com.okeicalm.scrumBoost.plugins.configureDatabases
import com.okeicalm.scrumBoost.plugins.configureRouting
import com.okeicalm.scrumBoost.plugins.configureSecurity
import com.okeicalm.scrumBoost.plugins.graphQLModule
import io.ktor.server.application.*

fun main(args: Array<String>): Unit = io.ktor.server.netty.EngineMain.main(args)

fun Application.module() {
    configureDatabases()
    configureSecurity()
    configureRouting()
    graphQLModule()
}
