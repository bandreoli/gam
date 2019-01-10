function schemaOptions {
    $continue = 1

    while($continue -eq 1) {
        'Schema Options'
        '1. Get Schema Info'
        '2. Create A Schema'
        '10. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getSchemaInfo}
            2 {createSchema}
            10 {$continue = 0}
        }
    }
}

function getSchemaInfo {
    $continue = 'y'

    while($continue -eq 'y') {
        "Getting Schema Info"

        $schema = getSchema
        iex "gam info schema '$schema'"

        $continue = Read-Host -Prompt 'Get info from another Schema? (y/n)'
        ''
    }
}

function getSchema {
    $schema = ""
    while($schema -eq "") {
        $schema = Read-Host -Prompt 'Input Group (Required)'
    }
    return $schema
}