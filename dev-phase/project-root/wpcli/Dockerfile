FROM wordpress:cli

# Switch to root for package installation
USER root

# Install bash and coreutils (for better scripting support)
RUN apk add --no-cache bash coreutils

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Switch back to www-data user
USER www-data

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]