package com.okeicalm.scrumBoost.plugins

import com.okeicalm.scrumBoost.infra.db.UserTable
import io.ktor.server.application.Application
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.Schema
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.transactions.transaction

fun Application.configureDatabases() {
    @Suppress("unused")
    val database = Database.connect(
        url = "jdbc:mysql://127.0.0.1:3306/scrum_boost",
        user = "root",
        driver = "com.mysql.cj.jdbc.Driver",
        password = "password"
    )
    val schema = Schema("scrum_boost").also {
        transaction {
            SchemaUtils.createSchema(it)
        }
    }

    val tables = arrayOf(
        UserTable
    ).also {
        transaction {
            SchemaUtils.createMissingTablesAndColumns(*it)
        }
    }
}
