# OpenSCAP Compliance Checks for Containers

This guide provides instructions on how to implement OpenSCAP compliance checks for Docker containers, with a focus on FedRAMP compliance. By following these steps, Cloud Service Providers (CSPs) can demonstrate their capability to perform SCAP scanning at the container level and retrieve the results using GitHub Actions.

## Prerequisites

Before you begin, ensure you have the following:

- A GitHub account and basic understanding of GitHub repositories.
- Docker installed on your machine. Installation guides for Docker can be found [here](https://docs.docker.com/get-docker/).
- Basic familiarity with Docker and creating Dockerfiles.

## Setup

1. **Fork and Clone the Repository**

   Start by forking the repository containing the Docker and GitHub Actions setup for OpenSCAP compliance checks. Then, clone your forked repository to your local machine.

2. **Understanding the Dockerfile**

   The `Dockerfile` in the root of the repository is prepared to set up an environment with OpenSCAP installed on a CentOS base image. This environment is designed to run compliance checks against containers for FedRAMP requirements.

   Review the `Dockerfile` to understand how the OpenSCAP tools are installed and configured. You may need to modify the OpenSCAP command and profiles according to your specific compliance requirements.

3. **GitHub Actions Workflow**

   The `.github/workflows/openscap.yml` file defines a GitHub Actions workflow that automates the process of building the Docker image, running the OpenSCAP compliance check within a container, and retrieving the results.

   This workflow is triggered on every push to the repository, ensuring continuous compliance checking.

## Running Compliance Checks

To run a compliance check, simply push changes to your repository or manually trigger the GitHub Actions workflow:

1. Navigate to the "Actions" tab in your GitHub repository.
2. Find the "OpenSCAP Compliance Check" workflow.
3. Click "Run workflow" to manually trigger a scan.

The workflow will automatically build the Docker image, run the compliance check, and upload the results as an artifact.

## Retrieving Results

After the GitHub Actions workflow completes:

1. Navigate to the "Actions" tab in your GitHub repository.
2. Click on the latest run of the "OpenSCAP Compliance Check" workflow.
3. Under "Artifacts", you will find the `openscap-results` artifact containing the compliance check results and report. Click on it to download.

## Customization

To tailor the compliance checks to specific FedRAMP requirements or different base images:

- **Dockerfile**: Modify the `Dockerfile` to use different base images or install additional tools.
- **OpenSCAP Command**: Adjust the OpenSCAP command in the `Dockerfile` to use different profiles or options suitable for your compliance needs.
- **GitHub Actions Workflow**: Edit the `.github/workflows/openscap.yml` file to change the workflow behavior, such as triggering conditions or steps.

## Support

For additional help or to report issues, please create an issue in the GitHub repository or consult the OpenSCAP [documentation](https://www.open-scap.org/documentation/).

