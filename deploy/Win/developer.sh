#!/bin/bash
# Configuración de despliegue en desarrolo para Laravel
# Deploy configuration for Laravel in development

echo "Deploying in development mode..."

#Check if .env is not present
if [ ! -f .env ]; then
    echo "File .env not found. Copying .env.example to .env"
    cp .env.example .env
if

# Install dependencies
echo "Installing dependencies..."
composer install
npm install

# Generate key
echo "Generating key..."
php artisan key:generate

# Migrate database
echo "Migrating database..."
php artisan migrate --seed

# Seed database
echo "Seeding database..."
php artisan db:seed

# Optimize
echo "Optimizing..."
php artisan optimize

# Clear cache
echo "Clearing cache..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# End Script
echo "End of script"