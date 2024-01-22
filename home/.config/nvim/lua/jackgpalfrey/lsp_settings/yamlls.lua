-- https://github.com/redhat-developer/yaml-language-server
return {
    settings = {
        yaml = {
            hover = true,
            completion = true,
            validation = true,
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemas = require("schemastore").yaml.schemas(),
        }
    }
}
