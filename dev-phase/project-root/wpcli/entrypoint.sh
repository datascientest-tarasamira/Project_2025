#!/bin/sh
set -e

# Wait for WordPress to be ready (both files and database)
wait_for_wordpress() {
    echo "Waiting for WordPress to be ready..."
    
    # Wait for wp-config.php to be created
    while [ ! -f /var/www/html/wp-config.php ]; do
        sleep 5
    done
    
    # Wait for database connection
    until wp db check >/dev/null 2>&1; do
        echo "Database not ready yet - sleeping"
        sleep 10
    done
}

# Install WordPress if not already installed
install_wordpress() {
    if ! wp core is-installed; then
        echo "Installing WordPress..."
        wp core install \
            --url="http://localhost" \
            --title="My Site" \
            --admin_user="admin" \
            --admin_password="password" \
            --admin_email="admin@example.com"
        echo "WordPress installed successfully!"
    else
        echo "WordPress is already installed."
    fi
}

# Main execution
wait_for_wordpress
install_wordpress

# Keep container running for debugging (remove in production)
tail -f /dev/null