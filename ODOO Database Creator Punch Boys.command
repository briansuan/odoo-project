checkHomebrew () {
    clear
    echo "==================== PUNCHBOYS DATABASE CREATOR 1.0 ===================="
    echo
    echo "Checking Homebrew..."

    homebrewversion="$(brew --version)"
    if [ "${homebrewversion:0:1}" = "H" ]; then
        echo "Homebrew check success!"
        echo
        echo "Current Homebrew version: ${homebrewversion}"
        echo
        echo "Please verify that Homebrew version is 3.6.6 or later."
        echo
        echo "========================================================================"
        read -p "Confirm? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
    else
        echo "Homebrew check failed."
        echo "The program will run the following command to install Homebrew:"
        echo "/bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo
        echo "Please confirm to install Homebrew."
        echo
        echo "========================================================================"
        read -p "Install Homebrew? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        checkHomebrew
    fi
}


checkPostgres () {
    clear
    echo "==================== PUNCHBOYS DATABASE CREATOR 1.0 ===================="
    echo
    echo "Checking PostgreSQL..."

    postgresversion="$(postgres --version)"
    if [ "${postgresversion:0:1}" = "p" ]; then
        echo "PostgreSQL check success!"
        echo
        echo "Current PostgreSQL version: ${postgresversion}"
        echo
        echo "Please verify that PostgreSQL version is 14.5 or later."
        echo
        echo "========================================================================"
        read -p "Confirm? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
    else
        echo "PostgreSQL check failed."
        echo "The program will run the following command to install PostgreSQL:"
        echo "brew install postgresql"
        echo
        echo "Please confirm to install PostgreSQL."
        echo
        echo "========================================================================"
        read -p "Install PostgreSQL? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
        brew install postgresql
        checkPostgres
    fi
}


startPostgresql () {
    clear
    echo "==================== PUNCHBOYS DATABASE CREATOR 1.0 ===================="
    echo
    echo "The program will run the following command using Homebrew to start a"
    echo "PostgreSQL server:"
    echo
    echo "brew services restart postgresql"
    echo
    echo "========================================================================"
    read -p "Start PostgreSQL server? (y/n): " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    brew services start postgresql
}


enterPostgresql () {
    clear
    echo "==================== PUNCHBOYS DATABASE CREATOR 1.0 ===================="
    echo
    echo "Current Path: $(pwd)"
    echo
    echo "The program will run the following command to enter PostgreSQL:"
    echo "psql postgres"
    echo
    echo "Once in PostgreSQL, use the following commands to create a user:"
    echo
    echo "-  create user <YOUR NAME>  : creates a user with your name"
    echo "-  createdb <YOUR DATABASE NAME>  : creates a database with given name"
    echo "-  \l  : list databases (not required)"
    echo "-  \q  : exit PostgreSQL"
    echo
    echo "Note: the program will terminate once completed."
    echo
    echo "========================================================================"
    read -p "Open PostgreSQL? (y/n): " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    psql postgres
}


congrats () {
    clear
    echo "==================== PUNCHBOYS DATABASE CREATOR 1.0 ===================="
    echo
    echo "Thank you for using Punch Boy's Database Creator!"
    echo "Please run Punch Boy's ODOO Launcher to start ODOO."
    echo
    echo "========================================================================"
    exit 1
}


clear
echo "==================== PUNCHBOYS DATABASE CREATOR 1.0 ===================="
echo
echo "Welcome to Punch Boys Database Creator for Mac OS!"
echo
echo "Checking architecture..."

archname="$(uname -m)"
if [ "${archname}" = "arm64" ]; then
    echo "Architecture check success!"
    echo
    echo "Currently operating on: ${archname}"
else
    echo "Unknown architecture: ${archname}. Aborting..."
    echo
    echo "========================================================================"
    exit 1
fi

echo
echo "This program will verify/install the following requirements:"
echo
echo "  - Homebrew version 3.6.8 or later"
echo "  - PostgreSQL version 14.5 or later"
echo "  - a PostgreSQL account and databate"
echo
echo "and use the following Homebrew command to start a PostgreSQL server:"
echo
echo "brew services"
echo
echo "========================================================================"
read -p "Proceed? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

checkHomebrew
checkPostgres
startPostgresql
enterPostgresql
congrats