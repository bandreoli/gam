function schemaOptions {
    $continue = 1

    while($continue -eq 1) {
        'Schema Options'
        '1. Get Schema Info'
        '2. Get All Schemas'
        '3. Create Schema'
        '4. Delete Schema'
        '5. Add Schema to User'
        '10. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getSchemaInfo}
            2 {getAllSchemas}
            3 {createSchema}
            4 {deleteSchema}
            5 {schemaForUser}
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
    gam show schemas
    ''
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

function schemaForUser {
    $continue = 'y'

    while($continue -eq 'y') {

        $username = ""
        while($username -eq "") {
            $username = Read-Host -Prompt 'Input Username (Required)'
        }

        $newSchema = 'y'

        while($newSchema -eq 'y') {
            $schemaList = gam show schemas

            'Choose a Schema:'

            $schemas = @()
            $count = 0

            for($i=0; $i -lt $schemaList.length; $i++) {
                if($schemaList[$i] -Match "Schema: ") {
                    $schema = $schemaList[$i].replace("Schema: ", "")
                    $schemas += $schema
                    $count++
                    "$count. $schema"
                }
            }

            $newSchema = Read-Host -Prompt 'Use another schema for this User? (y/n)'
        }

        $continue = Read-Host -Prompt 'Add a schema for another User? (y/n)'
    }
}

function getSchema {
    $schema = ""
    while($schema -eq "") {
        $schema = Read-Host -Prompt 'Input Schema (Required)'
    }
    return $schema
}