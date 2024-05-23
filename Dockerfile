# Use CentOS as the base image
FROM centos:7

# Install OpenSCAP and necessary packages
RUN yum -y update && \
    yum -y install openscap-scanner scap-security-guide

# Create a directory for the results
RUN mkdir -p /results

# Set the working directory
WORKDIR /usr/share/xml/scap/ssg/content

# Copy the content to the container (add this line)
COPY ssg-centos7-ds.xml .

# This command will be overridden by whatever command is run by the docker container at startup.
CMD ["oscap", "xccdf", "eval", "--profile", "xccdf_org.ssgproject.content_profile_standard", "--results", "/results/results.xml", "--report", "/results/report.html", "ssg-centos7-ds.xml"]

