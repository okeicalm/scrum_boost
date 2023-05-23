package com.okeicalm.scrumBoost.plugins

import com.okeicalm.scrumBoost.infra.db.UserTable
import io.ktor.server.application.Application
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.Schema
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.transactions.transaction

fun Application.configureDatabases() {
    Database.connect(
        url = "jdbc:mysql://127.0.0.1:3306/scrum_boost",
        user = "root",
        driver = "com.mysql.cj.jdbc.Driver",
        password = "password"
    )
    Schema("scrum_boost").also {
        transaction {
            SchemaUtils.createSchema(it)
        }
    }

    arrayOf(
        UserTable
    ).also {
        transaction {
            @Suppress("SpreadOperator")
            SchemaUtils.createMissingTablesAndColumns(*it)
        }
    }
}
