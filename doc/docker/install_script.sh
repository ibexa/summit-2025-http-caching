#!/bin/bash

# Dumping autoload using --optimize-autoloader to keep performenace on a usable level, not needed on linux host.
# Second chown line:  For dev and behat tests we give a bit extra rights, never do this for prod.

for i in $(seq 1 3); do
    composer install --no-progress --no-scripts --no-interaction --prefer-dist --optimize-autoloader && s=0 && break || s=$? && sleep 1
done
if [ "$s" != "0" ]; then
    echo "ERROR : composer install failed, exit code : $s"
    exit $s
fi
mkdir -p public/var

# Avoid Composer/Flex asking interactive questions that cannot be automated by adding files to git
git init
git add config/.
git add templates/.
git add assets/.
git add *.js
git add package.json
# TMP to avoid specyfing all files
git add .
composer recipes:install --force

# add new files to git
git add .

# Reinstall Ibexa recipes
PROJECT_VARIANT=$(composer info -D -N | grep -E "ibexa/content|ibexa/oss|ibexa/experience|ibexa/commerce")
composer recipes:install ${PROJECT_VARIANT} --force

if [ "${INSTALL_DATABASE}" == "1" ]; then 
    export DATABASE_URL=${DATABASE_PLATFORM}://${DATABASE_USER}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME}?serverVersion=${DATABASE_VERSION}

    php /scripts/wait_for_db.php
    php bin/console ibexa:install
    if [ "$APP_CMD" != '' ]; then
        echo '> Executing' "$APP_CMD"
        php bin/console $APP_CMD
    fi
    echo 'Dumping database into doc/docker/entrypoint/mysql/2_dump.sql for use by mysql on startup.'
    mysqldump -u $DATABASE_USER --password=$DATABASE_PASSWORD -h $DATABASE_HOST --add-drop-table --extended-insert  --protocol=tcp $DATABASE_NAME > doc/docker/entrypoint/mysql/2_dump.sql
fi
