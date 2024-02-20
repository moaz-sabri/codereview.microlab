# Enable mod_rewrite and install required PHP extensions
# Use the official PHP image with PHP 8.2
FROM php:8.2-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Enable the Apache rewrite module
RUN a2enmod rewrite

# Install Composer
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip

RUN wget -q https://getcomposer.org/download/2.1.6/composer.phar -O /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

# # Install PHP Composer
# RUN install composer

# Install PHP extensions (mysqli, pdo, pdo_mysql)
RUN docker-php-ext-install mysqli pdo pdo_mysql


# Copy your application source code into the container
COPY . /var/www/html

RUN mkdir -p /var/www/html && chmod -R 755 /var/www/html
RUN chown -R root:root /var/www/html

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Start the Apache web server
CMD ["apache2-foreground"]