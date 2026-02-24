# Use official Liquibase image as base
FROM liquibase/liquibase:latest

# Install PostgreSQL JDBC driver
ADD https://jdbc.postgresql.org/download/postgresql-42.7.3.jar /liquibase/lib/

# Copy Liquibase changelogs and properties into the image
COPY changelog-master.xml /liquibase/
COPY changelog/ /liquibase/changelog/
COPY liquibase.properties /liquibase/

# Default working directory
WORKDIR /liquibase

# Default entrypoint (can be overridden by Kubernetes Job)
ENTRYPOINT ["liquibase"]