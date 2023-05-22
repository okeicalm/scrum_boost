package com.okeicalm.scrumBoost.handler.query

import com.expediagroup.graphql.server.operations.Query
import com.okeicalm.scrumBoost.handler.type.ProjectType

// Provide a list of projects that user want to manage
class ProjectQuery: Query {
    @Suppress("unused")
    fun projects(): List<ProjectType> = listOf(
        ProjectType(1, "Project 1"),
        ProjectType(2, "Project 2"),
        ProjectType(3, "Project 3"),
    )
}