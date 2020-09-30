# Releases instructions for projects developers/maintainers

Releases are intended to deliver easy to use (and if possible plug-and-play) solution for testing and marketing teams to test, use or demonstrate the project.

## Requirements

- Projects repositories should contain a folder for latest stable source code (i.e: [k8-reverse-proxy/stable-src](https://github.com/k8-proxy/k8-reverse-proxy/tree/master/stable-src)).

- For projects that run a service, the repositories should include all files required to build and run the service as a docker container (example: [filetrust/c-icap](https://github.com/filetrust/c-icap)).

- Provide clear and working [markdown](https://guides.github.com/features/mastering-markdown) guides that explain requirements and steps to build and deploy the project, as well as to use/test the project.

- Video instructions, especially for complex projects.

- For projects that don't provide a service, but has to build/package the project, it's mandatory to have files required to build the artifact/package with docker.

- Provide release notes. 

## General instructions:

- Every release request has to be sent before Wednesday 10 am BST (weekly), so it can be planned on Wednesday and released on Thursday. 
- QA process has to be followed by each DM after the release is sent.
