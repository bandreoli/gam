function userOptions {
    $continue = 1

    while($continue -eq 1) {
        'User Options:'
        '1. Get User Info'
        '2. Create User'
        '3. Update User'
        '4. Delete User'
        '5. Set Basic Password'
        '6. Search For Users By Name'
        '7. Create Carroll User'
        '10. Return'

        $option = Read-Host -Prompt 'Enter Here'
        ''

        switch($option) {
            1 {getUserInfo}
            2 {createUser}
            3 {updateUser}
            4 {deleteUser}
            5 {setBasicPassword}
            6 {getUsersByName}
            7 {carrollUser}
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
            $changepasswordcom = " changepassword '$changepassword'"
        }
        $org = Read-Host -Prompt 'OU'
        if($org -ne '') {
            $orgcom = " org '$org'"
        }
        $command = "gam create user '$username' firstname '$firstname' lastname '$lastname' password '$password' $changepasswordcom $orgcom"

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

function getUsersByName {
    $continue = 'y'

    while($continue -eq 'y') {
        "Searching for users by name"

        $name = Read-Host -Prompt 'Fullname'

        iex "gam print users allfields query name:'$name'"

        $continue = Read-Host -Prompt 'Search for another user? (y/n)'
        ''
    }
}

function carrollUser {
    $continue = 'y'

    while($continue -eq 'y') {
        'Creating Carroll User'
        'Choose User Type'
        '1. Student'
        '2. Staff/Faculty'
        $userType = Read-Host -Prompt 'Enter Here'

        $firstname = Read-Host -Prompt 'Enter First Name'
        $lastname = Read-Host -Prompt 'Enter Last Name'

        if($userType -eq 1) {
            $grade = Read-Host -Prompt 'Enter Year of Graduation (yyyy)'
            $password = Read-Host -Prompt 'Enter Password (mmddyyyy)'
            $username = ($firstname[0] + $lastname + $grade[2] + $grade[3]).ToLower()
            $email = $username + "@stu.carrollschool.org"

            'Pick A School'
            '1. Upper'
            '2. Middle'
            '3. Lower'
            $school = Read-Host -Prompt 'Enter Here'

            if($school -eq 1) {
                $ou = "Students/Upper School/YOG " + $grade[2] + $grade[3]
            } elseif($school -eq 2) {
                $ou = "Students/Middle School/YOG " + $grade
            } elseif($school -eq 3) {
                $ou = "Students/Lower School/YOG " + $grade
            }

            iex "gam create user $username firstname $firstname lastname $lastname password $password org '$ou'"
        } elseif($userType -eq 2) {
            $grade = Read-Host -Prompt 'Enter Grade'
            $username = ($firstname[0] + $lastname).ToLower() 
            $email = $username + "@carrollschool.org"
            
            gam create user $username firstname $firstname lastname $lastname password $password changepassword on org $ou
        }

        $continue = Read-Host -Prompt 'Create another Carroll user? (y/n)'
        ''
    }
}

function getUser {
    $username = ""
    while($username -eq "") {
        $username = Read-Host -Prompt 'Input Username (Required)'
    }
    return $username
}