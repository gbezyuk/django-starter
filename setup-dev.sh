#!/bin/sh
echo 'This script will setup Django Starter project development environemnt for you\n'

echo 'Creating python3 virtual environment'
virtualenv -p python3 venv
echo '\n'

echo 'Activating virtual environment'
source venv/bin/activate
echo '\n'

echo 'Installing dependencies'
pip install -r requirements.txt
echo '\n'

echo 'Compiling translations; you need to have gettext installed'
cd core
../manage.py compilemessages -l ru
cd ..
echo '\n'

echo 'Initializing database structure'
./manage.py migrate
echo '\n'

echo 'Installing fixtures'
#echo ' - subway'
#./manage.py loaddata subway/fixtures/spb.json
echo '\n'

echo 'All done. you are ready to activate your virtual environment, create superuser and run the development server'
echo "Use 'source venv/bin/activate', then './manage.py createsuperuser' and './manage.py runserver_plus'"
