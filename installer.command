checkXCode () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    echo "Checking xcode-select..."

    xcodeversion="$(xcode-select --version)"
    if [ "${xcodeversion:0:1}" = "x" ]; then
        echo "xcode-select check success!"
        echo "Current xcode version: ${xcodeversion}"
        echo
        echo "Please verify that xcode version is 2395 or later."
        echo
        echo "======================================================================"
        read -p "Confirm? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
    else
        echo "xcode-select check failed."
        echo "The program will run the following command to install xcode:"
        echo "xcode-select --install"
        echo
        echo "Please confirm to install xcode."
        echo
        echo "======================================================================"
        read -p "Install xcode-select? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
        xcode-select --install
        checkXCode
    fi
}


checkHomebrew () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    echo "Checking Homebrew..."

    homebrewversion="$(brew --version)"
    if [ "${homebrewversion:0:1}" = "H" ]; then
        echo "Homebrew check success!"
        echo "Current Homebrew version: ${homebrewversion}"
        echo
        echo "Please verify that Homebrew version is 3.6.6 or later."
        echo
        echo "======================================================================"
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
        echo "======================================================================"
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


checkPython () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    echo "Checking Python..."

    pythonversion="$(python3 --version)"
    if [ "${pythonversion:0:1}" = "P" ]; then
        echo "Python check success!"
        echo "Current Python version: ${pythonversion}"
        echo
        echo "Please verify that Python version is 3.8 or later."
        echo
        echo "======================================================================"
        read -p "Confirm? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
    else
        echo "Python check failed."
        echo "The program will run the following command using Homebrew to install Python:"
        echo "brew install python@3.8"
        echo
        echo "Please confirm to install Python."
        echo
        echo "======================================================================"
        read -p "Install Python? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
        brew install python@3.8
        checkPython
    fi
}


installOdoo () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    cd ~/Desktop
    echo "Desktop Path: $(pwd)"
    echo
    echo "The program will create a directory on your Desktop titled:"
    echo "'Odoo'"
    echo "and run the following command using git to install Odoo:"
    echo "git clone https://github.com/odoo/odoo.git --depth1"
    echo 
    if [ -d "odoo" ]; then
        echo
        echo "'Odoo' directory found, please delete before continuing."
    fi
    echo
    echo "Please confirm that this file does not already exist on your Desktop,"
    echo "and that the path listed above is the correct path of your Desktop."
    echo
    echo "======================================================================"
    read -p "Install Odoo? (y/n): " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    if [ -d "odoo" ]; then
        installOdoo
        return 1
    fi
    mkdir Odoo
    cd Odoo
    git clone https://github.com/odoo/odoo.git --depth 1
}


installSetupToolsandWheel () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    cd odoo
    echo "Current Path: $(pwd)"
    echo
    echo "The program will run the following command using pip3 to install"
    echo "the setup tools and wheel:"
    echo "pip3 install setuptools wheel"
    echo
    echo "Please confirm that this current path listed above is .../Odoo/odoo"
    echo
    echo "======================================================================"
    read -p "Install Setup Tools and Wheel? (y/n): " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    pip3 install setuptools wheel
}


installRequirements () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    cd odoo
    echo "Current Path: $(pwd)"
    echo
    echo "The program will run the following command using pip3 to install"
    echo "the requirements:"
    echo "pip3 install -r requirements.txt"
    echo
    echo "Please confirm that this current path listed above is .../Odoo/odoo"
    echo
    echo "======================================================================"
    read -p "Install Requirements? (y/n): " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    pip3 install -r requirements.txt
}


checkPostgres () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    echo "Checking PostgreSQL..."

    postgresversion="$(postgres --version)"
    if [ "${postgresversion:0:1}" = "p" ]; then
        echo "PostgreSQL check success!"
        echo "Current PostgreSQL version: ${postgresversion}"
        echo
        echo "Please verify that PostgreSQL version is 14.5 or later."
        echo
        echo "======================================================================"
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
        echo "======================================================================"
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


checkOpenSSL () {
    clear
    echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
    echo
    echo "Checking LibreSSL..."

    opensslversion="$(openssl version)"
    if [ "${opensslversion:0:1}" = "L" ]; then
        echo "LibreSSL check success!"
        echo "Current LibreSSL version: ${openssl}"
        echo
        echo "Please verify that LibreSSL version is 2.8.3 or later."
        echo
        echo "======================================================================"
        read -p "Confirm? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
    else
        echo "LibreSSL check failed."
        echo "The program will run the following command to install LibreSSL:"
        echo "brew install openssl"
        echo
        echo "Please confirm to install LibreSSL."
        echo
        echo "======================================================================"
        read -p "Install LibreSSL? (y/n): " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
            exit 1
        fi
        brew install openssl
        checkOpenSSL
    fi
}




clear
echo "==================== PUNCHBOYS ODOO INSTALLER 1.0 ===================="
echo
echo "Welcome to Punch Boys ODOO installer for Mac and Linux OS."
echo
echo "Checking architecture..."

archname="$(uname -m)"
if [ "${archname}" = "arm64" ]; then
    echo "Architecture check success!"
    echo "Currently operating on: ${archname}"
else
    echo "Unknown architecture: ${archname}. Aborting..."
fi

echo
echo "This program will verify/install the following requirements:"
echo
echo "  - Xcode-select version 2395 or later"
echo "  - Homebrew version 3.6.8 or later"
echo "  - Python 3.8 or later"
echo "  - ODOO version 16"
echo "  - Pip 22.3 or later"
echo "  - PostgreSQL version 14.5 or later"
echo "  - LibreSSL version 2.8.3 or later"
echo
echo "======================================================================"
read -p "Proceed? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

checkXCode
checkHomebrew
checkPython
installOdoo
installSetupToolsandWheel
installRequirements
checkPostgres
checkOpenSSL