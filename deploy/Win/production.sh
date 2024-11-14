#!/bin/bash
# Deploy configuration for Laravel in production

# Charge configuration variables
source deploy/Win/Vars/windows.sh

#Upload files server (example in windows)
echo "Uploading files to server..."
scp -P $PORT_SERVER -r . $USER_SERVER@$HOST_SERVER:$PATH_SERVER

# Connect to server
echo "Connecting to server..."
ssh -p $PORT_SERVER $USER_SERVER@$HOST_SERVER << EOF
    # Go to Laravel path
    cd $PATH_SERVER/$LARAVEL_PATH_CMS

    # Update repository
    echo "Updating repository..."
    git pull origin $GIT_ORIGIN_BRANCH

    # Install dependencies
    echo "Installing dependencies..."
    composer install --no-dev
    npm install --no-dev

    # Migrate database
    echo "Migrating database..."
    php artisan migrate --force

    # Clear cache
    echo "Clearing cache..."
    php artisan cache:clear
    php artisan config:clear
    php artisan route:clear
    php artisan view:clear

    # Optimize
    echo "Optimizing..."
    php artisan optimize

    # Exit
    exit
EOF