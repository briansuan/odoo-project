startOdoo () {
    clear
    echo "==================== PUNCHBOYS ODOO LAUNCHER 1.0 ===================="
    echo
    cd ~/Desktop/Odoo/odoo
    echo "Current Path: $(pwd)"
    echo
    echo "The program will run the following command to start ODOO:"
    echo
    echo "python3 odoo-bin -i base -d db15 --limit-memory-hard 0"
    echo
    echo "If done successfully, connect to ODOO via web browser and enter"
    echo "localhost:8069"
    echo "to enter ODOO. Login with admin as username and password."
    echo
    echo "Note: Please made sure this program is in the odoo folder with odoo-bin"
    echo
    echo "To terminate ODOO, press Control + C"
    echo
    echo "====================================================================="
    read -p "Launch ODOO? (y/n): " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    python3 odoo-bin -i base -d db15 --limit-memory-hard 0
}


clear
echo "==================== PUNCHBOYS ODOO LAUNCHER 1.0 ===================="
echo
echo "Welcome to Punch Boys ODOO Lanucher for Mac OS!"
echo
echo "Checking architecture..."

archname="$(uname -m)"
if [ "${archname}" = "arm64" ]; then
    echo "Architecture check success!"
    echo "Currently operating on: ${archname}"
else
    echo "Unknown architecture: ${archname}. Aborting..."
    echo
    echo "====================================================================="
    exit 1
fi

echo
echo "This program will check for the odoo-bin file and lanuch ODOO."
echo
echo "====================================================================="
read -p "Proceed? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

startOdoo