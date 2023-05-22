package com.okeicalm.scrumBoost.handler.query

import com.expediagroup.graphql.server.operations.Query
import com.okeicalm.scrumBoost.handler.type.ProjectType

// Provide a list of projects that user want to manage
class ProjectQuery : Query {
    @Suppress("unused")
    fun projects(): List<ProjectType> {
        val hoge = 1

        return listOf(
            ProjectType(hoge, "Project 1"),
            ProjectType(hoge, "Project 2"),
            ProjectType(hoge, "Project 3"),
        )
    }
}
