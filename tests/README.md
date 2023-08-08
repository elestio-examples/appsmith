<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# AppSmith, verified and packaged by Elestio

A better community platform for the modern web.

[AppSmith](https://www.appsmith.com/) is a OpenSource Internal Tool Builder

<img src="https://github.com/elestio-examples/appsmith/raw/main/appsmith.png" alt="outline" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/castopod">fully managed AppSmith</a> on <a target="_blank" href="https://elest.io/">elest.io</a> Application for Internal Tool Builder for Startups and Enterprises.

[![deploy](https://github.com/elestio-examples/appsmith/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/appsmith)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/appsmith.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:1780`

## Docker-compose

Here are some example snippets to help you get started creating a container.

        version: "3.3"
        services:
        appsmith:
            image: elestio4tech/appsmith:${SOFTWARE_VERSION_TAG}
            ports:
            - "172.17.0.1:1780:80"
            # - "172.17.0.1:1443:443"
            volumes:
            - ./stacks:/appsmith-stacks
            restart: always
            # Uncomment the lines below to enable auto-update
            labels:
            com.centurylinklabs.watchtower.enable: "true"

        auto_update:
        image: containrrr/watchtower:${WATCHTOWER_TAG}
        volumes:
            - ./dockerSock:/var/run/docker.sock
        # Update check interval in seconds.
        command: --schedule "0 0 * ? * *" --label-enable --cleanup
        restart: always
        depends_on:
            - appsmith
        environment:
            - WATCHTOWER_LIFECYCLE_HOOKS=${WATCHTOWER_LIFECYCLE_HOOKS}

### Environment variables

|          Variable          | Value (example) |
| :------------------------: | :-------------: |
|    SOFTWARE_VERSION_TAG    |     latest      |
|       WATCHTOWER_TAG       |     latest      |
| WATCHTOWER_LIFECYCLE_HOOKS |      true       |

# Maintenance

## Logging

The Elestio AppSmith Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://www.appsmith.com/">Appsmith documentation</a>

- <a target="_blank" href="https://github.com/appsmithorg/appsmith">Appsmith Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/appsmith">Elestio/AppSmith Github repository</a>
