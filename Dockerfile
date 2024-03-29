# Use CentOS as the base image
FROM centos:7

# Install OpenSCAP
RUN yum -y update && \
    yum -y install openscap-scanner scap-security-guide

# Set the working directory
WORKDIR /usr/share/xml/scap/ssg/content

# This command will be overridden by whatever command is run by the docker container at startup.
# Here it's just an example to show how to run a compliance check.
CMD ["oscap", "xccdf", "eval", "--profile", "xccdf_org.ssgproject.content_profile_standard", "--results", "/results/results.xml", "--report", "/results/report.html", "/usr/share/xml/scap/ssg/content/ssg-centos7-ds.xml"]
