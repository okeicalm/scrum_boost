package com.okeicalm.scrumBoost.handler.type

import com.expediagroup.graphql.generator.annotations.GraphQLDescription
import com.expediagroup.graphql.generator.annotations.GraphQLName

// Type for Project that user want to manage
@GraphQLDescription("Project that user want to manage")
@GraphQLName("Project")
data class ProjectType(
    val id: Int,
    val name: String,
)
