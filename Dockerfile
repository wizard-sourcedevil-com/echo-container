# Use an official lightweight base image
# from ubi base image
# https://catalog.redhat.com/software/containers/ubi8/ubi-minimal/5c359b7bbed8bd75a3b1b1b6?container-tabs=overview
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Install bash
RUN microdnf install bash && microdnf clean all

# Copy the bash script to the container
ADD entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
