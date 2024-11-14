#!/bin/bash
# Configuración del entorno de pruebas para Laravel

echo "Setting up test environment..."

# Laravel test environment setup
php artisan test --env=testing --parallel

echo "Test environment ready!"