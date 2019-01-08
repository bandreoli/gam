function driveOptions {
    $continue = 1

    while($continue -eq 1) {
        'Drive Options'
        '1. Transfer Drive Documents'
        '2. Transfer Drive Document To Archive'
        '3. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {transferDriveDocuments}
            2 {transferDriveDocumentsArchive}
            3 {$continue = 0}
        }
    }
}

function transferDriveDocuments {
    $continue = 'y'

    while($continue -eq 'y') {
        "Transferring drive documents from one user to another"
        "User one is tranferring their documents to user two"

        $userone = Read-Host -Prompt 'Enter email one'

        $usertwo = Read-Host -Prompt 'Enter email two'

        gam user $userone transfer drive $usertwo

        $continue = Read-Host -Prompt 'Transfer another users documents? (y/n)'
        ''
    }
}

function transferDriveDocumentsArchive {
    $continue = 'y'

    while($continue -eq 'y') {
        "Transferring drive documents from a user to archive"

        $userone = Read-Host -Prompt 'Enter email'

        gam user $userone transfer drive "archive@carrolltest.org"

        $continue = Read-Host -Prompt 'Transfer another users documents to archive? (y/n)'
        ''
    }
}