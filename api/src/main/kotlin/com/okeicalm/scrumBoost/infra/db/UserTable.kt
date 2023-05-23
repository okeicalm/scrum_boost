package com.okeicalm.scrumBoost.infra.db

import org.jetbrains.exposed.dao.id.IntIdTable
import org.jetbrains.exposed.sql.jodatime.datetime

object UserTable : IntIdTable("users") {
    val name = varchar("name", 255)
    val createdAt = datetime("created_at")
    val updatedAt = datetime("updated_at")
}
