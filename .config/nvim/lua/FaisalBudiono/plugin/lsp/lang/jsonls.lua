local schema_store = require("schemastore")

return {
    autostart = false,
    settings = {
        json = {
            schemas = schema_store.json.schemas({
                replace = {
                    ["openapi.json"] = {
                        description = "A Open API documentation files",
                        fileMatch = { "openapi.json", "openapi.yml", "openapi.yaml" },
                        name = "openapi.json",
                        url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
                        versions = {
                            ["3.1"] = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
                            ["3.0"] = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
                        },
                    },
                },
            }),
            validate = { enable = true },
        },
    },
}
