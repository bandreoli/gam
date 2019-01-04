function userOptions {
    $continue = 1

    while($continue -eq 1) {
        'User Options:'
        '1. Get User Info'
        '2. Create User'
        '3. Update User'
        '4. Delete User'
        '5. Set Basic Password'
        '6. Transfer Drive Documents'
        '10. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getUserInfo}
            2 {createUser}
            3 {updateUser}
            4 {deleteUser}
            5 {setBasicPassword}
            6 {transferDriveDocuments}
            10 {$continue = 0}
        }
    }
}

function getUserInfo {
    $continue = 'y'

    while($continue -eq 'y') {
        'Getting User Info'
        $username = getUser

        gam info user $username

        $continue = Read-Host -Prompt 'Get info from another user? (y/n)'
        ''
    }
}

function createUser {
    $continue = 'y'

    while($continue -eq 'y') {
        'Creating New User'
        $username = getUser
        $firstname = ""
        $lastname = ""
        $password = ""

        while($firstname -eq '') {
            $firstname = Read-Host -Prompt 'Firstname (Required)'
        }
        while($lastname -eq '') {
            $lastname = Read-Host -Prompt 'Lastname (Required)'
        }
        while($password -eq '') {
            $password = Read-Host -Prompt 'Password (Required)'
        }
        $changepassword = Read-Host -Prompt 'Change Password on Login? (on/off)'
        if($changepassword -ne '') {
            $changepasswordcom = ' changepassword $changepassword'
        }
        $org = Read-Host -Prompt 'OU'
        if($org -ne '') {
            $orgcom = ' org $org'
        }
        $command = "gam create user $username firstname $firstname lastname $lastname password $password $changepasswordcom $orgcom"

        iex $command

        $continue = Read-Host -Prompt 'Create another user? (y/n)'
        ''
    }
}

function updateUser {
    $continue = 'y'

    while($continue -eq 'y') {
        'Updating User'
        'Leave option blank if you don''t want it modified' 
        $username = getUser

        $newusername = Read-Host -Prompt 'New Username'
        if($newusername -ne '') {
            $newusernamecom = ' username $newusername'
        }
        $firstname = Read-Host -Prompt 'Firstname'
        if($firstname -ne '') {
            $firstnamecom = ' firstname $firstname'
        }
        $lastname = Read-Host -Prompt 'Lastname'
        if($lastname -ne '') {
            $lastnamecom = ' lastname $lastname'
        }
        $password = Read-Host -Prompt 'Password'
        if($password -ne '') {
            $passwordcom = ' password $password'
        }
        $changepassword = Read-Host -Prompt 'Change Password on Login? (on/off)'
        if($changepassword -ne '') {
            $changepasswordcom = ' changepassword $changepassword'
        }
        $org = Read-Host -Prompt 'OU'
        if($org -ne '') {
            $orgcom = ' org $org'
        }

        $command = "gam update user $username $newusernamecom $firstnamecom $lastnamecom $passwordcom $changepasswordcom $orgcom"

        iex $command

        $continue = Read-Host -Prompt 'Update another user? (y/n)'
        ''
    }
}

function deleteUser {
    $continue = 'y'

    while($continue -eq 'y') {
        'Deleting User'
        $username = getUser

        $delete = Read-Host -Prompt "Are you sure you want to delete $username ? (y/n)"

        if($delete -eq 'y') {
            gam delete user $username
        }

        $continue = Read-Host -Prompt 'Delete another user? (y/n)'
        ''
    }
}

function setBasicPassword {
    $continue = 'y'

    while($continue -eq 'y') {
        "Setting the basic password 'Password123' for a user"
        $username = getUser

        gam update user $username password 'Password123' changepassword on

        $continue = Read-Host -Prompt 'Set a basic password for another user? (y/n)'
        ''
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

function getUser {
    $exists = 1
    while($exists -eq 1) {
        $username = ""
        while($username -eq "") {
            $username = Read-Host -Prompt 'Input Username (Required)'
        }
        $exists = 0
    }
    return $username
}