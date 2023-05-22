package com.okeicalm.scrumBoost.plugins

import com.expediagroup.graphql.server.ktor.GraphQL
import com.expediagroup.graphql.server.ktor.graphQLPostRoute
import com.expediagroup.graphql.server.ktor.graphiQLRoute
import com.okeicalm.scrumBoost.handler.query.ProjectQuery
import io.ktor.server.application.Application
import io.ktor.server.application.install
import io.ktor.server.routing.routing

fun Application.graphQLModule() {
    install(GraphQL) {
        schema {
            packages = listOf("com.okeicalm.scrumBoost.handler")
            queries = listOf(
                ProjectQuery()
            )
        }
    }
    routing {
        graphQLPostRoute()
        graphiQLRoute()
    }
}
