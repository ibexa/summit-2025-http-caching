# About this repo

The code in this repo was used for the presentation "The Art of Caching" at Ibexa Summit 2025.

## The branches

The repo has two branches:
- main: Code when the presentation started.
- solution: Fixes problems that were discussed during the presentation.

## Installation

When installing it, you may follow our general and official installation documentation outlined in the "Installation"
chapter.

However, there is a shortcut if you have docker already installed:

```
    git clone https://github.com/ibexa/summit-2025-http-caching.git
    cd summit-2025-http-caching
    mkdir external; cd external; git clone https://github.com/vidarl/ezp-toolkit.git; cd ..

    # Add your [Ibexa and github credentials](https://doc.ibexa.co/en/latest/getting_started/install_ibexa_dxp/#set-up-authentication-tokens) to auth.json

    docker compose up -d --remove-orphans
    
    # FYI : db container will automatically import doc/docker/entrypoint/mysql/2_dump.sql on creation.
```

At this point, the containers should be running. Next, install the DXP dependencies inside the app container:

```
    docker compose exec --user www-data app composer install
    docker compose exec --user www-data app php bin/console ibexa:graphql:generate-schema
    docker compose exec --user www-data app php bin/console c:c

```

Ibexa is configured using `Map\Host` matching. Add the following to your hosts file:
```
127.0.0.1   admin.localhost
```

Ps : Modifying your `hosts` file as mentioned above might not be needed as some systems will automatically resolve *.localhost.

Once resolving is working, you might access the site using the following URLs:
- web : http://localhost:8080/
- varnish : http://localhost:8081/
- admin-ui : http://admin.localhost:8080/

## Enable Fastly CLI (optional)

If you also deploy the installation behind Fastly and you want to be able to use Fastly's CLI, you need to add your
Fastly service id and token in .env :

```
FASTLY_SERVICE_ID=your_fastly_serivce_id
FASTLY_KEY=your_token
```

Next, re-run `docker compose up -d --remove-orphans` and you should be set.

You may then use :
 - The Fastly CLI inside the fastly-cli container
 - Access web server on port 8080
 - Access via varnish on port 8081
 - run bin/console, composer etc. from the app container

# Ibexa Flex website skeleton

This is a Symfony Flex website skeleton allowing installation of all editions of
[Ibexa DXP](https://www.ibexa.co/products) and Ibexa Open Source.

## Installation

For installation instructions of Ibexa DXP see either
[the official documentation](https://doc.ibexa.co/) or packages for specific editions:
* [Ibexa Headless](https://github.com/ibexa/headless)
* [Ibexa Experience](https://github.com/ibexa/experience)
* [Ibexa Commerce](https://github.com/ibexa/commerce)

Ibexa DXP is licensed under Ibexa Business Use License Agreement (Ibexa BUL) and requires
a subscription. Learn more about [Ibexa DXP](https://www.ibexa.co/products).

For installation instructions of Ibexa Open Source see [ibexa/oss](https://github.com/ibexa/oss)
package.

## COPYRIGHT
Copyright (C) 1999-2024 Ibexa AS (formerly eZ Systems AS). All rights reserved.

## LICENSE
This source code is available separately under the following licenses:

A - Ibexa Business Use License Agreement (Ibexa BUL),
version 2.3 or later versions (as license terms may be updated from time to time)
Ibexa BUL is granted by having a valid Ibexa DXP (formerly eZ Platform Enterprise) subscription,
as described at: https://www.ibexa.co/product
For the full Ibexa BUL license text, please see:
https://www.ibexa.co/software-information/licenses-and-agreements (latest version applies)

AND

B - GNU General Public License, version 2
Grants an copyleft open source license with ABSOLUTELY NO WARRANTY. For the full GPL license text, please see:
- LICENSE file placed in the root of this source code, or
- https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
