#!/bin/bash

# Update package repositories
sudo apt update

# Install PostgreSQL
sudo apt install -y postgresql

# Start the PostgreSQL service
sudo systemctl start postgresql

# Enable the PostgreSQL service to start on boot
sudo systemctl enable postgresql

# Create a new PostgreSQL database
sudo -u postgres psql -c "CREATE DATABASE your_database_name;"

# Set a password for the PostgreSQL user 'postgres'
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'your_password';"

# Allow remote connections to PostgreSQL (optional, if needed)
# Update the PostgreSQL configuration file
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/*/main/postgresql.conf

# Allow remote connections from any IP address (not recommended for production)
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf > /dev/null

# Restart PostgreSQL for the changes to take effect
sudo systemctl restart postgresql

# Done!
echo "PostgreSQL installation and database creation completed."
