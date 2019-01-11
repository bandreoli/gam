function schemaOptions {
    $continue = 1

    while($continue -eq 1) {
        'Schema Options'
        '1. Get Schema Info'
        '2. Get All Schemas'
        '3. Create Schema'
        '4. Delete Schema'
        '10. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getSchemaInfo}
            2 {getAllSchemas}
            3 {createSchema}
            4 {deleteSchema}
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

function getAllSchemas {
    gam print schemas
}

function createSchema {
    $continue = 'y'
    $newField = 'y'

    while($continue -eq 'y') {
        "Creating Schema"

        $schema = getSchema

        $command = "gam create schema '$schema' "

        ''

        while($newField -eq 'y') {
            $name = Read-Host -Prompt 'Field Name (Required)'

            'Type:'
            '1. True/False'
            '2. Decimal'
            '3. Email'
            '4. Integer'
            '5. Phone'
            '6. String'
            $type = ""
            while($type -eq "") {
                $type = Read-Host -Prompt 'Enter Here (Required)'
            }

            switch($type) {
                1 {$typeCom = "bool"}
                2 {$typeCom = "double"}
                3 {$typeCom = "email"}
                4 {$typeCom = "int64"}
                5 {$typeCom = "phone"}
                6 {$typeCom = "string"}
            }

            $multivalueCom = ""

            $multivalue = Read-Host -Prompt 'Mulitvalued? (y/n)'
            if($multivalue -eq 'y') {
                $multivalueCom = 'multivalued'
            }

            $restrictedCom = ""

            $restricted = Read-Host -Prompt 'Restricted to Admin? (y/n)'
            if($restricted -eq 'y') {
                $restrictedCom = 'restricted'
            }

            $command = $command + "field '$name' type $typeCom '$multivalueCom' '$restrictedCom' endfield "

            $newField = Read-Host -Prompt 'Add another field? (y/n)'
            ''
        }

        iex $command

        $continue = Read-Host -Prompt 'Create another Schema? (y/n)'
        ''
    }
}

function deleteSchema {
    $continue = 'y'

    while($continue -eq 'y') {
        'Deleting Schema'

        $schema = getSchema


        $delete = Read-Host -Prompt "Are you sure you want to delete $schema ? (y/n)"

        if($delete -eq 'y') {
            gam delete schema $schema
        }

        $continue = Read-Host -Prompt 'Delete another schema? (y/n)'
        ''
    }
}

function getSchema {
    $schema = ""
    while($schema -eq "") {
        $schema = Read-Host -Prompt 'Input Schema (Required)'
    }
    return $schema
}